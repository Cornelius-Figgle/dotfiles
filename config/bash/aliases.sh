alias cls='clear && qh'
alias winfetch='pwsh -c winfetch'  # pwsh has weird module loading bars so we call it into pwsh where these are disabled (I couldn't work out how to do it in git-bash)
alias lxappearance='GDK_BACKEND=x11 lxappearance'

alias glances='glances --disable-irix --separator --programs'

alias poseidon='ssh max@192.168.0.8'
alias zeus='ssh root@192.168.0.19'
alias mnemosyne='ssh root@192.168.0.26'
alias dionysus='ssh root@192.168.0.12'
alias iris='ssh root@192.168.0.21'
alias athena='ssh max@192.168.0.25'
alias hectia='ssh root@192.168.0.27'
alias hephaestus='ssh max@192.168.0.28'

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

alias pacman-backup='pacman -Qqe | grep -v "$(pacman -Qqm)"'
alias aur-backup='pacman -Qqm'
alias pacman-restore='xargs pacman -S --needed --noconfirm'
alias aur-restore='echo "NO RESTORE LINE YET"'

function svpush() {
	git add .
	git commit -m "$*"  # https://unix.stackexchange.com/a/197794/551787
	git push
}

function cddir() {
	mkdir $1
 	cd $1
}

function qh() {
	{{#if (eq dotter.os "unix")}}
		echo $(whoami) @ $(hostname) on $(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
	{{/if}}

	{{#if (eq dotter.os "windows")}}
		echo $(whoami) @ $(hostname) on $(pwsh -c '(Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias {{ net_adapter }}).IPAddress')
	{{/if}}
}
