# https://github.com/hyprwm/hyprpaper/issues/68

#!/bin/bash

hyprctl hyprpaper unload all
killall hyprpaper

echo "splash = false" > ~/.config/hypr/hyprpaper.conf
echo "ipc = off" >> ~/.config/hypr/hyprpaper.conf
monitors=$(hyprctl monitors -j | jq -r ".[] | .name")

for monitor in $monitors; do
	wallpaper=$(fd ".png|.jpg|.jpeg" ~/source/dotfiles/wallpapers/ | shuf -n1)
	echo "preload = $wallpaper" >> ~/.config/hypr/hyprpaper.conf
	echo "wallpaper = $monitor,$wallpaper" >> ~/.config/hypr/hyprpaper.conf
done

hyprpaper &