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
    notify = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
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
      -- layout = 'telescope',
      -- layout = 'top',
      -- layout = 'vertical',
      -- layout = 'vscode',
      layout = {
        hidden = { "preview" },
        layout = {
          backdrop = false,
          row = 1,
          width = 0.4,
          min_width = 80,
          height = 0.4,
          border = true,
          box = "vertical",
          { win = "input", height = 1, border = true, title = "{title} {live} {flags}", title_pos = "center" },
          { win = "list", border = "hpad" },
          { win = "preview", title = "{preview}", border = true },
        },
      },
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
    vim.keymap.set('n', '<leader>p', function() snacks.picker.smart(picker_opts) end)

    vim.keymap.set('n', '<leader><enter>', function() snacks.picker.recent(picker_opts) end)

    vim.keymap.set('n', '<leader><tab>', function() snacks.picker.projects({
      -- scope_chdir = 'win',
      patterns = {
        '.git',
        'nx.json',
        'package.json',
        'project.json'
      }
    }) end)

    -- toggle zen mode
    vim.keymap.set('n', '<leader>z', function() snacks.zen({
      window = {
        width = 160,
        height = 1,
      },
    }) end)

    vim.keymap.set('n', '<leader>h', function() snacks.picker.lsp_references(picker_opts) end)
    vim.keymap.set('n', '<leader>b', function() snacks.picker.buffers(picker_opts) end)
    vim.keymap.set('n', '<leader>u', function() snacks.picker.buffers(picker_opts) end)
    vim.keymap.set('n', '<leader>g', function() snacks.picker.grep_word(picker_opts) end)
    vim.keymap.set('n', 'q:', function() snacks.picker.command_history(picker_opts) end)
    vim.keymap.set('n', '<leader>m', function() snacks.picker.colorschemes({}) end)
    vim.keymap.set('n', '<leader>/', function() snacks.picker.lines(picker_opts) end)
  end
}
