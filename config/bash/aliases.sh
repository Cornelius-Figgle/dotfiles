alias cls='clear'
alias ff='fastfetch'

function wezsshu() {
	nohup wezterm ssh max@10.0.10.$1 &
}

function wezsshr() {
	nohup wezterm ssh root@10.0.10.0.$1 &
}

function jqbat() {
	jq . $1 | bat --language json
}

alias dot='./bin/dotter deploy --force --verbose'

alias wl='dbus-run-session river'

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
	if [[ $(hostname) -eq "persephone" ]]; then
		# winscap
		mkfifo /tmp/cava.fifo
		/mnt/p/01\ Homelab/01\ Software/Winscap/winscap.exe 2 44100 16 > /tmp/cava.fifo &
	fi

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

function 0x0() {
	$* > /tmp/bash_0x0.txt
	curl -F'file=@/tmp/bash_0x0.txt' https://0x0.st/
	rm /tmp/bash_0x0.txt
}

function qh() {
		echo $(whoami) @ $(hostname) on $(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') for $(uptime | cut -d' ' -f5 | cut -d',' -f1)
}

# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd "$cwd"  # https://github.com/sxyazi/yazi/issues/978
	fi
	rm -f -- "$tmp"
}
