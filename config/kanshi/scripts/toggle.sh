#!/bin/bash

# requires: kanshi

togglefile='/tmp/kanshi.toggle'
profile1='main'
profile2='projector'

if [ ! -e $togglefile ]; then
  echo $profile1
  kanshictl switch $profile1
  echo $profile1 > $togglefile
else
  if [ $(cat $togglefile) == $profile1 ]; then
    echo $profile2
    kanshictl switch $profile2
    echo $profile2 > $togglefile
  elif [ $(cat $togglefile) == $profile2 ]; then
    echo $profile1
    kanshictl switch $profile1
    echo $profile1 > $togglefile
  fi
fi
