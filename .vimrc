
"-- Plugins --
call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'bbatsov/rubocop'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/badwolf' "color scheme
Plug 'sjl/gundo.vim' "show undo tree
Plug 'majutsushi/tagbar' "show tag bar
Plug 'easymotion/vim-easymotion' "move to anywhere
Plug 'airblade/vim-gitgutter' "show file changes through git
Plug 'scrooloose/nerdtree' "show folder tree
Plug 'mileszs/ack.vim' "search inside files
Plug 'tpope/vim-fugitive' "git shortcuts and commands
Plug 'tpope/vim-surround' "manipulate surround characters
Plug 'jiangmiao/auto-pairs' "autopair surround characters while typing
Plug 'rizzatti/dash.vim' "provides shortcuts to open Dash
Plug 'tpope/vim-rails' "Rails useful commands
Plug 'tpope/vim-endwise' "Autopairs do..end
Plug 'vim-airline/vim-airline' "show bottom bar
Plug 'vim-airline/vim-airline-themes' "themes for the bottom bar
Plug 'sheerun/vim-polyglot' "syntax hihglighting for many languages
call plug#end()
"--

"-- Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
"-- TagBar Plugin
let g:tagbar_autofocus=1
let g:tagbar_compact=1
"

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
set shiftwidth=2

let g:ctrlp_max_files = 0

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
let g:ackprg = 'ag --vimgrep'
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
let mapleader = " " 
nmap <leader>u :GundoToggle<CR>
nmap <leader>s :mksession<CR> "save session
nmap <Leader>pt :NERDTreeToggle<cr>
nmap <Leader>w :w<cr>
nmap <Leader>wq :wq<cr>
nmap <Leader>q :q!<cr>
nmap <Leader>fed :tabedit $MYVIMRC<cr>
nmap <Leader><Space> :TagbarToggle<cr>
nmap <Leader>sp :CtrlP<cr>

augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

