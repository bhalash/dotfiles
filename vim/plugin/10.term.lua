vim.api.nvim_command('autocmd TermOpen * startinsert') -- starts in insert mode
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber') -- no numbers
vim.api.nvim_command('autocmd TermOpen * setlocal norelativenumber') -- no numbers
vim.api.nvim_command('autocmd TermEnter * setlocal signcolumn=no') -- no sign column
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')
