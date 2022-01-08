set termguicolors background=dark

" GitGutter Patch {{{

function! s:gitgutter_patch()
  hi clear LineNr
  hi clear SignColumn
  hi GitGutterAdd           cterm=none  ctermbg=none  ctermfg=46   gui=none  guifg=#00ff00 guibg=none
  hi GitGutterChange        cterm=none  ctermbg=none  ctermfg=45   gui=none  guifg=#00d7ff guibg=none
  hi GitGutterChangeDelete  cterm=none  ctermbg=none  ctermfg=11   gui=none  guifg=#ffff00 guibg=none
  hi GitGutterDelete        cterm=none  ctermbg=none  ctermfg=196  gui=none  guifg=#ff0000 guibg=none
endfunction

" }}}

" Patch: ayu {{{

function! s:ayu_patch()
  call s:gitgutter_patch()

  hi CocUnusedHighlight guifg=#ea1730 gui=underline
  hi ColorColumn guibg=#30373d
  hi Comment guifg=#62595a
  hi LineNr guifg=#5c636b
  hi Search gui=underline guibg=none guifg=#c3ce2d
  hi TabLineSel cterm=reverse ctermfg=15 ctermbg=242 gui=reverse guifg=#E6E1CF guibg=#14191F
  hi clear StatusLineNC
  hi clear TabLine
  hi clear TabLineFill

  let ayucolor='dark'
endfunction

autocmd! ColorScheme ayu call s:ayu_patch()

" }}}

" Patch: flatlandia {{{

function! s:flatlandia_patch()
  " hi StatusLineNC guibg=#4c4c4c
  " hi VertSplit guibg=#4c4c4c
  call s:gitgutter_patch()
  hi LineNr guifg=#5c636b
  hi NonText guibg=none
  hi StatusLine guibg=none guifg=Black guibg=#a5a5a5
endfunction

autocmd! ColorScheme flatlandia call s:flatlandia_patch()

" }}}

" colorscheme tender
colorscheme ayu
