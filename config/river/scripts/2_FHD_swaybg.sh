#!/bin/bash
# requires ImageMagick & swaybg

orig_image=~/source/dotfiles/wallpapers/wasteland_R.png
output_1=DP-1
output_2=DP-2

# convert <input file> -crop WxH+L+T <output file>
convert $orig_image -crop 1920x1080+0+0 /tmp/2_FHD_A
convert $orig_image -crop 1920x1080+1920+0 /tmp/2_FHD_B

# sets wp via swaybg
swaybg -o $output_1 -m fill -i /tmp/2_FHD_A &
swaybg -o $output_2 -m fill -i /tmp/2_FHD_B &

exit 0
