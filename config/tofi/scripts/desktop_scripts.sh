#!/bin/bash

function shoose {
  op=$(echo "music
remote/
restart pipewire
emoji" | tofi)

  case $op in
    "music")
      bash ~/.config/river/scripts/music_delta.sh
      ;;
    "remote/")
      bash ~/.config/tofi/scripts/remote.sh
      ;;
    "restart pipewire")
      bash ~/.config/river/scripts/restart_pipewire.sh
      ;;
    "emoji")
      bash ~/.config/tofi/scripts/emoji.sh
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
