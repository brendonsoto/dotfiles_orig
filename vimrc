" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" allow backspacing over everything in insert mode
set autoindent    " allow autoindent by default
set backspace=indent,eol,start
set cursorline 		" highlights current line
set expandtab		  " maintains # of spaces for a tab in insert mode
set hidden			  " don't have to write before opening new buffer
set history=50		" command line history
set hlsearch		  " highlight search terms
set incsearch		  " show matches as you type
set ignorecase		" ignore case when searching
set incsearch		  " do incremental searching
set number			  " display line number
set ruler			    " show the cursor position all the time
set shiftwidth=2	" spaces for auto indent
set showcmd			  " display incomplete commands
set showmatch 		" show matching parenthesis
set smartcase		  " search is case-insensitive when keyword is all lowercase
set tabstop=2		  " set tab to 2 spaces

" no backups
set nobackup
set noswapfile

" Persistent Undo
set undofile					        " Save undo's after file closes
set undodir=$HOME/.vim/undo		" undo file for work
set undolevels=1000				    " How many undos
set undoreload=1000				    " How many lines to save for undo

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

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Find from current directory
set path=$PWD/**

"""""""""""""""""""""
"		Mappings
"""""""""""""""""""""

" MapLeader
let mapleader = "\<Space>"

" set ; to :
map ; :

" Easy open file from vim
map <silent> <F12> :!open %<CR>

" Easy open, close, and save
nnoremap <Leader>e :e 
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>! :q!<CR>

" Easy window Navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Easy copy & paste
map <Leader>y "*y
map <Leader>p "*p

" Move line by line even when the line is wrapped
map j gj
map k gk

" Buffer switching
nnoremap <Tab>    :bn<CR>
nnoremap <S-Tab>  :bp<CR>

" Easy file exploration
map <Leader>x :Ex<CR>

" with CtrlP
nnoremap <Leader>. :CtrlPTag<CR>

" miniBufExplr
nnoremap <Leader>b :MBEOpen<CR>

" NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFocus<CR>

" Tagbar
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" Easy window splitting
map <Leader>s :split<CR>
map <Leader>v :vsplit<CR>
map <Leader>= <C-w>=

" Easy remove highlighting
map <Leader>/ :nohl<CR>

" Easy control Syntastic
map <Leader>o :SyntasticToggleMode<CR>

" Easy copy all
map <Leader>Y ggv<S-g>"*y


"""""""""""""""""""""
"		Tools
"""""""""""""""""""""

" C Plugin
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

" CtrlP
" Ignore certain directories and files
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Emmet
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/extensions/snippets/snippets.json')), "\n"))

" For MacVim
let macvim_skip_colorscheme = 1

" Lightline
set laststatus=2
let g:lightline = {
  \ 'active': {
  \   'right':  [ [ 'lineinfo' ],
  \               [ 'percent' ],
  \               [ 'fileencoding' ] ]
  \ }
  \ }

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" RBENV
let g:ruby_path = system('echo $HOME/.rbenv/shims')

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

