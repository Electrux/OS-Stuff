# Set bigger font
setfont sun12x22

# Qt HiDPI scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# GTK-3 HiDPI scaling
export GDK_SCALE=2
export GDK_DPI_SCALE=0.375
# GTK disable overlay scrollbar
export GTK_OVERLAY_SCROLLING=0

# Important variables
export EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/bin/urxvt"
export BROWSER="/usr/bin/google-chrome-stable"
export WALLPAPER="~/Pictures/Wallpapers/minimal-ocean-whale.png"

# TODO: Having autologin screws up with eval/source.

eval $(keychain --eval --agents ssh $(/usr/bin/ls ~/.ssh/id_rsa* | grep -v '.pub'))
source ~/.keychain/$HOST-sh

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
