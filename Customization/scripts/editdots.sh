#!/bin/sh

get_dot_file() {
	echo "$1"
	if [[ "$1" == "wm" ]]; then
		res="$HOME/.config/bspwm/bspwmrc"
	elif [[ "$1" == "zsh" ]]; then
		res="$HOME/.zshrc"
	elif [[ "$1" == "nvim" ]]; then
		res="$HOME/.config/nvim/init.vim"
	elif [[ "$1" == "vim" ]]; then
		res="$HOME/.vimrc"
	elif [[ "$1" == "sxhkd" ]]; then
		res="$HOME/.config/sxhkd/sxhkdrc"
	elif [[ "$1" == "comp" ]]; then
		res="$HOME/.config/compton/compton.conf"
	elif [[ "$1" == "alac" ]]; then
		res="$HOME/.config/alacritty/alacritty.yml"
	elif [[ "$1" == "poly" ]]; then
		res="$HOME/.config/polybar/config"
	else
		res=""
	fi
}

dotf() {
	if [[ -z "$1" ]]; then
		echo "Enter the name of config to edit"
		return 1;
	fi
	get_dot_file "$1"

	vim $res
}
