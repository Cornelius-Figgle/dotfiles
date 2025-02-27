#!/bin/bash

function spawn_term_win {
  riverctl spawn "wezterm $1"
}

function shoose {
  op=$(echo "
  max@dionysus
  root@zeus
  root@iris
  max@apollo
  max@athena
  root@mnemosyne
  max@astraeus
  max@hephaestus
  root@clio
  max@odysseus
  max@demeter
  max@crius" | tofi)

  case $op in
    "  max@dionysus")
      spawn_term_win "ssh max@192.168.0.12"
      ;;
    "  root@zeus")
      spawn_term_win "ssh root@192.168.0.19"
      ;;
    "  root@iris")
      spawn_term_win "ssh root@192.168.0.21"
      ;;
    "  max@apollo")
      xfreerdp -v 192.168.0.23 -u max --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
    "  max@athena")
      spawn_term_win "ssh max@192.168.0.25"
      ;;
    "  root@mnemosyne")
      spawn_term_win "ssh root@192.168.0.26"
      ;;
    "  max@astraeus")
      spawn_term_win "ssh max@192.168.0.27"
      ;;
    "  max@hephaestus")
      spawn_term_win "ssh max@192.168.0.28"
      ;;
    "  root@clio")
      spawn_term_win "ssh root@192.168.0.30"
      ;;
    "  max@odysseus")
      spawn_term_win "ssh max@192.168.0.31"
      ;;
    "  max@demeter")
      spawn_term_win "ssh max@192.168.0.33"
      ;;
    "  max@crius")
      spawn_term_win "ssh max@192.168.0.34"
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
