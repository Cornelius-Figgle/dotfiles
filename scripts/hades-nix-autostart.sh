#!/usr/bin/bash

# athena max
mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //10.0.10.25/max /mnt/smb/athena/max

# athena public
mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //10.0.10.25/public /mnt/smb/athena/public

# athena music
mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //10.0.10.25/music /mnt/smb/athena/music

# ms1 Media
mount -t cifs -o credentials=/mnt/.fullimage,uid=1000,gid=1000 //10.0.10.25/Media /mnt/smb/ms1/Media

# dc1 Public
mount -t cifs -o credentials=/mnt/.fullimage,uid=1000,gid=1000 //10.0.10.25/Public /mnt/smb/dc1/Public

# dc1 Technical
mount -t cifs -o credentials=/mnt/.fullimage,uid=1000,gid=1000 //10.0.10.25/Technical /mnt/smb/dc1/Technical
