#!/bin/bash

# fail on error
set -e

# globals
mnemosyne_ip="192.168.0.26"
mnemosyne_mac="fc:3f:db:0d:d0:16"

clio_ip="192.168.0.30"
poseidon_ip="192.168.0.8"
poseidon_mac="3c:52:82:6c:1e:bc"

mnemosyne_prune_id="s-59b5d519-ce09"
mnemosyne_gc_datastore="primary"
mnemosyne_sync_id="s-c54aa391-2be4"

clio_prune_id="s-c3524365-3a8e"
clio_gc_datastore="primary"

# before backup
if [[ "$1" == "job-init" ]]; then
    # if host is shutdown (likely)
    if $(ssh root@$mnemosyne_ip exit 2>&1 | grep -q "No route to host"); then
        # turn host on via wakeonlan
        echo "VZDUMP_DELTA: Mnemosyne unreachable, starting via WoL now"
        touch /tmp/mnemosyne.shutdown  # tell the script to shutdown the host later
        wakeonlan $mnemosyne_mac

        # wait until it starts up
        until ! $(ssh root@$mnemosyne_ip exit 2>&1 | grep -q "No route to host"); do
            echo "VZDUMP_DELTA: waiting for Mnemosyne to become reachable"
            sleep 1
        done
    fi

    echo "VZDUMP_DELTA: Mnemosyne reachable, proceeding with backup job"
fi

# after backup
if [[ "$1" == "job-end" ]]; then
    # remove old backups (disable schedule)
    echo "VZDUMP_DELTA: Pruning backups on Mnemosyne"
    ssh root@$mnemosyne_ip proxmox-backup-manager prune-job run $mnemosyne_prune_id

    # deduplication & cleaning (disable schedule)
    echo "VZDUMP_DELTA: Garbage Collection on Mnemosyne"
    ssh root@$mnemosyne_ip proxmox-backup-manager garbage-collection start $mnemosyne_gc_datastore

    # if host is shutdown
    if $(ssh root@$poseidon_ip exit 2>&1 | grep -q "No route to host"); then
        # turn host on via wakeonlan
        echo "VZDUMP_DELTA: Poseidon unreachable, starting via WoL now"
        touch /tmp/poseidon.shutdown  # tell the script to shutdown the host later
        wakeonlan $poseidon_mac

        # wait until it starts up
        until ! $(ssh root@$poseidon_ip exit 2>&1 | grep -q "No route to host"); do
            echo "VZDUMP_DELTA: waiting for Poseidon to become reachable"
            sleep 1
        done
    fi

    echo "VZDUMP_DELTA: Poseidon reachable, proceeding."

    # if host is shutdown (likely)
    if $(ssh root@$clio_ip exit 2>&1 | grep -q "No route to host"); then
        # turn host on via virsh
        echo "VZDUMP_DELTA: clio unreachable, starting via Virsh now"
        touch /tmp/clio.shutdown  # tell the script to shutdown the host later
        ssh root@$poseidon_ip virsh start clio

        # wait until it starts up
        until ! $(ssh root@$clio_ip exit 2>&1 | grep -q "No route to host"); do
            echo "VZDUMP_DELTA: waiting for clio to become reachable"
            sleep 1
        done
    fi

    echo "VZDUMP_DELTA: Clio reachable, proceeding"

    echo "VZDUMP_DELTA: Syncing backups from Mnemosyne to Clio"
    ssh root@$mnemosyne_ip proxmox-backup-manager sync-job run $mnemosyne_sync_id
    
    # shut system down (if we turned it)
    if [[ -f /tmp/mnemosyne.shutdown ]]; then
        echo "VZDUMP_DELTA: shutting down Mnemosyne"
        rm /tmp/mnemosyne.shutdown  # remove the indicator file
        ssh root@$mnemosyne_ip shutdown now &
        disown
    fi

    # remove old backups (disable schedule)
    echo "VZDUMP_DELTA: Pruning backups on Clio"
    ssh root@$clio_ip proxmox-backup-manager prune-job run $clio_prune_id

    # deduplication & cleaning (disable schedule)
    echo "VZDUMP_DELTA: Garbage Collection on Clio"
    ssh root@$clio_ip proxmox-backup-manager garbage-collection start $clio_gc_datastore

    # shut system down (if we turned it)
    if [[ -f /tmp/clio.shutdown ]]; then
        echo "VZDUMP_DELTA: shutting down Clio"
        rm /tmp/clio.shutdown  # remove the indicator file
        ssh root@$clio_ip shutdown now &
        disown
    fi
    
    # shut system down (if we turned it)
    if [[ -f /tmp/clio.shutdown ]]; then
        echo "VZDUMP_DELTA: shutting down Poseidon"
        rm /tmp/poseidon.shutdown  # remove the indicator file
        ssh root@$poseidon_ip shutdown now &
        disown
    fi

    echo "VZDUMP_DELTA: job complete"
fi
