#!/bin/bash

user="Electrux"
base_dir="${HOME}/Git/${user}"
os_stuff_dir="${base_dir}/OS-Stuff"
script_dir="${os_stuff_dir}/Gentoo"

# Base

## In case one forgets this
sudo locale-gen

## Create directories
mkdir -p ~/{Documents,Downloads,Movies,Git/${user},.local/share/fonts,.config,.mpd}

# Clone git repositories

git clone https://github.com/Electrux/OS-Stuff.git ${os_stuff_dir}

# Core settings

## Bootloader
sudo mkdir -p /boot/loader/entries
sudo cp ${script_dir}/boot/loader/entries/gentoo.conf /boot/loader/entries/

## etc
sudo cp ${script_dir}/etc/bluetooth/*.conf /etc/bluetooth/
sudo cp ${script_dir}/etc/dbus-1/system.d/*.conf /etc/dbus-1/system.d/
sudo cp ${script_dir}/etc/modprobe.d/*.conf /etc/modprobe.d/
sudo cp ${script_dir}/etc/conf.d/modules /etc/conf.d/
sudo cp ${script_dir}/etc/pulse/*.pa /etc/pulse/
sudo cp ${script_dir}/etc/sysctl.d/*.conf /etc/sysctl.d/
sudo cp ${script_dir}/etc/udev/rules.d/*.rules /etc/udev/rules.d/
sudo cp ${script_dir}/etc/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/
sudo ln -sf ${script_dir}/etc/portage/make.conf /etc/portage/

### Auto-login and sleep on flap down
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo cp ${script_dir}/etc/systemd/system/getty@tty1.service.d/override.conf /etc/systemd/system/getty@tty1.service.d/
sudo cp ${script_dir}/etc/systemd/logind.conf /etc/systemd/

## Binaries
sudo ln -sf ${script_dir}/usr/bin/* /usr/bin/

## Kernel files
sudo ln -sf ${script_dir}/usr/src/linux/.config /usr/src/linux/

## Systemd services
sudo cp ${script_dir}/etc/systemd/system/*.service /etc/systemd/system/
sudo cp ${script_dir}/etc/systemd/user/* /etc/systemd/user/
sudo systemctl daemon-reload

## Alsa sound config
sudo cp ${script_dir}/var/lib/alsa/* /var/lib/alsa/

# Configs

## Core
ln -sf ${script_dir}/dotncmpcpp ~/.ncmpcpp
ln -sf ${script_dir}/dotconfig/{alacritty,i3,compton,dunst,mpd,mpv,polybar,ranger,zathura,libinput-gestures.conf} ~/.config/

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

# Install (Neo)Vim Plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g')"
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
git clone https://github.com/rupa/z.git ~/Git/z
