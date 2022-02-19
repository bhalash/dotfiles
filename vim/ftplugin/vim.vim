setlocal foldmethod=marker
setlocal foldlevelstart=99

" Source buffer on write, great for messing around
command! VimDev autocmd BufWritePost <buffer> redraw! | :source % | echo 'sourced ' . fnamemodify(expand('%'), ':t')
