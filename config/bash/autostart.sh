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
			elif [ "$(hostname)" == "poseidon" ]; then
    		exec tmux -f ~/.silent-tmux.conf  # no status bar
    	else
    		exec tmux
			fi
		fi
	fi
}


function poseidon {
	tmux-silent
	eval "$(zoxide init --cmd cd bash)"
}
function hades {
	:
}
function persephone {
	tmux-silent
	eval "$(zoxide init --cmd cd bash)"
}
function leto {
	eval "$(zoxide init --cmd cd bash)"
}
function theseus {
	tmux-silent
	eval "$(zoxide init --cmd cd bash)"
}
function zeus {
	:
}
function mnemosyne {
	:
}
function hera {
	:
}
function clio {
	:
}
function dionysus {
	tmux-silent
}
function laravel-portfolio {
	tmux-silent
}

if ! [ $1 ]; then
	$(hostname)
else
	$1  # allows us to pass a hostname through the cli args
fi

