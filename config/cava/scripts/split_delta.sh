#!/bin/bash

function one_win_h_split {
  tmux new-session -s cava_split -d
  
  tmux split-pane -t cava_split:1.1  # vertical split
  
  tmux send-keys -t cava_split:1.1 "cava -p ~/.config/cava/left" ENTER
  tmux send-keys -t cava_split:1.2 "cava -p ~/.config/cava/right" ENTER
  
  if [ "$TMUX" ]; then
    tmux switch -t cava_split  # display in current terminal
  else
    tmux attach -t cava_split
  fi
}

function two_win_no_split {
  tmux new-session -s cava_split -d
  
  tmux new-window -t cava_split  # two tmux windows
  
  tmux send-keys -t cava_split:1 "cava -p ~/.config/cava/left" ENTER
  tmux send-keys -t cava_split:2 "cava -p ~/.config/cava/right" ENTER

  riverctl spawn "foot 'tmux switch -t cava_split:1'"
  #riverctl spawn "foot 'tmux attach -t cava_split:2'"  # display in new terminal
  #tmux switch -t cava_split:1  # display in current terminal
}

$1
