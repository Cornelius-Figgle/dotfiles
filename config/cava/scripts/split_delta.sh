#!/bin/bash

# =================
# Helper functions
# =================

function spawn_term_win {
  # edit to work with your WM/TERM
  riverctl spawn "foot $1"
}

function move_to_right_output {
  # edit to work with your WM/TERM
  sleep 0.5
  riverctl focus-view next
  riverctl send-to-output next
} 

function display {
  if [ "$SPAWN_NEW_WINDOW" = true ]; then
    spawn_term_win "tmux attach -t $1"
  else  # reuse current window
    if [ "$TMUX" ]; then  # if already inside of TMUX
      tmux switch -t $1  # display in current terminal
    else
      tmux attach -t $1
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

  display "cava_split"
}

function vertical {
  tmux new-session -s cava_split -d
  
  tmux split-pane -h -t cava_split  # vertical split
  
  tmux send-keys -t cava_split:1.1 "cava -p ~/.config/cava/left" ENTER
  tmux send-keys -t cava_split:1.2 "cava -p ~/.config/cava/right" ENTER
  
  display "cava_split"
}

function stereo {
  tmux new-session -s cava_split -d

  tmux send-keys -t cava_split "cava -p ~/.config/cava/config" ENTER

  display "cava_split"
}

function multi_window {
  # https://unix.stackexchange.com/questions/24274/attach-to-different-windows-in-session
  tmux new-session -s cava_split -d
  tmux new-session -t cava_split -s cava_split_2 -d  # second session
  
  tmux new-window -t cava_split  # two tmux windows
  
  tmux send-keys -t cava_split:1 "cava -p ~/.config/cava/left" ENTER
  tmux send-keys -t cava_split_2:2 "cava -p ~/.config/cava/right" ENTER

  if [ "$LEFT_IS_SECOND" = true ]; then
    spawn_term_win "tmux attach -t cava_split_2:2"
    spawn_term_win "tmux attach -t cava_split:1"
    move_to_right_output
  else
    spawn_term_win "tmux attach -t cava_split:1"
    spawn_term_win "tmux attach -t cava_split_2:2"
    move_to_right_output
  fi
}

# =================
# Variables
# =================

# we only set these if they aren't already defined, to allow them to be set
# by the environment

if [ -z ${SPAWN_NEW_WINDOW+x} ]; then
  # whether to create a new terminal instance for the visualiser
  SPAWN_NEW_WINDOW=false
fi

if [ -z ${LEFT_IS_SECOND+x} ]; then
  # whether the "left channel" window is spawned second
  # only applicable for `multi_window`
  LEFT_IS_SECOND=true
fi

if [ -z ${MOVE_TO_OUTPUT+x} ]; then
  # whether to attempt to arrange windows across 2 outputs
  # only applicable for `multi_window`
  MOVE_TO_OUTPUT=true
fi

if [ -z ${DEFAULT_MODE+x} ]; then
  # mode to use if not specified on the cli
  DEFAULT_MODE='horizontal'
fi

# =================
# Exec
# =================

if ! [ $1 ]; then
  $DEFAULT_MODE
else
  $1
fi
