-- undercurl for spelling errors
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- colours
vim.o.termguicolors = true
vim.cmd.colorscheme 'tokyonight'
vim.cmd([[hi SpellBad gui=undercurl guisp=#fc2d83 guifg=#fc2d83]])
vim.cmd([[hi ColorColumn guibg=#2d3454]])
vim.cmd([[hi Comment guifg=#959cbc]])
