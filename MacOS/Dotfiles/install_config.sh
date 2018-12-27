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

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g')"
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
git clone https://github.com/rupa/z.git ~/Git/z

brew install jq fzf peco
git clone https://github.com/b4b4r07/emoji-cli.git ~/Git/emoji-cli
