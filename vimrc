"don't bother with vi comatiblity
set nocompatible
" enable syntax highlighting
syntax enable

" configure Vundle
filetype on " without this vim emits a zero exit status,later,because of :ft off

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

call vundle#end()

" ensure ftdetect et al work by including this after the Vundle staff
filetype plugin indent on

set autoindent
"reload files when changed on disk, i.e. via 'git checkout'
set autoread

" Fix broken backspace in some setups
set backspace=2

"see :help crontab
set backupcopy=yes

" yank and paste with the system clipboard
set clipboard=unnamed

" don't store swapfiles in the current directory
set directory-=.

" expand tabs to spaces
set encoding=utf-8
set expandtab

" case-insensitive search
set ignorecase

" search as you type
set incsearch

"always show statusline
set laststatus=2

"show trailing whitespace
set list
set listchars=tab:▸\ ,trail:▫

"show line numbers
set number

"show where you are
set ruler

"show context above/below cursorline
set scrolloff=3

" normal mode indentation commands use 2 spaces
set shiftwidth=2

" case-sensitive search if any caps
set showcmd
set smartcase

"insert mode tab and backspace use 2 spaces
set softtabstop=2

" actual tabs occupy 8 characters
set tabstop=8

"show a navigable menu for tab completion
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers
set mouse=a
if exists("$TMUX") "Support resizing in tmux
  set ttymouse=zsh
endif

" keyboard shorcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToogle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin Setting
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled=0

" Use the silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lighting fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" Fix Cursor in tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't coppy the contents of an overwritten selection
vnoremap p "_dP

"Go crazy!
if filereadable(expand("~/.vimrc.local"))
  "In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowitebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepot .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
