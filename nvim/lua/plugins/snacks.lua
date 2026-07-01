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
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = false },
    notify = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
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
      -- layout = 'sidebar', -- i like this one
      layout = 'telescope',
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['<C-x>'] = { 'edit_split', mode = { 'i', 'n' } },
            ['<C-v>'] = { 'edit_vsplit', mode = { 'i', 'n' } },
          }
        }
      },
    };

    vim.keymap.set('n', '<leader><space>', function() snacks.picker.files(picker_opts) end)
    vim.keymap.set('n', '<leader><enter>', function() snacks.picker.recent(picker_opts) end)
    vim.keymap.set('n', '<leader>h', function() snacks.picker.smart(picker_opts) end)
    vim.keymap.set('n', '<leader>/', function() snacks.picker.lines(picker_opts) end)

    vim.keymap.set('n', '<leader><tab>', function() snacks.picker.projects({
      finder = 'recent_projects',
      scope_chdir = 'win',
      dev = {
        vim.env.DOTFILES,
        vim.env.CONFIG_DIR,
        vim.env.CODE_DIR,
        vim.env.WORK_DIR,
      },
      patterns = {
        '.git',
        'nx.json',
        'package.json',
        'project.json'
      },
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          }
        }
      },
    }) end)

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

    vim.keymap.set('n', '<leader>b', function() snacks.picker.buffers(picker_opts) end)
    vim.keymap.set('n', '<leader>g', function() snacks.picker.grep_word(picker_opts) end)
    vim.keymap.set('n', 'q:', function() snacks.picker.command_history(picker_opts) end)
    vim.keymap.set('n', '<leader>m', function() snacks.picker.colorschemes({}) end)
  end
}
