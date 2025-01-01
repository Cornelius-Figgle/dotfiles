#!/bin/bash

echo "creating pipe"
mkfifo /tmp/cava.fifo

echo "starting Winscap"
/mnt/s/windows/Winscap/winscap.exe 2 48000 16 > /tmp/cava.fifo &

echo "cava left"
tmux send-keys "cava -p ~/.config/cava/left" ENTER

echo "split pane"
tmux split-pane -v

echo "cava right"
tmux send-keys "cava -p ~/.config/cava/right" ENTER
