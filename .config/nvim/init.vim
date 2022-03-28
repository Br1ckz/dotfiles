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
call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'jiangmiao/auto-pairs'
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
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdfi,*.pyc,*.exe,*.flv,*.img,*.xlsx

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

" Open when no files were speficied on vim launch
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle nerdtree
map <C-n> :NERDTreeToggle<CR>
