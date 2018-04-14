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

let g:ycm_global_ycm_extra_conf = '/Users/electrux/GitHub/Electrux/OS-Stuff/MacOS/DotFiles/.ycm_extra_conf.py'

" Remove cursor change in nvim
set guicursor=

" Enable python3 support ( for YCM ) in nvim
let g:python3_host_prog = '/usr/local/bin/python3'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" add fzf in run time path
set rtp+=/usr/local/opt/fzf
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'

" You complete me plugin for ViM.
Plugin 'Valloric/YouCompleteMe'

" Plugin for file management.
Plugin 'scrooloose/nerdtree'

" Plugin for git support in file management.
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Plugin for colors of files/folders in file management.
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plugin for Lively Previewing LaTeX PDF Output
Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_engine = 'xelatex' . ' '

autocmd Filetype tex setl updatetime=1
