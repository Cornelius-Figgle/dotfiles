alias cls='clear'
alias winfetch='pwsh -c winfetch'  # pwsh has weird module loading bars so we call it into pwsh where these are disabled (I couldn't work out how to do it in git-bash)
alias lxappearance='GDK_BACKEND=x11 lxappearance'

alias glances='glances --percpu --disable-irix --separator --programs'

alias rdp='xfreerdp -v 192.168.0.8 -d FULLIMAGE -u max.harrison --sec tls \
	--disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims \
	-f'  # future: add menu script for these
alias pc='ssh -t max@192.168.0.8 tmux attach'
alias pve='ssh root@192.168.0.19'
alias mimic='ssh -t max@192.168.0.12 tmux attach'
alias irc='ssh -t root@192.168.0.21 tmux attach'

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
