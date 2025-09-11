#!/bin/bash

function spawn_ssh_win {
  riverctl spawn "wezterm ssh $1"
}

function shoose {
  op=$(echo "
  max@dionysus
  root@zeus
  root@iris
  max@apollo
  max@athena
  truenas_admin@mnemosyne
  root@mnemosyne-pbs
  max@astraeus
  max@hephaestus
  root@clio
  max@odysseus
  max@demeter
  max@vps-hl-debian
  max@icarus" | tofi)

  case $op in
    "  max@dionysus")
      spawn_ssh_win "max@192.168.0.12"
      ;;
    "  root@zeus")
      spawn_ssh_win "root@192.168.0.19"
      ;;
    "  root@iris")
      spawn_ssh_win "root@192.168.0.21"
      ;;
    "  max@apollo")
      xfreerdp -v 192.168.0.23 -u max --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
    "  max@athena")
      spawn_ssh_win "max@192.168.0.25"
      ;;
    "  truenas_admin@mnemosyne")
      spawn_ssh_win "truenas_admin@192.168.0.26"
      ;;
    "  root@mnemosyne-pbs")
      spawn_ssh_win "root@192.168.0.26:2222"
      ;;
    "  max@astraeus")
      spawn_ssh_win "max@192.168.0.27"
      ;;
    "  max@hephaestus")
      spawn_ssh_win "max@192.168.0.28"
      ;;
    "  root@clio")
      spawn_ssh_win "root@192.168.0.30"
      ;;
    "  max@odysseus")
      spawn_ssh_win "max@192.168.0.31"
      ;;
    "  max@demeter")
      spawn_ssh_win "max@192.168.0.33"
      ;;
    "  max@vps-hl-debian")
      spawn_ssh_win "max@192.168.0.34"
      ;;
    "  max@icarus")
      spawn_ssh_win "max@192.168.0.35"
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
