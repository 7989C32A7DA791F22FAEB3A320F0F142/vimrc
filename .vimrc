set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'scrooloose/nerdtree' 
Plugin 'blueyed/vim-diminactive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hdima/python-syntax'
"Plugin 'neoclide/vim-jsx-improve'
"Plugin 'vim-python/python-syntax'
call vundle#end() 

if has("syntax")
	syntax on
endif

set number
set showmatch
set autoindent 
set smartindent
set title

" 화면 분할
set splitright
set splitbelow

" 기타
set clipboard=unnamed " 시스템 클립보드 사용

" 검색 관련
set hlsearch   " 검색한 결과 강조
set incsearch  " 검색중인 문자열 강조
set ignorecase " 검색시 대소문자 무시
" set nowrapscan " 검색시 현재 커서에서 아래순

filetype plugin indent on
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
au BufNewFile,BufRead *.json set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
au BufNewFile,BufRead *.jsx set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent

set t_Co=256
set nowrap
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

" 커서
set cursorline
hi cursorline ctermbg=233 cterm=none
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
hi Search cterm=NONE ctermfg=black ctermbg=green

"AirLine
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar

autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""

let HlUnderCursor=1
nnoremap <silent> <F4> :exe "let HlUnderCursor=exists(\"HlUnderCursor\")?HlUnderCursor*-1+1:1"<CR>
