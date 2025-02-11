#!/bin/bash

# fail on error
set -e

# globals
pbs_a_ip="192.168.0.26"
pbs_a_mac="fc:3f:db:0d:d0:16"
pbs_a_verify_id="v-fa3124c3-cd46"
pbs_a_prune_id="s-59b5d519-ce09"
pbs_a_sync_id="s-c54aa391-2be4"
pbs_a_gc_datastore="primary"

pbs_b_ip="192.168.0.30"
pbs_b_mac=""
pbs_b_verify_id=""
pbs_b_prune_id=""
pbs_b_sync_id=""
pbs_b_gc_datastore="primary"

# if host A is shutdown (likely)
if $(ping -c 10 $pbs_a_ip | grep -q 'Unreachable'); then
    # turn host on via wakeonlan
    echo "PBS_DELTA: PBS A unreachable, waking on lan now"
    touch /tmp/pbs_a_delta.shutdown  # tell the script to shutdown the host later
    wakeonlan $pbs_a_mac

    # wait until it starts up
    until ! $(ping -c 10 $pbs_a_ip | grep -q 'Unreachable'); do
        echo "PBS_DELTA: waiting for PBS A to become reachable"
        sleep 1
    done
fi

echo "PBS_DELTA: PBS A reachable, preceeding with jobs"

# verify backups (disable schedule)
echo "PBS_DELTA: Verifying backups on PBS A"
ssh root@$pbs_a_ip proxmox-backup-manager verify-job run $pbs_a_verify_id

# remove old backups (disable schedule)
echo "PBS_DELTA: Pruning backups on PBS A"
ssh root@$pbs_a_ip proxmox-backup-manager prune-job run $pbs_a_prune_id

# deduplication & cleaning (disable schedule)
echo "PBS_DELTA: Garbage Collection on PBS A"
ssh root@$pbs_a_ip proxmox-backup-manager garbage-collection start $pbs_a_gc_datastore

# sync (disable schedule)
echo "PBS_DELTA: Syncing backups from PBS A to PBS B"
ssh root@$pbs_a_ip proxmox-backup-manager sync start $pbs_a_sync_id

# shut systems down again (if we turned it)
if [[ -f /tmp/pbs_a_delta.shutdown ]]; then
    echo "PBS_DELTA: shutting PBS A down"
    rm /tmp/pbs_a_delta.shutdown  # remove the indicator file
    ssh root@$pbs_a_ip systemctl poweroff &
    disown
fi
if [[ -f /tmp/pbs_b_delta.shutdown ]]; then
    echo "PBS_DELTA: shutting PBS B down"
    rm /tmp/pbs_b_delta.shutdown  # remove the indicator file
    ssh root@$pbs_b_ip systemctl poweroff &
    disown
fi

echo "PBS_DELTA: job complete"
