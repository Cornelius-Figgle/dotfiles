#!/bin/bash

function cava {
  op=$(echo "horizontal
vertical
averaged
stereo
multi_window" | tofi)

  case $op in
    "horizontal")
      bash ~/.config/cava/scripts/split_delta.sh horizontal
      ;;
    "vertical")
      bash ~/.config/cava/scripts/split_delta.sh vertical
      ;;
    "averaged")
      bash ~/.config/cava/scripts/split_delta.sh averaged
      ;;
    "stereo")
      bash ~/.config/cava/scripts/split_delta.sh stereo
      ;;
    "multi_window")
      bash ~/.config/cava/scripts/split_delta.sh multi_window
      ;;
  esac
}

function shoose {
  op=$(echo "cava/
remote/
restart pipewire" | tofi)

  case $op in
    "cava/")
      cava
      ;;
    "remote/")
      bash ~/.config/tofi/scripts/remote.sh
      ;;
    "restart pipewire")
      bash ~/.config/river/scripts/restart_pipewire.sh
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose