" Insert dated and signed remarks
" TODO(mark 2022-02-19): keep an eye in case these break shit
iab <expr> fm. strftime('FIXME(' . $USER . ' %Y-%m-%d):')
iab <expr> td. strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> in. strftime('INFO(' . $USER . ' %Y-%m-%d):')
iab <expr> no. strftime('NOTE(' . $USER . ' %Y-%m-%d):')

" Insert date in different formats
iab <expr> dl. strftime('%Y-%m-%d')
iab <expr> ds. strftime('%d/%m')

" Block comment
" Vim helpfully inserts characters at the start of lines that I have to remote
iab /* /**<CR><CR>*/<Esc>2h2xka

" Open help and man pages in a tab
cab help tab help
cab Man tab Man
