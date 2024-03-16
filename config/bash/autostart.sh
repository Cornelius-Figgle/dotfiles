#!/bin/bash
# a collection of functions that run startup routines per `$(hostname)`

function tmux-silent {
	# automatically attaches to any unattached tmux sessions, or creates a new one
	# https://unix.stackexchange.com/questions/529048/how-can-i-attach-to-the-the-first-unattached-tmux-session-or-create-a-new-sessi/529049#529049
	if [ ! "$TMUX" ]; then
		if [ ! $(tty | grep 'tty') ]; then  # not in tty, only in graphical env
			session="$(tmux ls -F '#{session_name}|#{?session_attached,y,n}' 2>/dev/null | grep 'n$')"
			if [ "$session" ]; then  # attach to last
    		exec tmux attach -t "$(echo "$session" | tail -n1 | cut -d'|' -f1)"
			else
    		exec tmux -f ~/.silent-tmux.conf  # no status bar
			fi
		fi
	fi
}


function poseidon {
	tmux-silent
	eval "$(thefuck --alias)"
	eval "$(zoxide init --cmd cd bash)"
	qh
}
function hades {
	qh
}
function persephone {
	tmux-silent
	eval "$(thefuck --alias)"
	eval "$(zoxide init --cmd cd bash)"
	qh
}
function zeus {
	qh
}
function mnemosyne {
        qh
}
function dionysus {
	tmux-silent
	qh
}
function rosa {
	tmux-silent
	qh
}

if ! [ $1 ]; then
	$(hostname)
else
	$1  # allows us to pass a hostname through the cli args
fi

