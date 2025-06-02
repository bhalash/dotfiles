-- toggle colorcolumn
vim.keymap.set('n', '<Plug>(dotfiles-toggle-colorcolumn)', function()
  if vim.opt.colorcolumn['_value'] == '80' then
    vim.opt.colorcolumn = ''
  else
    vim.opt.colorcolumn = '80'
  end
end)
