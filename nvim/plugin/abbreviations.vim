" Insert dated and signed remarks
iab <expr> f/ strftime('FIXME(' . $USER . ' %Y-%m-%d):')
iab <expr> t/ strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> i/ strftime('INFO(' . $USER . ' %Y-%m-%d):')

" Insert date
iab <expr> dl/ strftime('%Y-%m-%d')

" Block comment
" Vim helpfully inserts characters at the start of lines that I have to remove
iab /* /**<CR><CR>*/<Esc>2h2xka

" Open help and man pages in a tab
cab help tab help
cab Man tab Man

" Strip trailing whitespace before save
" TODO(mgrealis 2025-11-20): Migrate to Lua.
" See: https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/autocmds.lua
autocmd BufWritePre,FileWritePre *.html :%s/\s\+$//e
autocmd BufWritePre,FileWritePre *.js :%s/\s\+$//e
autocmd BufWritePre,FileWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre,FileWritePre *.ts :%s/\s\+$//e
