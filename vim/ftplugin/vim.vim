setlocal foldmethod=marker
setlocal foldlevelstart=99

" Source buffer on write, great for messing around
command! VimDev autocmd BufWritePost <buffer> redraw! | :source % | echo 'sourced ' . fnamemodify(expand('%'), ':t')

" Make it easier to install stuff
nnoremap <buffer><silent><leader>% :source %<CR>
nnoremap <buffer><silent><leader>oi :PlugInstall<CR>
nnoremap <buffer><silent><leader>ou :PlugUpdate<CR>
nnoremap <buffer><silent><leader>oc :PlugClean!<CR>
