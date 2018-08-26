#!/bin/bash

wid=$1
class=$2
instance=$3

if [[ "$class" = mpv ]]; then
  xdotool windowsize --sync $wid 1000 570
  xdotool windowmove --sync $wid 1500 1220
  notify-send "Done on $wid"
fi
