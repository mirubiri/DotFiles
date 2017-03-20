
"-- Plugins --
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'felikz/ctrlp-py-matcher'
Plug 'sjl/badwolf' "color scheme
Plug 'sjl/gundo.vim' "show undo tree
Plug 'majutsushi/tagbar' "show tag bar
Plug 'easymotion/vim-easymotion' "move to anywhere
Plug 'airblade/vim-gitgutter' "show file changes through git
Plug 'scrooloose/nerdtree' "show folder tree
Plug 'mileszs/ack.vim'
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

"-- TagBar Plugin
let g:tagbar_autofocus=1
let g:tagbar_compact=1
"

"-- Colors --
syntax enable "Enable syntax highlighting
colorscheme badwolf "Good looking color scheme
"--
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif


" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
"if executable("ag")
"   set grepprg=ag\ --nogroup\ --nocolor
   "let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'

	 "endif


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
let mapleader = "," 
nmap <leader>u :GundoToggle<CR>
nmap <leader>s :mksession<CR> "save session
nmap <Leader>t :NERDTreeToggle<cr>
nmap <Leader>w :w<cr>
nmap <Leader>wq :wq<cr>
nmap <Leader>q :q!<cr>
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><Space> :TagbarToggle<cr>

augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

