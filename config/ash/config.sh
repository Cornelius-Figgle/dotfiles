# ====================
# Aliases
# ====================

alias cls='clear && qh'

alias glances='glances --percpu --disable-irix --separator --programs'

alias poseidon='ssh max@192.168.0.8'
alias zeus='ssh root@192.168.0.19'
alias mnemosyne='ssh root@192.168.0.26'
alias dionysus='ssh root@192.168.0.12'
alias iris='ssh root@192.168.0.21'
alias athena='ssh max@192.168.0.25'
alias hectia='ssh root@192.168.0.27'
alias hephaestus='ssh max@192.168.0.28'

alias dot='dotter deploy --force --verbose'

# ====================
# Functions
# ====================

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

function tmux_silent() {
	# automatically attaches to any unattached tmux sessions, or creates a new one
	# https://unix.stackexchange.com/questions/529048/how-can-i-attach-to-the-the-first-unattached-tmux-session-or-create-a-new-sessi/529049#529049
	if [ ! "$TMUX" ]; then
		if [ ! $(tty | grep 'tty') ]; then  # not in tty, only in graphical env
			session="$(tmux ls -F '#{session_name}|#{?session_attached,y,n}' 2>/dev/null | grep 'n$')"
			if [ "$session" ]; then  # attach to last
				exec tmux attach -t "$(echo "$session" | tail -n1 | cut -d'|' -f1)"
			else
				exec tmux -f ~/.tmux.conf  # no status bar
			fi
		fi
	fi
}

# ====================
# Variables
# ====================

PS1='\w \$ '
export PATH=~/source/XBPS/usr/bin:$PATH

# ====================
# Autostart
# ====================

tmux_silent
qh