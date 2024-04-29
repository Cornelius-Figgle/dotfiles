#!/bin/bash

function music_delta {
  op=$(echo "ncmpcpp
spotify
youtube
cava" | tofi)

  bash ~/.config/river/scripts/music_delta.sh $op
}

function shoose {
  op=$(echo "music delta/
remote/
restart pipewire
emoji" | tofi)

  case $op in
    "music delta/")
      music_delta
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
