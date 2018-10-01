"Start Loading  Plugins
call plug#begin()

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'  " linter

Plug 'Valloric/YouCompleteMe'

"    typescript
Plug 'HerringtonDarkholme/yats.vim'

" javascript
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }


Plug 'Valloric/MatchTagAlways'     "show matching html tags
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'matze/vim-move'

Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'

Plug 'markonm/traces.vim'  " inccomand type stuff for regular vim (live search and replace preview)

" Colors
Plug 'robertmeta/nofrils'
Plug 'kristiandupont/shades-of-teal'
Plug 'pbrisbin/vim-colors-off'
Plug 'andreypopp/vim-colors-plain'
Plug 'fenetikm/falcon'
Plug 'kamwitsta/flatwhite-vim'
Plug 'romainl/flattened'


Plug 'mileszs/ack.vim'

Plug 'tpope/vim-fugitive'


Plug 'justinmk/vim-sneak'
Plug 'sjl/gundo.vim'


call plug#end()
"-----------------------ABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting


filetype plugin indent on
filetype plugin on
syntax on

set nowrap

set visualbell    "stops error bell
set noswapfile
set nobackup
set hidden
set ruler



set wildmenu
set lazyredraw

"show commands
set showcmd


set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildignore+=**/dump/**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


"backspace stuff
set backspace=indent,eol,start

" reload files changed outside vim
set autoread

" encoding is utf 8
set encoding=utf-8

" set case insensitive
set ignorecase

"---------------INDENTATION-----------------------------------------
set expandtab       " use spaces instead of tabs set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces




"----------------------------------------------VIEW UI------------------------

set guifont=Iosevka:h16

colorscheme plain

set termguicolors

set number
set cursorline


"------------------------------ MAPPINGS---------------------
let mapleader=" "

tnoremap <Esc> <C-\><C-n>

inoremap <leader>;  <Esc>A;<CR>
nnoremap <leader>; A;<esc>

inoremap <leader><CR> <Esc>o

"remap jk to Esc
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>


"map NERDTree toggle to Ctrl-n and Alt-n to find current file
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFind<CR>

"move between split screens quicker
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

"jump to beginning/end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

"remap f for Sneak
"nmap f <Plug>Sneak_s
"nmap F <Plug>Sneak_S
"xmap f <Plug>Sneak_s
"xmap F <Plug>Sneak_S
"omap f <Plug>Sneak_s
"omap F <Plug>Sneak_S

nnoremap <Leader>w :w!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>


nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p

vmap ∆ <Plug>MoveBlockDown
vmap ˚ <Plug>MoveBlockUp
nmap ∆ <Plug>MoveLineDown
nmap ˚ <Plug>MoveLineUp


map <C-p> :FZF<CR>

" for vim-commentary
nmap <Leader>c gc
vmap <Leader>c gc

" quick edit .vimrc
nmap <Leader>vi :e $MYVIMRC<CR>


"--------------------------STATUS LINE------------------------------
set statusline=%{fugitive#head()}\ \%<%f\ %h%m%r%=%-1.(%l,%c%V%)\ %y


"----------------------------Delimiteate------------------------------
let delimitMate_expand_cr=2    "set enter to expand function a la sublime

"----------------------------ALE--------------------------
let g:ale_linters = {
      \    'javascript': ['eslint']
      \}
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error=' •'
"this may fix the kj bug when working with ale and youcopmleteme
let g:ale_lint_delay=500
