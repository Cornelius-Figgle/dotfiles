# "In summary, we primarily use the set command to configure error handling,
# debugging, and script behavior within the local scope of a script or shell
# session. On the other hand, we use the export command to create global environment
# variables that other processes or scripts running in the same session can access"
# 
# for more info: https://www.baeldung.com/linux/bash-set-and-export

export PATH="$PATH:/home/max/.local/bin:/home/max/.cargo/bin"
export XDG_SCREENSHOTS_DIR="/home/max/Screenshots"
export EDITOR="alacritty -e hx"

PS1='\w \$ '

export PYTHONIOENCODING="utf-8"
# eval "$(thefuck --alias)"

export ProgressPreference='SilentlyContinue'

export WSL_UTF8=1
