alias cls='clear'
alias winfetch='pwsh -c winfetch'  # pwsh has weird module loading bars so we call it into pwsh where these are disabled (I couldn't work out how to do it in git-bash)
alias lxappearance='GDK_BACKEND=x11 lxappearance'

alias glances='glances --percpu --disable-irix --separator --programs'

alias nightcrawler2='ssh -t max@192.168.0.8 tmux attach'
alias pve1='ssh root@192.168.0.19'
alias mimic5='ssh -t root@192.168.0.12 tmux attach'
alias irc2='ssh -t root@192.168.0.21 tmux attach'
alias polaris='ssh -t max@192.168.0.25 tmux attach'

alias mnt-public='sudo mount -t cifs -o credentials=/fullimage_cred //192.168.0.15/Public /mnt/shares/Public'
alias mnt-media='sudo mount -t cifs -o credentials=/fullimage_cred //192.168.0.10/Media /mnt/shares/Media'
alias mnt-technical='sudo mount -t cifs -o credentials=/fullimage_cred //192.168.0.15/Technical /mnt/shares/Technical'

alias dot='dotter deploy --force --verbose'

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
	echo $(whoami) @ $(hostname) on $(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
}
