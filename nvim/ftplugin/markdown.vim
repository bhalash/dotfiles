setlocal wrap
setlocal expandtab ts=4 sw=4 sts=4

" Paste from clipboard into auto-link, e.g. - <https://www.example.com>
iab <buffer> -/ - <<Esc>"+pA>
iab <buffer> ++ <Esc>"+pA

iab <buffer> <expr> m/ strftime($USER . ' %Y-%m-%d:')
iab <buffer> <expr> d/ strftime('%Y-%m-%d')

" Insert code block
iab code/ ``````<ESC>2hi
