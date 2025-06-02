return {
  'ahmedkhalf/project.nvim',

  opts = {
    scope_chdir = 'win',
    patterns = { 'init.lua', '.git', 'nx.json', 'project.json' },
    main = 'project_nvim'
  },

  config = function(_, opts)
    require('project_nvim').setup(opts)
  end
}
