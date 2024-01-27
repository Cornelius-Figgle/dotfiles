#!/bin/bash

export SUDO_ASKPASS="/home/max/.config/tofi/scripts/askpass.sh"
sudo -A -E $1
