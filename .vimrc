set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call  pathogen#infect()
call pathogen#helptags()
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'dgryski/vim-godef'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mileszs/ack.vim'
" Keep Plugin commands between vundle#begin/end.
" The following are examples of different formats supported.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
autocmd vimenter * if !argc() | NERDTree | endif           " 如果只有目录树侧栏则关闭vim
map <Leader>n <plug>NERDTreeTabsToggle<CR>                 " \n开启目录树标签侧栏
"Set mapleader
let mapleader=","
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" pretty colors and looks
" try my preferred colorscheme first (xoria256),
" if that fails, then use a default colorscheme that *should* be present

" pretty colors and looks
" try my preferred colorscheme first (xoria256),
" if that fails, then use a default colorscheme that *should* be present
if &t_Co == 256 || has("gui_running")
    colorscheme xoria256
else
    colorscheme delek
endif
" default encoding
set encoding=utf-8
set fileencoding=utf-8

" searching, incsearch is amazing
set incsearch
" hlsearch is useful, but the highlighting staying around is annoying, so
" that's what the next mapping is for :D
" useful for searching
set ignorecase
set smartcase
set infercase

" indentation
set autoindent
set smartindent
set shiftround
autocmd FileType ruby set shiftwidth=2 softtabstop=2 expandtab
" don't redraw during macros
set lazyredraw

" keep context
set scrolloff=5
 
" number the lines
if exists('+relativenumber')
    set relativenumber
else
    set number
endif
set numberwidth=5

set cursorline
" only have cursorline in the current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" command stuff
set showcmd
set wildmenu
set wildmode=longest:full
set wildignore=*.o,*.obj,*.bak,*.class,*.pyc,*.swp,.git,.hg,_bin

" persistent undo
if exists("+undofile")
    set undodir=~/.vim/undodir
    set undofile
endif


" resize windows
map <C-w><C-h> <C-w>10<
map <C-w><C-l> <C-w>10>
map <C-w><C-k> <C-w>5-
map <C-w><C-j> <C-w>5+

" jump around windows slightly easier
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" copy to mac
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>
vnoremap <leader>y y:call system('nc localhost 8377', @0)<CR>

" lookup in nerdtree
nmap <leader>l :NERDTreeFind<CR>

" Use goimports
let g:go_fmt_command = "goimports"

" set fold
nnoremap <space> za
set foldmethod=syntax

" set paste
nmap <leader>p :set paste<CR>
nmap <leader>n :set nopaste<CR>

