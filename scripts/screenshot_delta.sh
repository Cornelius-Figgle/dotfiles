#!/bin/bash

# wrapper for taking screenshots with grim & slurp

function select {
  image=$(grim -g "$(slurp)")
  $image > $XDG_SCREENSHOTS_DIR/$(date +"%s_grim.png")
  $image | wl-copy
}


function full {
  image=$(grim)
  $image > $XDG_SCREENSHOTS_DIR/$(date +"%s_grim.png")
  wl-copy < $image
}

$1