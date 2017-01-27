
"-- Plugins --
call plug#begin()
Plug 'sjl/badwolf'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jremmen/vim-ripgrep'
Plug 'sheerun/vim-polyglot'
call plug#end()
"--

"-- Colors --
syntax enable
colorscheme badwolf
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


augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

