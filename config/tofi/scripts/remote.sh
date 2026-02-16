#!/bin/bash

function spawn_ssh_win {
  riverctl spawn "wezterm ssh $1"
}

function spawn_rdp {
  riverctl spawn "xfreerdp -v $2 -u $1 --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f"
}

function shoose {
  # declare arrays
  hostnames=()
  commands=()

  # loop over files
  for path in /mnt/smb/athena/public/01\ Homelab/00\ Documentation/Machines/*.md; do
    # get data
    name=$(basename "$path" .md)
    user=$(grep "Main user:" "$path" | cut -d':' -f 2 | cut -d' ' -f 2 | cut -d'"' -f 2)
    ip=$(grep "IP ext:" "$path" | cut -d':' -f 2 | cut -d' ' -f 2 | cut -d'"' -f 2)
    os=$(grep "OS:" "$path" | cut -d':' -f 2 | cut -d' ' -f 2 | cut -d'"' -f 2)

    if [ ! -z "$user" ] && [ ! -z "$ip" ] && [ "$ip" != "DCHP" ]; then
      # populate arrays
      hostnames+=( "$name" )

      if [ "$os" == "Windows" ]; then
        commands+=( "rdp $user 192.168.0.$ip" )
      else
        commands+=( "ssh $user@192.168.0.$ip" )
      fi
    fi
  done

  # get host
  op=$(for i in ${!hostnames[@]}; do echo "${hostnames[$i]}"; done | tofi)

  # run command
  for i in ${!hostnames[@]}; do
    if [ "$op" == "${hostnames[$i]}" ]; then
      if [ "$(echo ${commands[$i]} | cut -d' ' -f 1)" == "rdp" ]; then
        spawn_rdp "$(echo ${commands[$i]} | cut -d' ' -f 2)" "$(echo ${commands[$i]} | cut -d' ' -f 3)"
      else
        spawn_ssh_win "$(echo ${commands[$i]} | cut -d' ' -f 2)"
      fi
    fi
  done
}

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
shoose
