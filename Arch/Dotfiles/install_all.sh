#!/bin/bash

script_dir=$(dirname "$0")

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

### Auto-login and sleep on flap down
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo cp ${script_dir}/etc/systemd/system/getty@tty1.service.d/override.conf /etc/systemd/system/getty@tty1.service.d/
sudo cp ${script_dir}/etc/systemd/system/logind.conf /etc/systemd/system/

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
ln -sf ${script_dir}/dotconfig/{alacritty,bspwm,compton,dunst,mpd,polybar,ranger,sxhkd,libinput-gestures.conf} ~/.config/

## Others
ln -sf ${script_dir}/.{asoundrc,spacemacs,vimrc,xinitrc,Xresources,zprofile,zshrc} ~/

## For neovim
mkdir -p ~/.config/nvim/
ln -sf ${script_dir}/.vimrc ~/.config/nvim/init.vim

# Enable systemd services

## System services
sudo systemctl enable disable_gpe
sudo systemctl enable hdmi_sound_toggle

## User services
systemctl --user enable lowpower.timer