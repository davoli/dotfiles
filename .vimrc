"
" File:       .vimrc
" Modified:   2015 Oct 24th

" Inspired by https://github.com/jez/vim-as-an-ide/
" and http://dougblack.io/words/a-good-vimrc.html
"
" Learning Guide: 
" http://benmccormick.org/learning-vim-in-2014/

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'

" Look
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Git 
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Syntastic
Plugin 'scrooloose/syntastic'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

" Go
Plugin 'fatih/vim-go'

" Provides easy shortcuts for commenting out lines
Plugin 'scrooloose/nerdcommenter'

Plugin 'kien/ctrlp.vim'

Plugin 'Shougo/neocomplete.vim'
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
let maplocalleader = '_'

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

if has("mouse")
    set mouse=a
endif

""" Scheme

" set background=dark
" let base16colorspace=256
" set t_Co=256
" let g:airline_theme = 'base16'
" 
" try
"     colorscheme base16-tomorrow
" catch  /^Vim\%((\a\+)\)\=:E185/
"     colorscheme desert
" endtry


""" Omni-Completion
set ofu=syntaxcomplete#Complete
set completeopt=menu

""" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>



""" neocomplete
let g:neocomplete#enable_at_startup = 1

let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

""" NerdTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHijackNetrw = 1
let NERDTreeMinimalUI = 1
nnoremap <silent> t :NERDTree<CR>


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END
