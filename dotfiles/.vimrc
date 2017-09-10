set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
set noexpandtab
set shiftwidth=8
set tabstop=8
set autoindent
set relativenumber
set number

let g:ycm_global_ycm_extra_conf = '/Users/electrux/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" You complete me plugin for ViM.
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
