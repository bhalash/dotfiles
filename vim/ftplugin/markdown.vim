" Disable trailing whitespace check in Markdown files.
autocmd FileType * unlet! g:airline#extensions#whitespace#checks
autocmd FileType markdown let g:airline#extensions#whitespace#checks = [ 'indent' ]
autocmd FileType markdown let g:airline#extensions#whitespace#show_message = 0

" Disable coc.nvim
autocmd FileType markdown let b:coc_suggest_disable = 1

setlocal wrap
setlocal expandtab ts=2 sw=2 sts=2

" NOTE(mark 2021-11-17): (needs work) insert citation style link
" autocmd FileType markdown :iab <buffer> fcite [0]:
