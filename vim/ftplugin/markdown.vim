setlocal wrap
setlocal expandtab ts=4 sw=4 sts=4

" Disable coc.nvim
let b:coc_suggest_disable = 1

" NOTE(mark 2021-11-17): (needs work) insert citation style link
iab <buffer> fcite [0]:

" Insert activity for end of week report
iab <buffer> a@ **[!Day] (Thing):**  <CR><><Esc>h

" Paste from clipboard into auto-link, e.g. - <https://www.example.com>
iab <buffer> <> <<Esc>"+pA>
