set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'right':  [ [ 'lineinfo' ],
      \               [ 'percent' ] ],
      \   'left': [ [ 'mode', 'paste', 'relativepath' ],
      \             [ 'fugitive', 'readonly', 'modified' ] ]
      \ },
      \ 'colorscheme': 'one',
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
