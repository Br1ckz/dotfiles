"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'jiangmiao/auto-pairs'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
call plug#end()

set title
set number relativenumber
set spell 
set background=dark
"set highlight
set autoindent
set smartcase 
set smarttab
set autochdir
set backspace=indent,eol,start

set clipboard+=unnamedplus
"set term=xterm-256color
set encoding=UTF-8
set nocompatible
set cursorline

set shiftwidth=4
set tabstop=4
set nobackup
set smartcase
set showcmd
set showmatch

set wildmenu
set wildmode=list:longest

" Splits to the right and bottom
set splitright splitbelow

filetype on
filetype plugin on
syntax on
filetype indent on

set incsearch
set hlsearch
set nohls

" tokyonight-vim
	set termguicolors

	let g:tokyonight_style = 'night' " available: night, storm
	let g:tokyonight_enable_italic = 1

	colorscheme tokyonight
	let g:airline_theme = "tokyonight"

" nerdtree
	" Open when no files were speficied on vim launch
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

	" Toggle nerdtree
	map <C-n> :NERDTreeToggle<CR>

augroup run_file
	"autocmd BufEnter *.c let @r=":w\<CR> :!gcc % -o %:r\<CR> | :vsp | terminal ./%:r\<CR>"
    autocmd BufEnter *.py let @r=":w\<CR> :vsp | terminal python %\<CR>i"
	autocmd BufEnter *.java let @r=":w\<CR> :!javac % \<CR> :vsp | terminal java %:r \<CR>"
