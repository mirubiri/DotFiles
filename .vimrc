syntax enable
colorscheme desert 
let mapleader = ","
set backspace=indent,eol,start
set hlsearch
set nocompatible
set incsearch
set autoindent
set smarttab
set smartindent
set tabstop=2
set number
set ignorecase
set smartcase
set showcmd
set t_CO=256
let g:airline#extensions#tabline#enabled = 1
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
call plug#end()

augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

nmap <Leader>t :NERDTree<cr>
nmap <Leader>w :w<cr>
nmap <Leader>wq :wq<cr>
nmap <Leader>q :q!<cr>
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><Leader> :nohlsearch<cr>
