alias cls='clear'
alias ff='fastfetch'
alias dot='./bin/dotter deploy --force --verbose'
alias wl='dbus-run-session river'
alias qh="echo $(whoami) @ $(hostname) on $(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') for $(uptime | cut -d' ' -f5 | cut -d',' -f1)"

{{#if (eq dotter.hostname "poseidon")}}
	chooser="tofi"
{{else}}
	chooser="fzf"
{{/if}}

function spawn_ssh_win {
	{{#if (eq dotter.hostname "poseidon")}}
		riverctl spawn "wezterm ssh $1"
	{{else}}
		ssh $1
	{{/if}}
}

function spawn_rdp {
	{{#if (eq dotter.hostname "poseidon")}}
		riverctl spawn "xfreerdp -v $2 -u $1 --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f"
	{{else}}
		xfreerdp -v $2 -u $1 --sec tls --disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims -f
	{{/if}}
}

function jqbat() {
	jq . $1 | bat --language json
}

function svpush() {
	git add .
	git commit -m "$*"  # https://unix.stackexchange.com/a/197794/551787
	git push
}

function cddir() {
	mkdir $1
 	cd $1
}

function visl() {
	{{#if (eq dotter.hostname "persephone")}}
		# winscap
		mkfifo /tmp/cava.fifo
		/mnt/p/01\ Homelab/01\ Software/Winscap/winscap.exe 2 44100 16 > /tmp/cava.fifo &
	{{/if}}

	if [[ $1 -eq "s" ]]; then
		# top-bottom stereo split via tmux
		tmux send-keys "cava -p ~/.config/cava/left" ENTER
		tmux split-pane -v
		tmux send-keys "cava -p ~/.config/cava/right" ENTER
	else
		# single window mono
		tmux send-keys "cava -p ~/.config/cava/config" ENTER
	fi
}

function sshl() {
  # declare arrays
  hostnames=()
  commands=()

	# use local directory if possible
	if [ -d "/home/max/syncthing" ]; then
		machines_dir="/home/max/syncthing/00 Documentation/Machines/"
	else
		machines_dir="/mnt/smb/athena/public/01 Homelab/00 Documentation/Machines/"
	fi

  # loop over files
  for path in "$machines_dir"*.md; do
    # get data
    name=$(basename "$path" .md)
    user=$(grep "Main user:" "$path" | cut -d':' -f 2 | cut -d' ' -f 2 | cut -d'"' -f 2)
    ip=$(grep "IP Ext:" "$path" | cut -d':' -f 2 | cut -d' ' -f 2 | cut -d'"' -f 2)
    os=$(grep "OS:" "$path" | cut -d':' -f 2 | cut -d' ' -f 2 | cut -d'"' -f 2)

    if [ ! -z "$user" ] && [ ! -z "$ip" ] && [ "$ip" != "DCHP" ]; then
      # populate arrays
      hostnames+=( "$name" )

      if [ "$os" == "Windows" ]; then
        commands+=( "rdp $user 10.0.10.$ip" )
      else
        commands+=( "ssh $user@10.0.10.$ip" )
      fi
    fi
  done

  # get host
  op=$(for i in ${!hostnames[@]}; do echo "${hostnames[$i]}"; done | $chooser)

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

function 0x0() {
	$* > /tmp/bash_0x0.txt
	curl -F'file=@/tmp/bash_0x0.txt' https://0x0.st/
	rm /tmp/bash_0x0.txt
}
