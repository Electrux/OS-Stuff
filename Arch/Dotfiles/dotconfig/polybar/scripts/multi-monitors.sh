#!/bin/bash

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi
#!/bin/bash

xrandr --auto --output HDMI3 --mode 1920x1080 --right-of eDP1
/home/electrux/.config/polybar/scripts/monitor-mgmt.sh

