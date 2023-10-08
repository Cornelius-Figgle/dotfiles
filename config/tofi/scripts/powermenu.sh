#!/bin/bash

function shoose {
  op=$(echo "Shutdown
Reboot
Suspend
Hibernate
Lock
Exit" | tofi)

  case $op in
    Shutdown)
      sudo -A shutdown -h now
      ;;
    Reboot)
      sudo -A reboot -h now
      ;;
    Suspend)
      sudo -A zzz && swaylock
      ;;
    Hibernate)
      sudo -A ZZZ && swaylock
      ;;
    Lock)
      swaylock
      ;;
    Exit)
      riverctl exit
      ;;
  esac
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose