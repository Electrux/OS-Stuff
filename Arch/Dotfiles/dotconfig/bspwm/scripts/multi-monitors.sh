#!/bin/bash

xrandr --auto --output HDMI3 --mode 1920x1080 --right-of eDP1
/home/electrux/.config/polybar/scripts/multi-monitors.sh

bspc monitor eDP1 -d I II III IV V
bspc monitor HDMI3 -d VI VII VIII IX X
