#!/bin/bash

set -e

# ==========
# Setup Window 1
# ==========

if [[ "$1" = "ncmpcpp" ]]; then
  tmux new-session -f "~/.tmux-silent.conf" -s music_delta_a -d

  tmux split-pane -h -t music_delta_a
  tmux split-pane -v -t music_delta_a:1.2

  tmux send-keys -t music_delta_a:1.1 "ncmpcpp" ENTER
  tmux send-keys -t music_delta_a:1.1 "U#l"
  tmux send-keys -t music_delta_a:1.2 "peaclock" ENTER
  sleep 0.5 && tmux send-keys -t music_delta_a:1.2 "d" && sleep 0.5 && tmux send-keys -t music_delta_a:1.2 "s" 
  tmux send-keys -t music_delta_a:1.3 "ncmpcpp" ENTER
  tmux send-keys -t music_delta_a:1.3 "U#P"

  riverctl spawn "alacritty -e tmux attach -t music_delta_a"
elif [[ "$1" = "spotify" ]]; then
  brave-browser-stable --new-window "https://open.spotify.com/" &
  sleep 1
fi

# ==========
# Setup Window 2
# ==========

tmux new-session -f "~/.tmux-silent.conf" -s music_delta_b -d

tmux split-pane -v -t music_delta_b

tmux send-keys -t music_delta_b:1.1 "cava -p ~/.config/cava/left" ENTER
tmux send-keys -t music_delta_b:1.2 "cava -p ~/.config/cava/right" ENTER

riverctl spawn "alacritty -e tmux attach -t music_delta_b"

sleep 0.5 && riverctl send-to-output next
