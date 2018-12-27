#!/bin/bash

user="Electrux"
base_dir="${HOME}/Git/${user}"
os_stuff_dir="${base_dir}/OS-Stuff"
script_dir="${os_stuff_dir}/Arch/Dotfiles"

# Base

## In case one forgets this
sudo locale-gen

## Create directories
mkdir -p ~/{Documents,Downloads,Movies,Git/${user},.local/share/fonts,.config,.mpd}

## Install Rust lang
sudo pacman -S rustup
rustup default nightly && rustup update
source ~/.cargo/env

## Install other software
sudo pacman -S --noconfirm --needed lvm2 zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions syncthing mpd ncmpcpp ranger neofetch mpv wget curl git dunst rofi i3-gaps networkmanager pulseaudio pulseaudio-bluetooth pulseaudio-alsa alsa-lib alsa-utils bluez blueman pavucontrol bluez-utils network-manager-applet acpi youtube-dl openssh thefuck bc compton emacs feh ttf-font-awesome noto-fonts-emoji alacritty flameshot exa lxappearance qbittorrent python-pip python2-pip lsof strace htop

# Clone git repositories

git clone https://github.com/Electrux/OS-Stuff.git ${os_stuff_dir}
git clone https://github.com/rupa/z.git ~/Git/z/

# Core settings

## Bootloader
sudo mkdir -p /boot/loader/entries
sudo cp ${script_dir}/boot/loader/entries/arch.conf /boot/loader/entries/

## etc
sudo cp ${script_dir}/etc/bluetooth/*.conf /etc/bluetooth/
sudo cp ${script_dir}/etc/dbus-1/system.d/*.conf /etc/dbus-1/system.d/
sudo cp ${script_dir}/etc/modprobe.d/*.conf /etc/modprobe.d/
sudo cp ${script_dir}/etc/pulse/*.pa /etc/pulse/
sudo cp ${script_dir}/etc/sysctl.d/*.conf /etc/sysctl.d/
sudo cp ${script_dir}/etc/udev/rules.d/*.rules /etc/udev/rules.d/
sudo cp ${script_dir}/etc/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/
sudo cp ${script_dir}/etc/makepkg.conf /etc/
sudo cp ${script_dir}/etc/mkinitcpio.conf /etc/
sudo ln -sf ${script_dir}/etc/fonts/conf.d/99-noto-emoji.conf /etc/fonts/conf.d/

### Auto-login and sleep on flap down
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo cp ${script_dir}/etc/systemd/system/getty@tty1.service.d/override.conf /etc/systemd/system/getty@tty1.service.d/
sudo cp ${script_dir}/etc/systemd/logind.conf /etc/systemd/

## Binaries
sudo ln -sf ${script_dir}/usr/bin/* /usr/bin/

## Systemd services
sudo cp ${script_dir}/usr/lib/systemd/system/*.service /usr/lib/systemd/system/
sudo cp ${script_dir}/usr/lib/systemd/user/* /usr/lib/systemd/user/

## Alsa sound config
sudo cp ${script_dir}/var/lib/alsa/* /var/lib/alsa/

# Configs

## Core
ln -sf ${script_dir}/dotncmpcpp ~/.ncmpcpp
ln -sf ${script_dir}/dotconfig/{alacritty,compton,dunst,i3,mpd,polybar,ranger,zathura,libinput-gestures.conf} ~/.config/

## Others
ln -sf ${script_dir}/.{asoundrc,spacemacs,vimrc,xinitrc,Xresources,zprofile,zshrc} ~/

## For neovim
mkdir -p ~/.config/nvim/
ln -sf ${script_dir}/.vimrc ~/.config/nvim/init.vim

# Enable systemd services

## System services
sudo systemctl enable NetworkManager
#sudo systemctl enable bluetooth
sudo systemctl enable disable_gpe
sudo systemctl enable hdmi_sound_toggle
#sudo systemctl start NetworkManager
#sudo systemctl start bluetooth
#sudo systemctl start disable_gpe
#sudo systemctl start hdmi_sound_toggle

## User services
systemctl --user enable lowpower.timer
#systemctl --user start lowpower.timer

systemctl --user enable syncthing
systemctl --user enable mpd
#systemctl --user start syncthing
#systemctl --user start mpd

# Install trizen

mkdir -p /tmp/trizen
git clone https://aur.archlinux.org/trizen-git.git /tmp/trizen
cd /tmp/trizen
makepkg -si --needed --noconfirm
cd ~
sudo rm -rf /tmp/trizen

# Install AUR packages

sudo pacman -R xorg-xbacklight # For acpilight
sudo pacman -S optipng # For nordic-theme-git
trizen -S --noconfirm powerline-fonts-git google-chrome acpilight emoji-cli-git polybar-git wd719x-firmware aic94xx-firmware libinput-gestures-git bcwc-pcie-git i3lock-shiver bibata-cursor-theme nordic-theme-git newaita-icons-git gotop-bin visual-studio-code-bin

# Install (Neo)Vim Plug

sudo pip3 install neovim
sudo pip2 install neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Finally, install oh my zsh and its theme

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g')"
git clone https://github.com/denysdovhan/spaceship-prompt.git "${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt"
rm -rf ~/.zshrc
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

sudo mkinitcpio -p linux
