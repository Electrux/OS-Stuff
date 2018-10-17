#!/bin/bash

xrandr --output HDMI3 --auto --right-of eDP1 --scale-from 1920x1200
/home/electrux/.config/polybar/scripts/multi-monitors.sh

#TODO: windows on new monitor occupy all screen space instead of
#      leaving space for polybar
bspc desktop VI -m HDMI3
bspc desktop Desktop --remove
bspc desktop VII -m HDMI3
bspc desktop VIII -m HDMI3
bspc desktop IX -m HDMI3
bspc desktop X -m HDMI3
#bspc monitor eDP1 -d I II III IV V
#bspc monitor HDMI3 -d VI VII VIII IX X
