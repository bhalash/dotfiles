""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: Gitgutter. I like this style for all themes.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:gitgutter_patch()
  hi clear LineNr
  hi clear SignColumn
  hi GitGutterAdd           cterm=none    ctermbg=none    ctermfg=46      gui=none      guifg=#00ff00
  hi GitGutterChange        cterm=none    ctermbg=none    ctermfg=45      gui=none      guifg=#00d7ff
  hi GitGutterChangeDelete  cterm=none    ctermbg=none    ctermfg=11      gui=none      guifg=#ffff00
  hi GitGutterDelete        cterm=none    ctermbg=none    ctermfg=196     gui=none      guifg=#ff0000
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: Colorsbox Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:colorsbox_patch()
  call s:gitgutter_patch()
  hi SpellBad gui=underline,bold guifg=#ff6a6a
  hi TabLineFill guifg=#ffffff guibg=#1d1f21 gui=underline
  hi TabLineSel guifg=#1d1f21 guibg=#ffffff
  let g:airline_theme = 'colorsbox'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: Hybrid Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:hybrid_patch()
  call s:gitgutter_patch()
  let g:airline_theme = 'hybrid'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: Ayu Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:ayu_patch()
  hi ColorColumn guibg=#30373d
  hi Comment guifg=#8293a5
  hi LineNr guifg=#5c636b
  let g:lightline = { 'colorscheme': 'ayu' }
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: 256 Noir Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:noir_patch()
  call s:gitgutter_patch()
  let g:airline_theme = 'github'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Preferred Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup themes
  autocmd! ColorScheme 256_noir call s:noir_patch()
  autocmd! ColorScheme colorsbox-stnight call s:colorsbox_patch()
  autocmd! ColorScheme hybrid-material call s:gitgutter_patch()
  autocmd! ColorScheme ayu call s:ayu_patch()
  colorscheme colorsbox-stnight
augroup END
