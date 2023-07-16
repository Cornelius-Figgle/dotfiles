#!/bin/bash

set_wallpaper() {

    monitor="eDP-1"

    wallpaper_dir="/home/max/Pictures/huleeb-cropped"

    files=($wallpaper_dir/*)

    random_file=("${files[RANDOM % ${#files[@]}]}")

    hyprctl hyprpaper wallpaper "$monitor,$random_file"

}

set_wallpaper

