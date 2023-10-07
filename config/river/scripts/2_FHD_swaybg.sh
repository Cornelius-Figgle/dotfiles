#!/bin/bash
# requires ImageMagick & swaybg

#orig_image=~/source/dotfiles/wallpapers/wallhaven-0q1q8r.png
orig_image=~/source/dotfiles/wallpapers/wallhaven-0q1q8r.jpg
output_1=DVI-D-1
output_2=HDMI-A-1

# convert <input file> -crop WxH+L+T <output file>
convert $orig_image -crop 1920x1080+0+0 /tmp/2_FHD_A
convert $orig_image -crop 1920x1080+1920+0 /tmp/2_FHD_B

# sets wp via swaybg
swaybg -o $output_1 -m fill -i /tmp/2_FHD_A &
swaybg -o $output_2 -m fill -i /tmp/2_FHD_B &

exit 0