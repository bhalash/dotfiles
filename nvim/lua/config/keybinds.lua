-- Fits with tmux prefix being on C-a
vim.keymap.set('n', '<C-s>', '<C-a>')

-- Remap alternate-file to '', easier on my stupid keyboard
vim.keymap.set({ 'n', 'v', 'o' }, "''", '<C-^>')

-- Use <Tab> to cycle through buffers in tab
vim.keymap.set('n', '<Tab>', '<C-W>w')
vim.keymap.set('n', '<S-Tab>', '<C-W>W')

-- Split buffer
vim.keymap.set('n', '<leader>v', ':vsp<CR>')
vim.keymap.set('n', '<leader>x', ':sp<CR>')
vim.keymap.set('n', '<leader>t', '<C-W>T')

-- Clear highlighted search easier
vim.keymap.set('n', "<BS>", ':nohlsearch<CR>')

-- Stop * jumping to next occurrence
vim.keymap.set('n', '*', ':keepjumps normal! mi*`i<CR>')

-- Insert one character at end of line, because I am lazy, lol
-- vim.keymap.set("n", "<CR>", function()
--   vim.cmd('normal A' .. vim.fn.nr2char(vim.fn.getchar()) .. '<Esc>')
-- end)

-- Colorcolumn
vim.keymap.set('n', '<leader>c8', function()
  if vim.opt.colorcolumn['_value'] == '80' then
    vim.opt.colorcolumn = ''
  else
    vim.opt.colorcolumn = '80'
  end
end)

vim.keymap.set('n', '<leader>cc', ":execute 'set colorcolumn=' . col('.')<CR>")

-- Find & Replace
-- Stolen from Reddit - replace word under cursor
-- vim.keymap.set('n', '<BS>', 'ciw')
vim.keymap.set('n', '<CR>', 'ciw')

-- Replace all instances of word in file or selection
vim.keymap.set('n', '<leader>*', ":%s,\\<<C-r>=expand(\"<cword>\")<CR>\\>,")
vim.keymap.set('v', '<leader>*', ":s,\\<<C-r>=expand(\"<cword>\")<CR>\\>,")

-- TODO(mark 2026-10-04): I don't use these much - free up the keys?
vim.keymap.set("n", "<leader>a", ":%s,")
vim.keymap.set("n", "<leader>A", ":s,")
vim.keymap.set("v", "<leader>A", ":s,")

-- TODO(mark 2026-10-04): I love this - do more?
-- Take visual selection and search with it
vim.keymap.set('v', "//", [=[y/\V<C-R>=escape(@",'/\')<CR><CR>]=])

-- Yank
-- These keys are awkward to reach in combination on my stupid keyboard
vim.keymap.set("n", '+', '"+')
vim.keymap.set("v", '+', '"+')

-- Yank the whole file to system clipboard
vim.keymap.set("n", "<leader>yy", ":%y+<CR>")

-- Yank marked up snippet to clipboard
vim.keymap.set("v", "<leader>y", function()
  vim.fn["functions#YankSnippet"]()
end)

-- sindrets/diffview.nvim
-- vim.keymap.set('n', '<leader>,,', ':DiffviewOpen<CR>')
-- vim.keymap.set('n', '<leader>,.', ':DiffviewClose<CR>')

-- open current file in vscode
vim.keymap.set('n', '<leader>oo', function()
  vim.fn.jobstart({ 'code', vim.fn.expand('%') })
end)
