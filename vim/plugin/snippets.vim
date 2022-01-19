" Insert dated, signed FIXME, TODO and NOTE remarks
iab <expr> f@ strftime('FIXME(' . $USER . ' %Y-%m-%d):')
iab <expr> t@ strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> n@ strftime('NOTE(' . $USER . ' %Y-%m-%d):')

" Insert date
iab <expr> dl@ strftime('%Y-%m-%d')
iab <expr> ds@ strftime('%d/%m')

" Block comment
" FIXME(mark 2022-01-17): needs love, does not work too well with other
" completions in place
iab /* /*<CR><CR>*/<Up>
