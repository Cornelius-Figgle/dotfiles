#!/bin/bash

preload_wallpaper() {

    monitor="eDP-1"

    wallpaper_dir="/home/max/Pictures/huleeb-cropped"

    wallpapers=$(find "$wallpaper_dir" -type f | sort -R )

    for wallpaper in $wallpapers; do
        preload_string+="preload = "$wallpaper"\n"
        wallpaper_string+="wallpaper = $monitor, $wallpaper\n"
    done

    echo -en "$preload_string$wallpaper_string" > ~/.config/hypr/hyprpaper.conf

}

preload_wallpaper
