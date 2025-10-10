return {
  'ahmedkhalf/project.nvim',

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
    require('project_nvim').setup(opts)
  end
}
