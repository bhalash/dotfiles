" Strip trailing whitespace before save
autocmd BufWritePre,FileWritePre * :%s/\s\+$//e
