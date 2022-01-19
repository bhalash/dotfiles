" junegunn/goyo.vim
let g:goyo_width = 120
let g:goyo_height = '80%'
let g:goyo_linenr = 1

function! s:goyo_enter()
  set norelativenumber
endfunction

function! s:goyo_leave()
  set relativenumber
endfunction
