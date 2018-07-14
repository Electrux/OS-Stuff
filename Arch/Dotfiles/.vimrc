set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

set noexpandtab
set shiftwidth=8
set tabstop=8
set autoindent
set relativenumber
set number
set backspace=indent,eol,start

let g:ycm_global_ycm_extra_conf = '/home/electrux/GitHub/Electrux/OS-Stuff/Arch/Dotfiles/.ycm_extra_conf.py'

" Remove cursor change in nvim.
set guicursor=

" Enable python3 support ( for YCM ) in nvim.
let g:python3_host_prog = '/usr/bin/python3'

" NERDTree setting.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" add fzf in run time path.
set rtp+=/usr/bin/fzf

" ViM-Plug begins.
call plug#begin('~/.local/share/nvim/plugged')

" Plugin for code completion server - You complete me.
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --system-libclang' }

" Plugin for file management.
Plug 'scrooloose/nerdtree'

" Plugin for git support in file management.
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plugin for colors of files/folders in file management.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plugin for Lively Previewing LaTeX PDF Output.
Plug 'xuhdev/vim-latex-live-preview'

" Plugins for elixir support.
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Plugin for nim support
Plug 'zah/nim.vim'

" Plugins for powerline via ViM-Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Displays indentation level with thin line
Plug 'yggdroot/indentLine'

" ViM-Plug ends.
call plug#end()

filetype plugin indent on    " required

let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_engine = 'xelatex' . ' '
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'

autocmd Filetype tex setl updatetime=1
