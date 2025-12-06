autocmd BufNewFile,BufRead *.mdx setfiletype markdown

" MDX comments are either /* */ or //
setlocal comments=s1:/*,mb:*,ex:*/,://,:///
