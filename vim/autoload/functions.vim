function! functions#YankSnippet()
  redir @n | silent! :'<,'>number | redir END
  let filename=expand("%")
  let decoration=repeat('-', len(filename)+1)
  let @*=decoration . "\n" . filename . ':' . "\n" . decoration . "\n" . @n
endfunction
