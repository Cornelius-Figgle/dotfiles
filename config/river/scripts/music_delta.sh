#!/bin/bash

set -e

# ==========
# Initialise TMUX
# ==========

tmux new-session -f "~/.tmux-silent.conf" -s music_delta_a -d
tmux new-session -f "~/.tmux-silent.conf" -s music_delta_b -d

# ==========
# Setup Window 1
# ==========

tmux split-pane -h -t music_delta_a
tmux split-pane -v -t music_delta_a:1.2

tmux send-keys -t music_delta_a:1.1 "ncmpcpp" ENTER
tmux send-keys -t music_delta_a:1.1 "U#l"
tmux send-keys -t music_delta_a:1.2 "peaclock" ENTER
sleep 0.5 && tmux send-keys -t music_delta_a:1.2 "d" && sleep 0.5 && tmux send-keys -t music_delta_a:1.2 "s" 
tmux send-keys -t music_delta_a:1.3 "ncmpcpp" ENTER
tmux send-keys -t music_delta_a:1.3 "U#"

riverctl spawn "alacritty -e tmux attach -t music_delta_a"

# ==========
# Setup Window 2
# ==========

tmux split-pane -v -t music_delta_b

tmux send-keys -t music_delta_b:1.1 "cava -p ~/.config/cava/left" ENTER
tmux send-keys -t music_delta_b:1.2 "cava -p ~/.config/cava/right" ENTER

riverctl spawn "alacritty -e tmux attach -t music_delta_b"
sleep 0.5 && riverctl send-to-output next
