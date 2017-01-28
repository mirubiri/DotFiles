
"-- Plugins --
call plug#begin()
Plug 'sjl/badwolf' "color scheme
Plug 'sjl/gundo.vim' "show undo tree
Plug 'majutsushi/tagbar' "show tag bar
Plug 'kien/ctrlp.vim' "fuzzy file search
Plug 'easymotion/vim-easymotion' "move to anywhere
Plug 'airblade/vim-gitgutter' "show file changes through git
Plug 'scrooloose/nerdtree' "show folder tree
Plug 'tpope/vim-fugitive' "git shortcuts and commands
Plug 'tpope/vim-surround' "manipulate surround characters
Plug 'jiangmiao/auto-pairs' "autopair surround characters while typing
Plug 'rizzatti/dash.vim' "provides shortcuts to open Dash
Plug 'tpope/vim-rails' "Rails useful commands
Plug 'tpope/vim-endwise' "Autopairs do..end
Plug 'vim-airline/vim-airline' "show bottom bar
Plug 'vim-airline/vim-airline-themes' "themes for the bottom bar
Plug 'jremmen/vim-ripgrep' "fuzzy search inside files
Plug 'sheerun/vim-polyglot' "syntax hihglighting for many languages
call plug#end()
"--

"-- Colors --
syntax enable "Enable syntax highlighting
colorscheme badwolf "Good looking color scheme
"--

let g:airline#extensions#tabline#enabled = 1

set backspace=indent,eol,start
set nocompatible
set autoindent
set smarttab
set smartindent
set ignorecase
set smartcase

"-- Spaces and Tabs --
set tabstop=2
set softtabstop=2
set expandtab
"

"-- UI Config --
set number "show line numbers
set showcmd "show command in bottom bar
filetype indent on "load filetype-specific indent file
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when needed
set showmatch "hihglight matching ()[]{}
set laststatus=2
"

"-- Searching --
set incsearch "search as characters are entered"
set hlsearch "highlight matches"
nmap <Leader><Leader> :nohlsearch<cr>
"

"-- Folding--
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nmap <Leader> za
"

"-- Movement --
nmap j gj
nmap k gk
"

"-- Leader Shortcuts --
let mapleader = "," "
nmap <leader>u :GundoToggle<CR>
nmap <leader>s :mksession<CR> "save session
nmap <Leader>t :NERDTree<cr>
nmap <Leader>w :w<cr>
nmap <Leader>wq :wq<cr>
nmap <Leader>q :q!<cr>
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><Space> :TagbarToggle<cr>
nmap <Leader>p :CtrlP<cr>
"

augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

