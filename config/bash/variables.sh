# "In summary, we primarily use the set command to configure error handling,
# debugging, and script behavior within the local scope of a script or shell
# session. On the other hand, we use the export command to create global environment
# variables that other processes or scripts running in the same session can access"
# 
# for more info: https://www.baeldung.com/linux/bash-set-and-export

export PATH="$PATH:/home/max/.local/bin:/home/max/.cargo/bin:/usr/local/bin:/home/max/.config/herd-lite/bin"
export XDG_SCREENSHOTS_DIR="/home/max/Screenshots"
export PHP_INI_SCAN_DIR="/home/max/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "/etc/debian_version" ]; then
	export EDITOR="/usr/bin/nano"
else
	export EDITOR="/usr/bin/hx"
fi

# https://bash-prompt-generator.org/
# https://github.com/Sonico98/yazi-prompt.sh/blob/master/posix/yazi.sh
PS1='[\[\e[93m\]\u\[\e[0m\]@\[\e[95m\]\h\[\e[0m\]:\[\e[94m\]\W\[\e[0m\]\[\e[96m\]$(if [ -n "$YAZI_LEVEL" ]; then echo " (yazi)" ; fi)\[\e[92m\]$( if [[ ! -z "$(git branch --show-current 2>/dev/null)" ]]; then echo " #$(git branch --show-current 2>/dev/null)" ; fi )\[\e[0m\]] \[\e[91m\]\$\[\e[0m\] '

export PYTHONIOENCODING="utf-8"
# eval "$(thefuck --alias)"

export ProgressPreference='SilentlyContinue'
export BASH_SILENCE_DEPRECATION_WARNING=1

export WSL_UTF8=1
