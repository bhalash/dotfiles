setlocal wrap
setlocal expandtab ts=2 sw=2 sts=2

" Disable coc.nvim
let b:coc_suggest_disable = 1

" NOTE(mark 2021-11-17): (needs work) insert citation style link
iab <buffer> fcite [0]:

" Insert activity for end of week report
iab <buffer> a@ **[!Day] (Thing):**  <CR><><Esc>h

" Paste from clipboard into auto-link, e.g. - <https://www.example.com>
iab <buffer> <> - <<C-r>*>
