#!/bin/bash

pkill pipewire
pkill wireplumber

sleep 1

riverctl spawn "pipewire"
riverctl spawn "wireplumber"
