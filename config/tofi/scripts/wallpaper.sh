#!/bin/bash
# requires tofi, ImageMagick & swaybg

function choose {
  image=$(ls ~/.config/river/wallpapers | tofi)
  2FHD "/home/max/.config/river/wallpapers/${image}"
}

function 4K {
  # convert <input file> -crop WxH+L+T <output file>
  convert $1 -crop 1920x1080+0+540 /tmp/wallpaper_a
  convert $1 -crop 1920x1080+1920+540 /tmp/wallpaper_b

  set
}

function 2FHD {
  # convert <input file> -crop WxH+L+T <output file>
  convert $1 -crop 1920x1080+0+0 /tmp/wallpaper_a
  convert $1 -crop 1920x1080+1920+0 /tmp/wallpaper_b

  set
}

function set {
  output_1=DP-1
  output_2=DP-2

  # sets wp via swaybg
  swaybg -o $output_1 -m fill -i /tmp/wallpaper_a &
  swaybg -o $output_2 -m fill -i /tmp/wallpaper_b &
}

choose
