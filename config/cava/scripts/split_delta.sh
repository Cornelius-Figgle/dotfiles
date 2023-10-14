#!/bin/bash

tmux new -s cava_split -d
tmux split-pane -t cava_split:1.1
tmux send-keys -t cava_split:1.1 "cava -p ~/.config/cava/left" ENTER
tmux send-keys -t cava_split:1.2 "cava -p ~/.config/cava/right" ENTER
tmux switch -t cava_split