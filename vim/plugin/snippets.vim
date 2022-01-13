" Insert dated, signed FIXME, TODO and NOTE remarks
iab <expr> f@ strftime('FIXME(' . $USER . ' %Y-%m-%d):')
iab <expr> t@ strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> n@ strftime('NOTE(' . $USER . ' %Y-%m-%d):')

" Block comment
iab /* /**<CR><CR>/<Up>
