#!/usr/bin/bash

# graphical sudo prompt
export SUDO_ASKPASS=$(kdialog --password "Enter your password to mount network shares")

# athena max
sudo -A mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //10.0.10.25/max /mnt/smb/athena/max

# athena public
sudo -A mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //10.0.10.25/public /mnt/smb/athena/public

# athena music
sudo -A mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //10.0.10.25/music /mnt/smb/athena/music

# ms1 Media
sudo -A mount -t cifs -o credentials=/mnt/.fullimage,uid=1000,gid=1000 //192.168.0.10/Media /mnt/smb/ms1/Media

# dc1 Public
sudo -A mount -t cifs -o credentials=/mnt/.fullimage,uid=1000,gid=1000 //192.168.0.15/Public /mnt/smb/dc1/Public

# dc1 Technical
sudo -A mount -t cifs -o credentials=/mnt/.fullimage,uid=1000,gid=1000 //192.168.0.15/Technical /mnt/smb/dc1/Technical
