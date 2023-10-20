#!/bin/sh

mkdir /run/user/1000
ln -s /mnt/wayland1/wayland-0 /run/user/1000/wayland-0

#mkdir /tmp/.X11-unix/
ln -s /mnt/wayland1/X1 /tmp/.X11-unix/X1

echo "export WAYLAND_DISPLAY=wayland-0
export XDG_RUNTIME_DIR=/run/user/1000
export DISPLAY=:1
export XSOCKET=/tmp/.X11-unix/X1" >> /home/max/source/dotfiles/config/bash/variables.sh
