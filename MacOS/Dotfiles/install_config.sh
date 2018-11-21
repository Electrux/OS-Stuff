#!/bin/bash

script_dir=$(dirname "$0")

mkdir -p ~/.config/nvim ~/.mpd

ln -sf ${script_dir}/.{zshrc,vimrc,spacemacs,ncmpcpp} ~/
ln -sf ${script_dir}/.mpd/mpd.conf ~/.mpd/mpd.conf
ln -sf ${script_dir}/.config/ranger ~/.config/

# neovim
ln -sf ${script_dir}/.vimrc ~/.config/nvim/init.vim

# (neo)vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
