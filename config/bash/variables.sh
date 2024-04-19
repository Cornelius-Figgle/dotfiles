# "In summary, we primarily use the set command to configure error handling,
# debugging, and script behavior within the local scope of a script or shell
# session. On the other hand, we use the export command to create global environment
# variables that other processes or scripts running in the same session can access"
# 
# for more info: https://www.baeldung.com/linux/bash-set-and-export

export PATH="$PATH:/home/max/.local/bin:/home/max/.cargo/bin"
export XDG_SCREENSHOTS_DIR="/home/max/Screenshots"
export EDITOR="/usr/bin/hx"

# https://bash-prompt-generator.org/
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null) ; if [[ ! -z "${PS1_CMD1}" ]];then PS1_CMD1=" #$PS1_CMD1";fi'
PS1='[\u@\h:\W${PS1_CMD1}] \$ '


export PYTHONIOENCODING="utf-8"
# eval "$(thefuck --alias)"

export ProgressPreference='SilentlyContinue'

export WSL_UTF8=1
