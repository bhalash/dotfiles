" vim-jrnl sets textwrap=88
setlocal colorcolumn=88

" vim-jrnl sets weird colorcolumn for no good reason
hi ColorColumn ctermbg=1 guibg=#30373d guifg=#ffffff

" vim-jrnl sets folds based on markdown heading; this is annoying to undo
setlocal nofoldenable

" vim-jrnl turns on spell-checking, which I find distracting
setlocal nospell
