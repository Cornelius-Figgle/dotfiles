#!/bin/bash

function shoose {
  op=$(echo "cava horizontal
cava vertical
cava stereo
cava multi_window" | tofi)

  case $op in
    "cava horizontal")
      bash ~/.config/cava/scripts/split_delta.sh horizontal
      ;;
    "cava vertical")
      bash ~/.config/cava/scripts/split_delta.sh vertical
      ;;
    "cava stereo")
      bash ~/.config/cava/scripts/split_delta.sh stereo
      ;;
    "cava multi_window")
      bash ~/.config/cava/scripts/split_delta.sh multi_window
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose