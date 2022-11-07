setlocal wrap
setlocal expandtab ts=4 sw=4 sts=4

" Disable coc.nvim
let b:coc_suggest_disable = 1

" Paste from clipboard into auto-link, e.g. - <https://www.example.com>
iab <buffer> -/ - <<Esc>"+pA>
iab <buffer> ++ <Esc>"+pA

iab <buffer> <expr> m/ strftime('*' . $USER . ' %Y-%m-%d:*')
