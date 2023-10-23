#!/bin/bash

function shoose {
  op=$(echo "cava horizontal
cava vertical
cava averaged
cava stereo
cava multi_window
restart pipewire" | tofi)

  case $op in
    "cava horizontal")
      bash ~/.config/cava/scripts/split_delta.sh horizontal
      ;;
    "cava vertical")
      bash ~/.config/cava/scripts/split_delta.sh vertical
      ;;
    "cava averaged")
      bash ~/.config/cava/scripts/split_delta.sh averaged
      ;;
    "cava stereo")
      bash ~/.config/cava/scripts/split_delta.sh stereo
      ;;
    "cava multi_window")
      bash ~/.config/cava/scripts/split_delta.sh multi_window
      ;;
    "restart pipewire")
      bash ~/.config/river/scripts/restart_pipewire.sh
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose