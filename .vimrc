set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'scrooloose/nerdtree' 
Plugin 'blueyed/vim-diminactive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'AutoClose'
call vundle#end() 

set t_Co=256

syntax on
syntax enable
colorscheme jellybeans

set number
set hlsearch
set autoindent 
set smartindent
set title
set splitright
set splitbelow

filetype plugin indent on
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
au BufNewFile,BufRead *.js set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
au BufNewFile,BufRead *.json set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent

" Line
set nowrap

set encoding=utf-8
set termencoding=utf-8

" Cursor Line, Column Highlighting
set cursorline 
set cursorcolumn

" Last Edit Space Move
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"Python Run 
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>

"NerdTree
map <Leader>nt <ESC>:NERDTree<CR>
let NERDTreeShowHidden=1

"Mouse Mode 
map <F1> <ESC>:set mouse=a<CR>
imap <F1> <ESC>:set mouse=a<CR>i 
map <F2> <ESC>:set mouse-=a<CR>
imap <F2> <ESC>:set mouse-=a<CR>i

map <F3> <ESC>:set cursorline! cursorcolumn!<CR>
imap <F3> <ESC>:set cursorline! cursorcolumn!<CR>i

map <F4> <ESC>:set cursorline cursorcolumn<CR>
imap <F4> <ESC>:set cursorline cursorcolumn<CR>i

" Plugin Set "

"IndentGuideLine
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"Dim
let g:diminactive_enable_focus = 1

"AirLine
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
