filetype plugin indent on " Enable file detection and load any plugins for them

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Jump to last known position in a file after opening
:au BufReadPost *
 \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
 \ |   exe "normal! g`\""
 \ | endif

" Highlight TODO, FIXME, NOTE
" autocmd Syntax * call matchadd('todo', '\W\zs\(TODO\|FIXME\|XXX\)')
" autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\)')

" Sync syntax highlighting
" kudos https://vim.fandom.com/wiki/Fix_syntax_highlighting
autocmd BufEnter * :syntax sync fromstart

" TODO: Move these to their own files?
" Set .Xmonad-related files to use Haskell syntax highlighting
autocmd BufRead,BufNewFile .xmobarrc set filetype=haskell

" Set JSON-like files to use json syntax highlighting
autocmd BufRead,BufNewFile *.json,.eslintrc,.babelrc set filetype=json

" Fugitive - auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
