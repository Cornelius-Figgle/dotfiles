alias cls='clear'
alias ff='fastfetch'

function poseidon() {
	ssh max@192.168.0.8 "$*"
}
function zeus() {
	ssh root@192.168.0.19 "$*"
}
function mnemosyne() {
	ssh root@192.168.0.26 "$*"
}
function dionysus() {
	ssh max@192.168.0.12 "$*"
}
function iris() {
	ssh root@192.168.0.21 "$*"
}
function athena() {
	ssh max@192.168.0.25 "$*"
}
function hectia() {
	ssh root@192.168.0.27 "$*"
}
function hephaestus() {
	ssh max@192.168.0.28 "$*"
}
function clio() {
	ssh root@192.168.0.30 "$*"
}
function hera() {
	ssh max@192.168.0.31 "$*"
}

function mnt() {
	case $1 in
		"athena\auth")
			sudo mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //192.168.0.25/auth /mnt/smb/athena/auth
		;;
		"athena\music")
			sudo mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //192.168.0.25/music /mnt/smb/athena/music
		;;
		"athena\notes")
			sudo mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //192.168.0.25/notes /mnt/smb/athena/notes
		;;
		"athena\setup")
			sudo mount -t cifs -o credentials=/mnt/.athena,uid=1000,gid=1000 //192.168.0.25/setup /mnt/smb/athena/setup
		;;
		"svr1\Media")
			sudo mount -t cifs -o credentials=/mnt/.fullimage,file_mode=0755,dir_mode=0755 //192.168.0.10/Media /mnt/smb/svr1/Media
		;;
		"dc1\Public")
			sudo mount -t cifs -o credentials=/mnt/.fullimage,file_mode=0755,dir_mode=0755 //192.168.0.15/Public /mnt/smb/dc1/Public
		;;
		"dc1\Techincal")
			sudo mount -t cifs -o credentials=/mnt/.fullimage,file_mode=0755,dir_mode=0755 //192.168.0.15/Technical /mnt/smb/dc1/Technical
		;;
	esac
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
