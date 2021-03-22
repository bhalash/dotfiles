""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core Vim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Patches
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:gitgutter_patch()
  hi clear LineNr
  hi clear SignColumn
  hi GitGutterAdd           cterm=none  ctermbg=none  ctermfg=46   gui=none  guifg=#00ff00 guibg=none
  hi GitGutterChange        cterm=none  ctermbg=none  ctermfg=45   gui=none  guifg=#00d7ff guibg=none
  hi GitGutterChangeDelete  cterm=none  ctermbg=none  ctermfg=11   gui=none  guifg=#ffff00 guibg=none
  hi GitGutterDelete        cterm=none  ctermbg=none  ctermfg=196  gui=none  guifg=#ff0000 guibg=none
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: ayu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:ayu_patch()
  call s:gitgutter_patch()
  hi ColorColumn guibg=#30373d
  hi Comment guifg=#8293a5
  hi LineNr guifg=#5c636b
  let ayucolor='dark'
endfunction

autocmd! ColorScheme ayu call s:ayu_patch()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: monochrome
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:monochrome_patch()
  call s:gitgutter_patch()
  hi SignatureMarkText guibg=none
  hi SignatureMarkerText guibg=none
endfunction

autocmd! ColorScheme monochrome call s:monochrome_patch()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:gruvbox_patch()
  call s:gitgutter_patch()
  hi SignatureMarkText guibg=none
  hi SignatureMarkerText guibg=none
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_transparent_bg = 1
endfunction

autocmd! ColorScheme gruvbox call s:gruvbox_patch()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Patch: flatlandia
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:flatlandia_patch()
  " hi StatusLineNC guibg=#4c4c4c
  " hi VertSplit guibg=#4c4c4c
  call s:gitgutter_patch()
  hi LineNr guifg=#5c636b
  hi NonText guibg=none
  hi StatusLine guibg=none guifg=Black guibg=#a5a5a5
endfunction

autocmd! ColorScheme flatlandia call s:flatlandia_patch()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Preferred Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme flatlandia

" TODO: monotone works for me, needs some love and attention though - fork?
" See: https://github.com/Lokaltog/vim-monotone
" colorscheme monotone
" hi clear Comment
" hi Comment guibg=none guifg=#424242
" call s:gitgutter_patch()
" hi LineNr guifg=#5c636b
