#!/bin/bash

killall polybar
/home/electrux/.config/polybar/scripts/multi-monitors.sh
xrandr --output HDMI3 --off
bspc monitor eDP1 -d I II III IV V VI VII VIII IX X
