set termguicolors

function! s:ayu_patch()
  hi clear LineNr
  hi clear SignColumn
  hi GitGutterAdd           cterm=none  ctermbg=none  ctermfg=46   gui=none  guifg=#00ff00 guibg=none
  hi GitGutterChange        cterm=none  ctermbg=none  ctermfg=45   gui=none  guifg=#00d7ff guibg=none
  hi GitGutterChangeDelete  cterm=none  ctermbg=none  ctermfg=11   gui=none  guifg=#ffff00 guibg=none
  hi GitGutterDelete        cterm=none  ctermbg=none  ctermfg=196  gui=none  guifg=#ff0000 guibg=none

  hi clear StatusLineNC
  hi clear TabLine
  hi clear TabLineFill

  hi CocUnusedHighlight guifg=#ea1730 gui=underline
  hi ColorColumn guibg=#30373d
  hi Comment guifg=#62595a
  hi LineNr guifg=#5c636b
  hi Search gui=underline guibg=none guifg=#c3ce2d

  hi StatusLine guifg=#ffffff guibg=none
  hi StatusLineNC guifg=#606060

  hi TabLineSel cterm=reverse ctermfg=15 ctermbg=242 gui=reverse guifg=#e6e1cf guibg=#14191f

  let ayucolor='dark'
  hi MatchParen gui=underline guifg=#ff9800 guibg=none
  hi NonText guibg=#26292c
  hi CursorLine guibg=#303030
endfunction

function! s:terafox_patch()
  hi CocUnusedHighlight guifg=#ea1730 gui=underline
endfunction

autocmd! ColorScheme ayu call s:ayu_patch()
autocmd! ColorScheme terafox call s:terafox_patch()

colo terafox
" colo ayu
" colo sonokai
