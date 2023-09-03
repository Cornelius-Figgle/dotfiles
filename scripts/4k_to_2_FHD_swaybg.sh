#!/bin/bash
# requires ImageMagick & swaybg

orig_image=~/source/dotfiles/wallpapers/cityscape-urban-pink-foggy-sunrise-skyscrapers-5k-3840x2160-1323.jpg
output_1=DVI-D-1
output_2=HDMI-A-1

# convert <input file> -crop WxH+L+T <output file>
convert $orig_image -crop 1920x1080+0+540 /tmp/4k_to_2_FHD_A
convert $orig_image -crop 1920x1080+1920+540 /tmp/4k_to_2_FHD_B

# sets wp via swaybg
swaybg -o $output_1 -m fill -i /tmp/4k_to_2_FHD_A &
swaybg -o $output_2 -m fill -i /tmp/4k_to_2_FHD_B &
