"
" File:       .vimrc
" Modified:   2015 Oct 24th

" Inspired by https://github.com/jez/vim-as-an-ide/
" and http://dougblack.io/words/a-good-vimrc.html
"
" Learning Guide: 
" http://benmccormick.org/learning-vim-in-2014/


" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Look
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
" Plugin 'vir-airline/vim-airline'

" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Fugitive (Git Binding)
Plugin 'tpope/vim-fugitive'

" Syntastic
Plugin 'scrooloose/syntastic'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

" Provides easy shortcuts for commenting out lines
Plugin 'scrooloose/nerdcommenter'

" Great helpful autocompletion
" Plugin 'Valloric/YouCompleteMe' 

call vundle#end()

filetype plugin indent on

" General Settings
" ========================
set backspace=indent,eol,start
set ruler
set number              " Show line numbers
set showcmd             " Show command in bottom bar
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches
set wildmenu            " Visual autocomplete for command menu
set showmatch           " Highlith matchin [{()}]
" set cursorline        " Highlight current line (Not enabled)

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

syntax on 

set mouse=a

" Color Scheme
" ============
" set background=dark
" colorscheme solarized
" colorscheme badwolf


" ----- bling/vim-airline settings -----
" Always show statusbar
" ======================
set laststatus=2


" Indetation and Display
" =======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4       " Number of spaces in tab when editing
set tabstop=4           " Number of visual spaces per TAB
set expandtab           " Tabs are spaces
set foldenable          " Enable folding
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " Fold based on indent level

" nnoremap <space> za   " Remap space to opens/closes folds

" Movements
" =========

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Leader Shortcuts
let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Backups
" =======

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END
