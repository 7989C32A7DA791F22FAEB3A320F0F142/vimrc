if empty(glob('~/.vim/colors/jellybeans.vim'))
silent !curl -fLo ~/.vim/colors/jellybeans.vim --create-dirs
    \ https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
source $MYVIMRC
endif

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'blueyed/vim-diminactive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'hdima/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'airblade/vim-gitgutter'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:jellybeans_overrides = {
\    'background':  {'guibg':'000000'},
\    'Todo':        {'guibg':'000000', 'guifg':'33FF33', 'ctermbg':'000000', 'ctermfg':'33FF33'},
\    'Search':      {'guibg':'FFFF00', 'guifg':'000000', 'attr':'underline'},
\    'ColorColumn': {'guibg':'1c1c1c', 'guifg':'none'  , 'ctermbg':'1c1c1c', 'ctermfg':'none'},
\}
color jellybeans

set backspace=indent,eol,start
set number
set title
set showmatch
set autoindent
set smarttab
set expandtab
set smartindent
set splitright
set splitbelow
set clipboard=unnamed
set nowrap
set hlsearch
set incsearch
set ignorecase
set t_Co=256
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set laststatus=2
"set nowrapscan

filetype plugin indent on
au BufNewFile,BufRead *.py        set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.json      set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js        set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html      set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.jsx       set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead Jenkinsfile set tabstop=4 softtabstop=4 shiftwidth=4 | setf groovy

" (Default) Cursor
"set cursorcolumn
"hi cursorcolumn ctermbg=253 cterm=none
set cursorline
hi cursorline ctermbg=233 cterm=none

" (Custom remap) Run Python
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>

" (Custom) Last Edit Space Move
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" (Custom) Current word highlight
let HlUnderCursor=1
autocmd CursorMoved * exe exists("HlUnderCursor") ? HlUnderCursor ? printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""
nnoremap <silent> <F4> :exe "let HlUnderCursor=exists(\"HlUnderCursor\")?HlUnderCursor*-1+1:1"<CR>

" (Command) Remove Whitespace
command! WhiteSpace %s/\s\+$//e

" (Plugin) blueyed/vim-diminactive
let g:diminactive_enable_focus = 1

" (Plugin) nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let python_highlight_all = 1

" (Plugin) scrooloose/nerdtree
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen=1
map <C-n> :NERDTreeToggle<CR>

" (Plugin) vim-airline
let g:airline_theme='hybrid'
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1

" (Plugin) vim-airline-themes
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" (Plugin) maxmellon/vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" (Plugin) maxmellon/vim-jsx-pretty
let g:syntastic_python_checkers=['flake8']
let g:flake8_show_in_file=1
let g:flake8_max_markers=500
nnoremap <C-K> :call flake8#Flake8ShowError()<cr>
"autocmd BufWritePost *.py call flake8#Flake8()

" Debug
"nnoremap <C-Z> :w<cr>:source ~/.vimrc<cr>
":set filetype=messages
