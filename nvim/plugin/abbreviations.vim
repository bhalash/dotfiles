" Insert dated and signed remarks
iab <expr> f/ strftime('FIXME(' . $USER . ' %Y-%m-%d):')
iab <expr> t/ strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> i/ strftime('INFO(' . $USER . ' %Y-%m-%d):')

iab  ff/ fixme:
iab  ii/ info:
iab  tt/ todo:

" Username
iab <expr> u/ $USER

" Insert date
iab <expr> dl/ strftime('%Y-%m-%d')

" Block comment
" Vim helpfully inserts characters at the start of lines that I have to remove
iab /* /**<CR><CR>*/<Esc>2h2xka
