" TODO(mark 2023-12-10): Do I want this?
function! s:ClearSession() abort
  silent tabonly
  silent bufdo bd
  silent only
endfunction

command! Clear call s:ClearSession()

nnoremap <silent><leader>i <Plug>(clear-session) call <SID>ClearSession()<CR>
