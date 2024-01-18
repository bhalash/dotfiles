" TODO(mark 2024-01-18): Port to lua
function! functions#YankSnippet() abort
  redir @n | silent! :'<,'>number | redir END
  let filename=expand("%")
  let decoration=repeat('-', len(filename)+1)
  let @*=decoration . "\n" . filename . ':' . "\n" . decoration . "\n" . @n
endfunction
