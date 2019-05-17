xrdb -merge ~/.Xresources
xrandr -s 2880x1800
xrandr --dpi 220
xset -dpms s off
xbacklight -set 20
xbacklight -ctrl smc::kbd_backlight -set 20
libinput-gestures-setup start
exec awesome
