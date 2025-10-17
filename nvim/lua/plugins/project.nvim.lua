return {
  'DrKJeff16/project.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'ibhagwan/fzf-lua',
  },
  opts = {
    scope_chdir = 'win',
    patterns = {
      '.git',
      'init.lua', -- for nvim project
      'nx.json',
      'package.json',
      'project.json',
    },
    main = 'project_nvim'
  },
  config = function(_, opts)
    require('project').setup(opts)
  end
}
