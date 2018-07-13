xrdb -merge ~/.Xresources
xrandr -s 2880x1800
xrandr --dpi 220
xbacklight -set 20
#dbus-update-activation-environment --systemd DISPLAY
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
exec awesome
