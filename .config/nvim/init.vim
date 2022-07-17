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
Plug 'jiangmiao/auto-pairs'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
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

"augroup run_file
	"autocmd BufEnter *.c let @r=":w\<CR> :!gcc % -o %:r\<CR> | :vsp | terminal ./%:r\<CR>"
    "autocmd BufEnter *.py let @r=":w\<CR> :vsp | terminal python %\<CR>i"
	"autocmd BufEnter *.java let @r=":w\<CR> :!javac % \<CR> :vsp | terminal java %:r \<CR>"
	"autocmd BufEnter *.tex let @r="w\<CR> :!pdflatex % \<CR> :vsp | terminal  zathura %:r.pdf\<CR>"
"augroup end


lua << EOF
	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap=true, silent=true }
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
	  -- Enable completion triggered by <c-x><c-o>
	  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	  -- Mappings.
	  -- See `:help vim.lsp.*` for documentation on any of the below functions
	  local bufopts = { noremap=true, silent=true, buffer=bufnr }
	  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	  vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	  end, bufopts)
	  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
	end

	local lsp_flags = {
	  -- This is the default in Nvim 0.7+
	  debounce_text_changes = 150,
	}
	--require('nvim-lsp-install').setup{}

	local lspconfig = require('lspconfig')
	lspconfig.pyright.setup{}
	lspconfig.jdtls.setup{}
	lspconfig.bashls.setup{}
EOF
