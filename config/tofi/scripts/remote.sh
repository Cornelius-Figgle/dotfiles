#!/bin/bash

function spawn_term_win {
  riverctl spawn "foot $1"
}

function ssh {
  op=$(echo "nightcrawler2
pve1
mimic4
irc2" | tofi)

  case $op in
    nightcrawler2)
      spawn_term_win "ssh -t max@192.168.0.8 'TERM=xterm && tmux attach'"
      ;;
    pve1)
      spawn_term_win "ssh root@192.168.0.19"
      ;;
    mimic4)
      spawn_term_win "ssh -t max@192.168.0.12 'TERM=xterm && tmux attach'"
      ;;
    irc2)
      spawn_term_win "ssh -t root@192.168.0.21 'TERM=xterm && tmux attach'"
      ;;
  esac
}

function rdp {
  op=$(echo "win11-1" | tofi)

  case $op in
    win11-1)
      xfreerdp -v 192.168.0.23 -u max --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
  esac
}

function shoose {
  op=$(echo "ssh
rdp
vnc" | tofi)

  case $op in
    ssh)
      ssh
      ;;
    rdp)
      rdp
      ;;
    vnc)
    
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose