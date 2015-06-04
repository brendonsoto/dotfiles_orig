" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching
set number			" display line number
set tabstop=4		" set tab to 4 spaces
set shiftwidth=4	" spaces for auto indent
set expandtab		" maintains # of spaces for a tab in insert mode
set showmatch 		" show matching parenthesis
set ignorecase		" ignore case when searching
set smartcase		" search is case-insensitive when keyword is all lowercase
set hlsearch		" highlight search terms
set incsearch		" show matches as you type
set cursorline 		" highlights current line
set hidden			" don't have to write before opening new buffer

" no backups
set nobackup
set noswapfile

" Persistent Undo
set undofile					" Save undo's after file closes
set undodir=$HOME/.vim/undo		" undo file for work
set undolevels=1000				" How many undos
set undoreload=1000				" How many lines to save for undo

" Enable file detection and load any plugins for them
filetype plugin indent on

" enable mouse for scrolling
if has("mouse")
	set mouse=a
endif

" Colorscheme
syntax enable
set background=dark
colorscheme solarized

" Explorer Mode settings
let g:netrw_liststyle=3


"""""""""""""""""""""
"		Mappings
"""""""""""""""""""""

" MapLeader
let mapleader = "\<Space>"

" Easy open file from vim
map <silent> <F12> :!open %<CR>

" Easy open
nnoremap <Leader>o :o 

" Easy window Navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Easy save & quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Easy copy & paste
nnoremap <Leader>y "*Y
nnoremap <Leader>p "*p

" Move line by line even when the line is wrapped
map j gj
map k gk

noremap gn		:bn<CR>
noremap gp		:bp<CR>


"""""""""""""""""""""
"		Tools
"""""""""""""""""""""

" For C Plugin
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

" For MacVim
let macvim_skip_colorscheme = 1

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Lightline
set laststatus=2

