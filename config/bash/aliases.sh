alias cls='clear'
alias ff='fastfetch'
alias dot='./bin/dotter deploy --force --verbose'
alias wl='dbus-run-session river'
alias qh="echo $(whoami) @ $(hostname) on $(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') for $(uptime | cut -d' ' -f5 | cut -d',' -f1)"

function jqbat() {
	jq . $1 | bat --language json
}

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
