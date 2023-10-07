#!/bin/bash

function shoose {
  op=$(echo "shutdown
reboot
suspend
hibernate
lock
exit" | tofi)

  case $op in
    shutdown)
      sudo -A shutdown -h now
      ;;
    reboot)
      sudo -A reboot -h now
      ;;
    suspend)
      sudo -A zzz && swaylock
      ;;
    hibernate)
      sudo -A ZZZ && swaylock
      ;;
    lock)
      swaylock
      ;;
    exit)
      riverctl exit
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose