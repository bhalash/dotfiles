return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
      animate = {
        enabled = false
      }
    },
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    dim = { enabled = true },
    explorer = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = false },
    notify = { enabled = false },
    ui_select = { enabled = true },
    picker = {
      enabled = true,
      -- layout = 'bottom',
      -- layout = 'dropdown',
      -- layout = 'ivy',
      -- layout = 'ivy_split',
      -- layout = 'left',
      -- layout = 'right',
      -- layout = 'select',
      -- layout = 'sidebar',
      -- layout = 'telescope',
      -- layout = 'top',
      -- layout = 'vertical',
      -- layout = 'vscode',
      layout = 'select',
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } }, -- close picker on <esc>
            ['<C-x>'] = { 'edit_split', mode = { 'i', 'n' } },
            ['<C-v>'] = { 'edit_vsplit', mode = { 'i', 'n' } },
          }
        }
      }
    },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    zen = { enabled = true },
  },
  init = function()
    local snacks = require'snacks'

    -- various pickers
    vim.keymap.set('n', '<leader><space>', snacks.picker.files)
    vim.keymap.set('n', '<leader><tab>', snacks.picker.explorer)
    vim.keymap.set('n', '<leader>b', snacks.picker.buffers)
    vim.keymap.set('n', 'q:', snacks.picker.command_history)

    vim.keymap.set('n', '<leader>/', function() snacks.picker.lines({ layout = 'telescope' }) end)
    vim.keymap.set('n', '<leader>g', function() snacks.picker.grep_word({ layout = 'telescope' }) end)
    vim.keymap.set('n', '<leader>m', function() snacks.picker.colorschemes({ layout = 'bottom' }) end)

    vim.keymap.set('n', '<leader><enter>', function()
      snacks.picker.recent({
        layout = 'select',
        preview = 'none',
        formatters = {
          file = {
            filename_first = true
          }
        }
      })
    end)

    -- toggle zen mode
    vim.keymap.set('n', '<leader>z', function() snacks.zen({
      toggles = {
        dim = false
      },
      window = {
        width = 160,
        height = 1,
      },
    }) end)

    -- toggle dim mode
    -- vim.keymap.set('n', '<leader>d', function() snacks.dim({}) end)
  end
}
