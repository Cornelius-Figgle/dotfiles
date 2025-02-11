#!/bin/bash

# fail on error
set -e

# globals
pbs_ip="192.168.0.26"
pbs_mac="fc:3f:db:0d:d0:16"
#pbs_verify_id="v-fa3124c3-cd46"
#pbs_prune_id="s-59b5d519-ce09"
#pbs_gc_datastore="primary"

# before backup
if [[ "$1" == "job-init" ]]; then
    # if host is shutdown (likely)
    if $(ping -c 10 $pbs_ip | grep -q 'Unreachable'); then
        # turn host on via wakeonlan
        echo "VZDUMP_DELTA: PBS host unreachable, waking on lan now"
        touch /tmp/vzdump_delta.shutdown  # tell the script to shutdown the host later
	wakeonlan $pbs_mac

        # wait until it starts up
        until ! $(ping -c 10 $pbs_ip | grep -q 'Unreachable'); do
            echo "VZDUMP_DELTA: waiting for PBS host to become reachable"
            sleep 1
        done
    fi

    echo "VZDUMP_DELTA: PBS host reachable, preceeding with backup job"
fi

# after backup
if [[ "$1" == "job-end" ]]; then
    # verify backups (disable schedule)
    #echo "VZDUMP_DELTA: Verifying backups on PBS host"
    #ssh root@$pbs_ip proxmox-backup-manager verify-job run $pbs_verify_id

    # remove old backups (disable schedule)
    #echo "VZDUMP_DELTA: Pruning backups on PBS host"
    #ssh root@$pbs_ip proxmox-backup-manager prune-job run $pbs_prune_id

    # deduplication & cleaning (disable schedule)
    #echo "VZDUMP_DELTA: Garbage Collection on PBS host"
    #ssh root@$pbs_ip proxmox-backup-manager garbage-collection start $pbs_gc_datastore

    # shut system down again (if we turned it)
    if [[ -f /tmp/vzdump_delta.shutdown ]]; then
        echo "VZDUMP_DELTA: shutting target host down"
	rm /tmp/vzdump_delta.shutdown  # remove the indicator file
        ssh root@$pbs_ip systemctl poweroff &
        disown
    fi

    echo "VZDUMP_DELTA: job complete"
fi
