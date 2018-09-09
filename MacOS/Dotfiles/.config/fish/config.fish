# iterm shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# neovim instead of vim
alias vim /usr/local/bin/nvim
set -x EDITOR "/usr/local/bin/nvim"

# Make output of make colorized.
# Need colormake for this though
# alias make='/usr/local/bin/colormake'

# Exa for ls
alias ls "exa -s name -F"
alias l "ls -la"

# Cargo env
source {$HOME}/.cargo/env
