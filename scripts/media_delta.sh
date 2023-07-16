#!/bin/bash

# note: clear notify space
killall dunst

# note: cli args
op=$1  # args: {vol|mute|mic|bright|media}
offset=$2  # args: {up|down|toggle|pause|next|prev}
value=$3  # args: <any>

# note: vars
sink=@DEFAULT_SINK@

# note: main functions
function vol {
	cur_vol=$(pactl get-sink-volume $sink | grep -o ...% | head -1 | awk '{$1=$1};1' | sed 's/.\{1\}$//')

	if [[ $offset = up ]]; then
		if [[ $(( $(( $cur_vol + $value )) < 100 )) ]]; then
			pactl set-sink-volume $sink "+${value}%"
		fi
	elif [[ $offset = down ]]; then
		pactl set-sink-volume $sink "-${value}%"
	else
		exit 2
	fi

	notify-send -i ~/.local/share/icons/Win11-dark/status/24/volume-level-high.svg " Volume " " $( echo $cur_vol )% "
}

function mute {
	# note: always just toggles it, no matter what $offset is
	pactl set-sink-mute $sink toggle

	if [ $(pactl get-sink-mute @DEFAULT_SINK@ | grep -o -e "yes" -e "no") = yes ]; then
		notify-send -i ~/.local/share/icons/Win11-dark/status/24/audio-volume-muted-symbolic.svg " Muted "
	else
		notify-send -i ~/.local/share/icons/Win11-dark/status/24/volume-level-high.svg " Unmuted "
	fi
}

function mic {
	# note: always just toggles it, no matter what $offset is
	pactl set-sink-input-mute $sink toggle

	#if [ $(pactl get-sink-input-mute @DEFAULT_SINK@ | grep -o -e "yes" -e "no") = yes ]; then
    #	notify-send -i ~/.local/share/icons/Win11-dark/status/24/audio-input-microphone-muted.svg " Mic Muted "
    #else
	#    notify-send -i ~/.local/share/icons/Win11-dark/status/24/audio-input-microphone-none-panel.svg " Mic Unmuted "
    #fi
}

function bright {
	if [[ $offset = up ]]; then
		brightnessctl s $value%+
	elif [[ $offset = down ]]; then
		brightnessctl s $value%-
	else
		exit 2
	fi

	notify-send -i ~/.local/share/icons/Win11-dark/status/24/display-brightness-symbolic.svg " Brightness " " $(expr $(brightnessctl g) \* 100 / 937)%"
}

function media {
	if [[ $offset = pause ]]; then
		playerctl play-pause
		if [ $(playerctl status) = Playing ]; then
			notify-send " Paused "
		elif [ $(playerctl status) = Paused ]; then
			notify-send " Playing "
		fi
	elif [[ $offset = next ]]; then
		playerctl next
	elif [[ $offset = prev ]]; then
		playerctl previous
	else
		exit 2
	fi
}

# note: runner
$op  # note: calls the function with the name $op
