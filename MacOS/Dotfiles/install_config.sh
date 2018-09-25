#!/bin/bash

script_dir=$(dirname "$0")

mkdir -p ~/.config/ ~/.mpd

ln -sf ${script_dir}/.{zshrc,vimrc,spacemacs,ncmpcpp} ~/
ln -sf ${script_dir}/.mpd/mpd.conf ~/.mpd/mpd.conf
ln -sf ${script_dir}/.config/ranger ~/.config/