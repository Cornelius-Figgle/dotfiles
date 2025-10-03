#!/bin/bash

echo "creating pipe"
mkfifo /tmp/cava.fifo

echo "starting Winscap"
/mnt/d/01\ Homelab/01\ Software/Winscap/winscap.exe 2 44100 16 > /tmp/cava.fifo &

echo "cava averaged"
tmux send-keys "cava -p ~/.config/cava/config" ENTER

# echo "cava left"
# tmux send-keys "cava -p ~/.config/cava/left" ENTER

# echo "split pane"
# tmux split-pane -v

# echo "cava right"
# tmux send-keys "cava -p ~/.config/cava/right" ENTER
