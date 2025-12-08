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
  config = function()
    local snacks = require'snacks'

    local picker_opts = {
      -- layout = 'bottom',
      -- layout = 'dropdown',
      -- layout = 'ivy_split',
      -- layout = 'left',
      -- layout = 'right',
      -- layout = 'select',
      -- layout = 'sidebar',
      -- layout = 'telescope',
      -- layout = 'top',
      -- layout = 'vertical',
      -- layout = 'vscode',
      layout = 'bottom',
      win = {
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['<c-s>'] = { 'edit_split', mode = { 'i', 'n' } },
            ['<c-v>'] = { 'edit_vsplit', mode = { 'i', 'n' } },
          }
        }
      },
    };

    vim.keymap.set('n', '<leader><space>', function() snacks.picker.smart(picker_opts) end)
    vim.keymap.set('n', '<leader><enter>', function() snacks.picker.recent(picker_opts) end)
    vim.keymap.set('n', '<leader>h', function() snacks.picker.lsp_references(picker_opts) end)
    vim.keymap.set('n', '<leader>b', function() snacks.picker.buffers(picker_opts) end)
    vim.keymap.set('n', '<leader>u', function() snacks.picker.buffers(picker_opts) end)
    vim.keymap.set('n', '<leader>/', function() snacks.picker.lines(picker_opts) end)
    vim.keymap.set('n', '<leader>g', function() snacks.picker.grep_word(picker_opts) end)
    vim.keymap.set('n', 'q:', function() snacks.picker.command_history(picker_opts) end)
    vim.keymap.set('n', '<leader>m', function() snacks.picker.colorschemes({}) end)
  end
}
