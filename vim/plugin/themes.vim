""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Force cursor to be a line in insert mode.
" See: https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: Gitgutter. I like this style for all themes.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:gitgutter_reset()
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
  call s:gitgutter_reset()
  hi SpellBad gui=underline,bold guifg=#ff6a6a
  hi TabLineFill guifg=#ffffff guibg=#1d1f21 gui=underline
  hi TabLineSel guifg=#1d1f21 guibg=#ffffff
  let g:airline_theme = 'colorsbox'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: Hybrid Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:hybrid_patch()
  call s:gitgutter_reset()
  let g:airline_theme = 'hybrid'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: 256 Noir Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:noir_patch()
  call s:gitgutter_reset()
  let g:airline_theme = 'github'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Preferred Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup themes
  autocmd! ColorScheme colorsbox-stnight call s:colorsbox_patch()
  autocmd! ColorScheme 256_noir call s:noir_patch()

  if has('nvim')
    colorscheme colorsbox-stnight
  else
    colorscheme 256_noir
    " colorscheme colorsbox-stnight
    " colorscheme hybrid
  endif
augroup END
