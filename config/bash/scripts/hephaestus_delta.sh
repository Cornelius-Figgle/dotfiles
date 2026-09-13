#!/bin/bash

if [[ "$1" == "pre-start" ]]; then
    # mount repos in the host
    echo "HEPHEATUS_DELTA: mounting `athena\repos` now"
    umount /mnt/smb/athena/repos
    mount -t cifs -o credentials=/mnt/.athena,uid=101000,gid=101000 //192.168.0.25/repos /mnt/smb/athena/repos

    echo "HEPHAESTUS_DELTA: job complete"
fi
