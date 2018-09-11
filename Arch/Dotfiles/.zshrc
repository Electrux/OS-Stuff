# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/electrux/.oh-my-zsh

# MacOS thingy for fpath
#  fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
ZSH_THEME="geometry/geometry"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set path for new ViM
# alias vim='/usr/local/bin/vim'

# Set zsh autosuggestions path
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set zsh syntax highlighting path
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias scpna='sudo rsync -h --info=progress2'

# Set neovim as vim and default EDITOR
alias vim="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"

# Go lang settings
export GOPATH="${HOME}/.go"
export PATH="${PATH}:${GOPATH}/bin"

# Emoji CLI
source /usr/share/zsh/plugins/emoji-cli/emoji-cli.zsh

# Correct previous command if typo
eval $(thefuck --alias fuck)

# Compile + Run a source file
run() {
	filename="${1%%.*}"
	ext="${1#*.}"
	if [[ "$ext" == "c" ]]; then
		gcc $@ -o "$filename"
		./${filename}
	elif [[ "$ext" == "cpp" ]]; then
		g++ $@ -o "$filename"
		./${filename}
	elif [[ "$ext" == "py" ]]; then
		python3 $@
	elif [[ "$ext" == "java" ]]; then
		javac $@
		java ${filename}
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

# ZSH spaceship prompt settings reconfigure
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_CHAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_DIR_TRUNC="0"
SPACESHIP_EXEC_TIME_ELAPSED="5"
SPACESHIP_BATTERY_SHOW="charged"
SPACESHIP_EXIT_CODE_SHOW="true"

echo ''
neofetch
