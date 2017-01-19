" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vim-Plug - Manage Plugins
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json', { 'for': ['json', 'javascript'] }
Plug 'fholgado/minibufexpl.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim' " Emmet depends on this
Plug 'mileszs/ack.vim', { 'on' : 'Ack' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'typescript'] }
Plug 'PProvost/vim-markdown-jekyll', { 'for': ['markdown', 'yaml'] }
Plug 'raimondi/delimitmate'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tmhedberg/matchit', { 'for': ['html', 'php'] }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy', { 'for': ['json', 'javascript'] }
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'WolfgangMehner/c-support', { 'for': ['c', 'c++'] }

call plug#end()

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

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Find from current directory
set path=$PWD/**

"""""""""""""""""""""
"		Mappings
"""""""""""""""""""""

" MapLeader
let mapleader = "\<Space>"

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
map <Leader>Y ggv<S-g>$"*y

" Move line by line even when the line is wrapped
map j gj
map k gk

" Buffer switching
nnoremap <Tab>    :bn<CR>
nnoremap <S-Tab>  :bp<CR>

" miniBufExplr
nnoremap <Leader>b :MBEOpen<CR>

" NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFocus<CR>

" Easy window splitting
map <Leader>s :split<CR>
map <Leader>v :vsplit<CR>
map <Leader>= <C-w>=

" Easy remove highlighting
map <Leader>/ :nohl<CR>

" Ack
nnoremap <Leader>a :Ack!<Space>

" Easy control Syntastic
map <Leader>o :SyntasticToggleMode<CR>


"""""""""""""""""""""
"		Tools
"""""""""""""""""""""

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CtrlP
" Ignore certain directories and files
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|\v[\/](\.(git|hg|svn)|\_site)$',
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
  \               [ 'fileencoding' ] ],
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightLineFugitive',
  \   'readonly': 'LightLineReadonly',
  \   'modified': 'LightLineModified'
  \ }
  \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

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

let g:syntastic_html_tidy_ignore_errors = [
  \ '<input> proprietary attribute "role"',
  \ '<link> proprietary attribute "crossorigin"',
  \ '<link> proprietary attribute "integrity"',
  \ '<script> proprietary attribute "crossorigin"',
  \ '<script> proprietary attribute "integrity"',
  \ 'trimming empty <span>'
  \ ]

" VimWiki
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink
