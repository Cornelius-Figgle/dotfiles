#!/bin/bash

function spawn_term_win {
  riverctl spawn "wezterm $1"
}

function shoose {
  op=$(echo "
max@dionysus                      [ssh]
root@zeus                         [ssh]
root@iris                         [ssh]
max@apollo                        [rdp]
max@athena                        [ssh]
root@mnemosyne                    [ssh]
max@astraeus                      [ssh]
max@hephaestus                    [ssh]
root@clio                         [ssh]
max@odysseus                      [ssh]" | tofi)

  case $op in
    "max@dionysus                      [ssh]")
      spawn_term_win "ssh max@192.168.0.12"
      ;;
    "root@zeus                         [ssh]")
      spawn_term_win "ssh root@192.168.0.19"
      ;;
    "root@iris                         [ssh]")
      spawn_term_win "ssh root@192.168.0.21"
      ;;
    "max@apollo                        [rdp]")
      xfreerdp -v 192.168.0.23 -u max --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
    "max@athena                        [ssh]")
      spawn_term_win "ssh max@192.168.0.25"
      ;;
    "root@mnemosyne                    [ssh]")
      spawn_term_win "ssh root@192.168.0.26"
      ;;
    "max@astraeus                      [ssh]")
      spawn_term_win "ssh max@192.168.0.27"
      ;;
    "max@hephaestus                    [ssh]")
      spawn_term_win "ssh max@192.168.0.28"
      ;;
    "root@clio                         [ssh]")
      spawn_term_win "ssh root@192.168.0.30"
      ;;
    "max@odysseus                    [ssh]")
      spawn_term_win "ssh max@192.168.0.31"
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
