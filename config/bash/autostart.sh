#!/bin/bash
# a collection of functions that run startup routines per `$HOSTNAME`

function NightCrawler {
	:
}
function quandale-butterson {
	:
}
function arnold-krimmler {
	:
}
function mimic3 {
	tmux ls
 	python3 -c "import psutil ; print(f'CPU: {psutil.cpu_percent(interval=2)}%')"
	python3 -c "import psutil ; print(f'Memory: {psutil.virtual_memory().percent}%')"
 	echo
}


# using an artificial try/catch here
# catches the errors with `&&` and runs the catch with `||`
# for more info: https://stackoverflow.com/a/22010339/19860022
{
	if ! [ $1 ]; then
		# allows us to pass a hostname through the cli args
		$HOSTNAME &&
	else
		$1 &&
	fi
} || {
	# save log for exception
	:
}