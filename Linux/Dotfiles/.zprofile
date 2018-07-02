# Qt HiDPI scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# GTK-3 HiDPI scaling
export GDK_SCALE=2
export GDK_DPI_SCALE=0.8

export PATH="$HOME/.cargo/bin:$PATH"

eval $(keychain --noask --eval --agents ssh $(ls ~/.ssh/id_rsa* | grep -v '.pub'))
source $HOME/.keychain/$HOST-sh

