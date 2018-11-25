# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/electrux/.oh-my-zsh

ZSH_THEME="lambda-mod"

plugins=(git zsh-completions)

source $ZSH/oh-my-zsh.sh

# Set zsh autosuggestions path
source /usr/share/zsh/site-contrib/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set zsh syntax highlighting path
source /usr/share/zsh/site-contrib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Jump around with z
source ~/Git/z/z.sh

# Source the dotfiles shortcut function
source ~/Git/Electrux/OS-Stuff/Customization/scripts/editdots.sh

# Make output of less command colorized.
# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
#export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

# Set ls_extended as the ls command
alias ls='ls_extended -s'
alias l='ls -lAh'

# Set rsync as the copy command
alias cp='rsync -ah --info=progress2'
# Don't preserve permissions
alias scpna='sudo rsync -h --info=progress2'

# Set neovim as vim
alias vim="/usr/bin/nvim"

# Go lang settings
export GOPATH="${HOME}/.go"
export PATH="${PATH}:${GOPATH}/bin"

# Copy & Paste
alias copy="xclip -sel clipboard"
alias paste="xclip -sel clipboard -o 2>/dev/null"

# Compile + Run a source file
run() {
	filename="${1%%.*}"
	ext="${1#*.}"
	if [[ "$ext" == "c" ]]; then
	        $(echo "gcc $@ -o ${filename} ${CPPFLAGS} ${LDFLAGS}") && echo "Executing ${filename}" && ./${filename}
	elif [[ "$ext" == "cpp" ]]; then
	        $(echo "g++ -std=c++17 $@ -o ${filename} ${CPPFLAGS} ${LDFLAGS}") && echo "Executing ${filename}" && ./${filename}
	elif [[ "$ext" == "rs" ]]; then
                rustc $@ && ./${filename}
        elif [[ "$ext" == "d" ]]; then
                dmd $@ && ./${filename}
	elif [[ "$ext" == "py" ]]; then
	        python3 $@
	elif [[ "$ext" == "java" ]]; then
		javac $@ && echo "Executing ${filename}" && java ${filename}
	fi
}

reload() {
	prog="${1}"
	if [[ "$prog" == "polybar" ]]; then
		killall polybar
		polybar --reload example &
		disown %polybar
	fi
}

echo ''
neofetch

echo ''
task next
