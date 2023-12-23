#!/bin/bash

function spawn_term_win {
  riverctl spawn "foot $1"
}

function ssh {
  op=$(echo "nightcrawler2      (max)
pve1               (root)
mimic5             (root)
irc2               (root)
polaris            (max)
other*" | tofi)

  case $op in
    "nightcrawler2      (max)")
      spawn_term_win "ssh -t max@192.168.0.8 'TERM=xterm && tmux attach'"
      ;;
    "pve1               (root)")
      spawn_term_win "ssh root@192.168.0.19"
      ;;
    "mimic5             (root)")
      spawn_term_win "ssh -t root@192.168.0.12 'TERM=xterm && tmux attach'"
      ;;
    "irc2               (root)")
      spawn_term_win "ssh -t root@192.168.0.21 'TERM=xterm && tmux attach'"
      ;;
    "polaris            (max)")
      spawn_term_win "ssh -t max@192.168.0.25 'TERM=xterm && tmux attach'"
      ;;
  esac
}

function rdp {
  op=$(echo "win11-1            (max)
quicksilver        (paul.harrison)
other*" | tofi)

  case $op in
    "win11-1            (max)")
      xfreerdp -v 192.168.0.23 -u max --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
    "quicksilver        (paul.harrison)")
      xfreerdp -v 192.168.0.11 -d FULLIMAGE -u paul.harrison --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
  esac
}

function shoose {
  op=$(echo "ssh/
rdp/
vnc/" | tofi)

  case $op in
    "ssh/")
      ssh
      ;;
    "rdp/")
      rdp
      ;;
    "vnc/")
    
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
