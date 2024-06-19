#!/bin/bash

function spawn_term_win {
  riverctl spawn "alacritty -e $1"
}

function shoose {
  op=$(echo "
max@poseidon                      [ssh]
root@zeus                         [ssh]
root@mnemosyne                    [ssh]
max@dionysus                      [ssh]
max@athena                        [ssh]
root@iris                         [ssh]
root@hectia                       [ssh]
max@hephaestus                    [ssh]
max@apollo                        [rdp]
paul.harrison@quicksilver         [rdp]" | tofi)

  case $op in
    "max@poseidon                      [ssh]")
      spawn_term_win "ssh max@192.168.0.8"
      ;;
    "root@zeus                         [ssh]")
      spawn_term_win "ssh root@192.168.0.19"
      ;;
    "root@mnemosyne                    [ssh]")
      spawn_term_win "ssh root@192.168.0.26"
      ;;
    "max@dionysus                     [ssh]")
      spawn_term_win "ssh max@192.168.0.12"
      ;;
    "max@athena                        [ssh]")
      spawn_term_win "ssh max@192.168.0.25"
      ;;
    "root@iris                         [ssh]")
      spawn_term_win "ssh root@192.168.0.21"
      ;;
    "root@hectia                       [ssh]")
      spawn_term_win "ssh root@192.168.0.27"
      ;;
    "max@hephaestus                    [ssh]")
      spawn_term_win "ssh max@192.168.0.28"
      ;;
    "max@apollo                        [rdp]")
      xfreerdp -v 192.168.0.23 -u max --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
    "paul.harrison@quicksilver         [rdp]")
      xfreerdp -v 192.168.0.11 -d FULLIMAGE -u paul.harrison --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
