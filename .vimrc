set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'scrooloose/nerdtree' 
Plugin 'blueyed/vim-diminactive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hdima/python-syntax'
call vundle#end() 


if has("syntax")
	syntax on
endif

set number
set hlsearch
set showmatch
set autoindent 
set smartindent
set title
set splitright
set splitbelow

filetype plugin indent on
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
au BufNewFile,BufRead *.json set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent

set t_Co=256

set nowrap
set encoding=utf-8
set termencoding=utf-8

set cursorline
hi cursorline ctermbg=234 cterm=none
hi cursorlinenr cterm=none

" Last Edit Space Move
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" Run Python
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>

let g:diminactive_enable_focus = 1

" sudo wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim -O/usr/share/vim/vim81/colors/jellybeans.vim
color jellybeans

" need install (plugin)
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let python_highlight_all = 1
let NERDTreeShowHidden = 1

map <Leader>nt <ESC>:NERDTree<CR>
let NERDTreeShowHidden=1
