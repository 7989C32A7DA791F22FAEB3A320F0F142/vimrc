if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' 
Plug 'blueyed/vim-diminactive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hdima/python-syntax'
call plug#end()

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
" set clipboard=unnamed " 시스템 클립보드 사용

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
au BufNewFile,BufRead Jenkinsfile set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
au BufNewFile,BufRead Jenkinsfile setf groovy

set t_Co=256
set nowrap
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

" 커서
set cursorline
"set cursorcolumn
hi cursorline ctermbg=233 cterm=none
hi cursorcolumn ctermbg=233 cterm=none
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

" 설치 관련 ( jellybeans )
"need install (colorscheme)
"mkdir -p ~/.vim/colors
"cd ~/.vim/colors
"curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

" 기타 VIMRC 설정 관련 글
" https://hongsii.github.io/2018/01/29/vim_configuration/
" https://hcnam.tistory.com/14


" 동일 단어 하이라이팅
" https://stackoverflow.com/a/25887606
autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""

let HlUnderCursor=1
nnoremap <silent> <F4> :exe "let HlUnderCursor=exists(\"HlUnderCursor\")?HlUnderCursor*-1+1:1"<CR>
