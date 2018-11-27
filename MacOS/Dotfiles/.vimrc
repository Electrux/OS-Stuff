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

let g:ycm_global_ycm_extra_conf = '/Users/electrux/Git/Electrux/OS-Stuff/MacOS/DotFiles/.ycm_extra_conf.py'

" Remove cursor change in nvim.
set guicursor=

" Enable python3 support ( for YCM ) in nvim.
let g:python3_host_prog = '/usr/local/bin/python3'

" For vimtex with neovim
let g:vimtex_compiler_progname = 'nvr'

" NERDTree setting.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" add fzf in run time path.
set rtp+=/usr/local/opt/fzf

" ViM-Plug begins.
call plug#begin('~/.local/share/nvim/plugged')

" Plugin for code completion server - You complete me.
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --system-libclang --racer-completer' }

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

" Plugins for dlang
Plug 'Sirsireesh/vim-dlang-phobos-highlighter'
Plug 'idanarye/vim-dutyl'

" Plugin for latex
Plug 'lervag/vimtex'

" Plugins for powerline via ViM-Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Base16 ViM themes
Plug 'chriskempson/base16-vim'

" Displays indentation level with thin line
"Plug 'yggdroot/indentLine'

" ViM-Plug ends.
call plug#end()

filetype plugin indent on    " required

let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_engine = 'xelatex' . ' '
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'

" Set ViM color scheme
set termguicolors
colorscheme base16-chalk

" For dlang
let g:dutyl_stdImportPaths=['/usr/local/include/dlang/dmd']
call dutyl#register#tool('dfmt','~/.dub/packages/dfmt-master/dfmt/bin/dfmt')
call dutyl#register#tool('dscanner','~/.dub/packages/dscanner-0.5.11/dscanner/bin/dscanner')

autocmd Filetype tex setl updatetime=1
autocmd VimEnter d if exists(':DUDCDrestartServer') | DUDCDrestartServer | endif
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Customization

set showcmd
let mapleader = ' '

" Split controls
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" YCM keys
nnoremap <leader>yg :YcmCompleter GetType<CR>
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <leader>ydc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ydf :YcmCompleter GoToDefinition<CR>

" Other editing
"clear highlight
nnoremap <leader><leader> :noh<CR>
nnoremap <leader>q :bd<CR>

" Split direction
set splitbelow
set splitright
