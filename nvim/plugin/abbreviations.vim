" Insert dated and signed remarks
" iab <expr> t/ strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> f/ strftime('FIXME(mark %Y-%m-%d):')
iab <expr> t/ strftime('TODO(mark %Y-%m-%d):')
iab <expr> i/ strftime('INFO(mark %Y-%m-%d):')

" Insert date in different formats
iab <expr> dl/ strftime('%Y-%m-%d')
iab <expr> ds/ strftime('%d/%m')

" Block comment
" Vim helpfully inserts characters at the start of lines that I have to remote
iab /* /**<CR><CR>*/<Esc>2h2xka

" Open help and man pages in a tab
cab help tab help
cab Man tab Man
