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
Plug 'lervag/vimtex'
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

" vimtex
	" This is necessary for VimTeX to load properly. The "indent" is optional.
	" Note that most plugin managers will do this automatically.
	filetype plugin indent on

	" This enables Vim's and neovim's syntax-related features. Without this, some
	" VimTeX features will not work (see ":help vimtex-requirements" for more
	" info).
	syntax enable

	" Viewer options: One may configure the viewer either by specifying a built-in
	" viewer method:
	let g:vimtex_view_method = 'zathura'

	" Or with a generic interface:
	let g:vimtex_view_general_viewer = 'okular'
	let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

	" VimTeX uses latexmk as the default compiler backend. If you use it, which is
	" strongly recommended, you probably don't need to configure anythig. If you
	" want another compiler backend, you can change it as follows. The list of
	" supported backends and further explanation is provided in the documentation,
	" see ":help vimtex-compiler".
	let g:vimtex_compiler_method = 'latexrun'

	" Most VimTeX mappings rely on localleader and this can be changed with the
	" following line. The default is usually fine and is the symbol "\".
	"let maplocalleader = ","n

" vimwiki
	" set to markdown
	let g:vimwiki_list = [{'path': '~/vimwiki/',
		\ 'syntax': 'markdown', 'ext': '.md'}]	

augroup run_file
	"autocmd BufEnter *.c let @r=":w\<CR> :!gcc % -o %:r\<CR> | :vsp | terminal ./%:r\<CR>"
    autocmd BufEnter *.py let @r=":w\<CR> :vsp | terminal python %\<CR>i"
	autocmd BufEnter *.java let @r=":w\<CR> :!javac % \<CR> :vsp | terminal java %:r \<CR>"
	autocmd BufEnter *.tex let @r="w\<CR> :!pdflatex % \<CR> :vsp | terminal  zathura %:r.pdf\<CR>"
augroup end


