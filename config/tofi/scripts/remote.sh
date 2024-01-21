#!/bin/bash

function spawn_term_win {
  riverctl spawn "foot $1"
}

function shoose {
  op=$(echo "
max@nightcrawler2                 [ssh]
root@pve2                         [ssh]
root@mimic5                       [ssh]
max@polaris                       [ssh]
root@irc2                         [ssh]
root@homepage                     [ssh]
max@win11-1                       [rdp]
paul.harrison@quicksilver         [rdp]" | tofi)

  case $op in
    "max@nightcrawler2                 [ssh]")
      spawn_term_win "ssh -t max@192.168.0.8 'TERM=xterm && tmux attach'"
      ;;
    "root@pve2                         [ssh]")
      spawn_term_win "ssh root@192.168.0.19"
      ;;
    "root@mimic5                       [ssh]")
      spawn_term_win "ssh -t root@192.168.0.12 'TERM=xterm && tmux attach'"
      ;;
    "max@polaris                       [ssh]")
      spawn_term_win "ssh -t max@192.168.0.25 'TERM=xterm && tmux attach'"
      ;;
    "root@irc2                         [ssh]")
      spawn_term_win "ssh -t root@192.168.0.21 'TERM=xterm && tmux attach'"
      ;;
    "root@homepage                     [ssh]")
      spawn_term_win "ssh -t max@192.168.0.25 'TERM=xterm && tmux attach'"
      ;;
    "max@win11-1                       [rdp]")
      wlfreerdp -v 192.168.0.23 -u max --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
    "paul.harrison@quicksilver         [rdp]")
      wlfreerdp -v 192.168.0.11 -d FULLIMAGE -u paul.harrison --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
