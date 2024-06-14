# "In summary, we primarily use the set command to configure error handling,
# debugging, and script behavior within the local scope of a script or shell
# session. On the other hand, we use the export command to create global environment
# variables that other processes or scripts running in the same session can access"
# 
# for more info: https://www.baeldung.com/linux/bash-set-and-export

export PATH="$PATH:/home/max/.local/bin:/home/max/.cargo/bin:/usr/local/bin"
export XDG_SCREENSHOTS_DIR="/home/max/Screenshots"
export EDITOR="/usr/bin/hx"

# https://bash-prompt-generator.org/
PS1='[\[\e[93m\]\u\[\e[0m\]@\[\e[95m\]\h\[\e[0m\]:\[\e[94m\]\w\[\e[0m\]\[\e[92m\]$( if [[ ! -z "$(git branch --show-current 2>/dev/null)" ]]; then echo " #$(git branch --show-current 2>/dev/null)" ; fi )\[\e[0m\]] \[\e[91m\]\$\[\e[0m\] '

export PYTHONIOENCODING="utf-8"
# eval "$(thefuck --alias)"

export ProgressPreference='SilentlyContinue'

export WSL_UTF8=1
