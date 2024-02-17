#!/bin/bash

# =================
# Helper functions
# =================

function move_to_right_output {
  # edit to work with your WM/TERM
  sleep 0.5
  riverctl focus-view next
  riverctl send-to-output next
} 

function display {
  if [ "$SPAWN_NEW_WINDOW" = true ]; then
    riverctl spawn "alacritty -e tmux attach -t cava_split"
  else  # reuse current window
    if [ "$TMUX" ]; then  # if already inside of TMUX
      tmux switch -t cava_split  # display in current terminal
    else
      tmux attach -t cava_split
    fi
  fi
}

# =================
# Main functions
# =================

function horizontal {
  tmux new-session -s cava_split -d
  
  tmux split-pane -v -t cava_split  # vertical split
  
  tmux send-keys -t cava_split:1.1 "cava -p ~/.config/cava/left" ENTER
  tmux send-keys -t cava_split:1.2 "cava -p ~/.config/cava/right" ENTER

  display
}

function vertical {
  tmux new-session -s cava_split -d
  
  tmux split-pane -h -t cava_split  # vertical split
  
  tmux send-keys -t cava_split:1.1 "cava -p ~/.config/cava/left" ENTER
  tmux send-keys -t cava_split:1.2 "cava -p ~/.config/cava/right" ENTER
  
  display
}

function averaged {
  tmux new-session -s cava_split -d

  tmux send-keys -t cava_split "cava -p ~/.config/cava/config" ENTER

  display
}

function stereo {
  tmux new-session -s cava_split -d

  tmux send-keys -t cava_split "cava -p ~/.config/cava/stereo" ENTER

  display
}

function multi_window {
  # https://unix.stackexchange.com/questions/24274/attach-to-different-windows-in-session
  tmux new-session -s cava_split -d
  tmux new-session -t cava_split -s cava_split_2 -d  # second session
  
  tmux new-window -t cava_split  # two tmux windows
  
  tmux send-keys -t cava_split:1 "cava -p ~/.config/cava/left" ENTER
  tmux send-keys -t cava_split_2:2 "cava -p ~/.config/cava/right" ENTER

  if [ "$LEFT_IS_SECOND" = true ]; then
    riverctl spawn "alacritty -e tmux attach -t cava_split_2:2"
    riverctl spawn "alacritty -e tmux attach -t cava_split:1"
    move_to_right_output
  else
    riverctl spawn "alacritty -e tmux attach -t cava_split_1"
    riverctl spawn "alacritty -e tmux attach -t cava_split:2:2"
    move_to_right_output
  fi
}

# =================
# Variables
# =================

# whether to create a new terminal instance for the visualiser
SPAWN_NEW_WINDOW=true

# whether the "left channel" window is spawned second
# only applicable for `multi_window`
LEFT_IS_SECOND=true

# whether to attempt to arrange windows across 2 outputs
# only applicable for `multi_window`
MOVE_TO_OUTPUT=true

# mode to use if not specified on the cli
DEFAULT_MODE='horizontal'

# =================
# Exec
# =================

if ! [ $1 ]; then
  $DEFAULT_MODE
else
  $1
fi
