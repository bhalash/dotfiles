" Insert dated, signed FIXME, TODO and NOTE remarks
iab <expr> f@ strftime('FIXME(' . $USER . ' %Y-%m-%d):')
iab <expr> t@ strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> n@ strftime('NOTE(' . $USER . ' %Y-%m-%d):')

" Paste from clipboard, best for flow when typing
iab ~~ <C-r>*

" Block comment
iab /* /**<CR><CR>/<Up>
