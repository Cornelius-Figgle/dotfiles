# ====================
# Aliases
# ====================

alias cls='clear'

alias glances='glances --percpu --disable-irix --separator --programs'

alias nightcrawler2='ssh -t max@192.168.0.8 tmux attach'
alias pve1='ssh root@192.168.0.19'
alias mimic5='ssh -t root@192.168.0.12 tmux attach'
alias irc2='ssh -t root@192.168.0.21 tmux attach'

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

# ====================
# Variables
# ====================

PS1='\w \$ '

# ====================
# Autostart
# ====================

# connect to last tmux session, or create new
if [ ! "$TMUX" ]; then
	if [ "$session" ]; then
		exec tmux attach -t "$(echo "$session" | tail -n1 | cut -d'|' -f1)"
	else
		exec tmux
	fi
fi

qh