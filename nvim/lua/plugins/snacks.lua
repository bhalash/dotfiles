return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
  -- keys = {
  --   { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
  -- },
  config = function()
    local snacks = require'snacks'
    vim.keymap.set('n', '<leader><space>', function() snacks.picker.smart({}) end)
    vim.keymap.set('n', '<leader>u', function() snacks.picker.buffers({}) end)
    vim.keymap.set('n', '<leader>g', function() snacks.picker.grep_word({}) end)
    vim.keymap.set('n', 'q:', function() snacks.picker.command_history({}) end)
  end
}
