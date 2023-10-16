vim.o.termguicolors = true

vim.g.ayucolor = 'dark'

vim.cmd.colorscheme 'sonokai'

vim.cmd [[
  hi clear NonText
  hi clear LineNr
  hi clear NonText
  hi clear SignColumn
  hi clear StatusLineNC
  hi clear TabLine
  hi clear TabLineFill
]]


-- GitGutter
vim.cmd [[
  hi GitGutterAdd           cterm=none  ctermbg=none  ctermfg=46   gui=none  guifg=#00ff00 guibg=none
  hi GitGutterChange        cterm=none  ctermbg=none  ctermfg=45   gui=none  guifg=#00d7ff guibg=none
  hi GitGutterChangeDelete  cterm=none  ctermbg=none  ctermfg=11   gui=none  guifg=#ffff00 guibg=none
  hi GitGutterDelete        cterm=none  ctermbg=none  ctermfg=196  gui=none  guifg=#ff0000 guibg=none
]]

vim.cmd [[
  hi CocUnusedHighlight guifg=#ea1730 gui=underline
  hi ColorColumn guibg=#30373d
  hi Comment guifg=#62595a
  hi LineNr guifg=#5c636b
  hi Search gui=underline guibg=none guifg=#c3ce2d
]]

vim.cmd [[
  hi StatusLine guifg=#ffffff guibg=none
  hi StatusLineNC guifg=#606060
]]

vim.cmd [[
  hi TabLineSel cterm=reverse ctermfg=15 ctermbg=242 gui=reverse guifg=#e6e1cf guibg=#14191f
]]

vim.cmd [[
  hi MatchParen gui=underline guifg=#ff9800 guibg=none
  hi CursorLine guibg=#303030
]]
