# Qt HiDPI scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# GTK-3 HiDPI scaling
export GDK_SCALE=2
export GDK_DPI_SCALE=0.8
# GTK disable overlay scrollbar
export GTK_OVERLAY_SCROLLING=0

export PATH="$HOME/.cargo/bin:$PATH"

eval $(keychain --eval --agents ssh $(ls ~/.ssh/id_rsa* | grep -v '.pub'))
source $HOME/.keychain/$HOST-sh

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
