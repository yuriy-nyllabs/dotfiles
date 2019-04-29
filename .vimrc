"Start Loading  Plugins

if has('nvim') 
  call plug#begin('~/.local/share/nvim/plugged') 
else
    call plug#begin()
endif

" fuzzy finder
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'  " linter
" Plug 'Valloric/YouCompleteMe'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'christoomey/vim-tmux-navigator'

"    typescript
Plug 'HerringtonDarkholme/yats.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


Plug 'Valloric/MatchTagAlways'     "show matching html tags
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'matze/vim-move'

Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'

Plug 'markonm/traces.vim'  " inccomand type stuff for regular vim (live search and replace preview)

Plug 'mileszs/ack.vim'

Plug 'tpope/vim-fugitive'


Plug 'justinmk/vim-sneak'
Plug 'sjl/gundo.vim'

Plug 'jnurmine/Zenburn'
Plug 'aonemd/kuroi.vim'
Plug 'rafi/awesome-vim-colorschemes'


call plug#end()

"-----------------------ABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting


filetype plugin indent on
filetype plugin on
syntax on
set nowrap
set mouse=a

"stops error bell
set visualbell
set t_vb=

set noswapfile
set nobackup
set hidden
set ruler



set wildmenu
set lazyredraw

"show commands
set showcmd

" Better display for messages
" set cmdheight=2


set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildignore+=**/dump/**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


"backspace stuff
set backspace=indent,eol,start

" reload files changed outside vim
set autoread

" always show signcolumns
set signcolumn=yes

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

" set guifont=Iosevka:h16

" True colour
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

colorscheme zenburn

set number
set cursorline
set smartcase
set hlsearch
"set wildmode=longest:list,full


"------------------------------ MAPPINGS---------------------
let mapleader=" "


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

""move between split screens quicker
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


" for vim-commentary
nmap <Leader>c gc
vmap <Leader>c gc

" quick edit .vimrc
nmap <Leader>vi :e $MYVIMRC<CR>

" terminal
tmap <Esc> <C-\><C-n>
if has("gui_running")
    nmap <C-z> :term<CR>
endif
if has("gui_vimr")
    nmap <C-z> :term<CR>
endif



"-----------------------------YOUCOMPLETEME------------------------------
" set completeopt-=preview


" ----------------------------COC-----------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"-----------------------------CUSTOM COMMANDS------------------------------
command PrettierReact %! prettier --single-quote --tab-width 2 --jsx-bracket-same-line true

"--------------------------STATUS LINE------------------------------
set laststatus=2
set statusline=%{fugitive#head()}\ \%<%f\ %h%m%r%=%-1.(%l,%c%V%)\ %y



"----------------------------Delimiteate------------------------------
let delimitMate_expand_cr=2    "set enter to expand function a la sublime

"----------------------------ALE--------------------------
let g:ale_linters = {
      \    'javascript': ['eslint']
      \}
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error='++'
let g:ale_sign_warning='--'


