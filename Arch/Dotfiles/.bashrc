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
alias ls='exa -s name -F'
alias l='ls -la'

# Set rsync as the copy command
alias cp='rsync -ah --info=progress2'
# Don't preserve permissions
alias scpna='sudo rsync -h --info=progress2'

# Set neovim as vim
alias vim="/usr/bin/nvim"

# Go lang settings
export GOPATH="${HOME}/.go"
export PATH="${PATH}:${GOPATH}/bin"

# Rust lang settings
export PATH="${PATH}:${HOME}/.cargo/bin"

# Copy & Paste
alias copy="xclip -sel clipboard"
alias paste="xclip -sel clipboard -o 2>/dev/null"

# Git shortcuts
alias gd="git diff"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gcl="git clone"

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

# Kernel compile & install single command
kerninstall() {
	make -j8 && sudo make -j8 modules_install && sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-linux-custom && sudo mkinitcpio -p linux-custom && sudo cp System.map /boot/System.map && \
		sudo dkms autoinstall -k $(file -bL arch/x86_64/boot/bzImage | grep -o 'version [^ ]*' | cut -d ' ' -f2)
}

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

echo ''
neofetch

