-- git and projects
return {
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',
  'editorconfig/editorconfig-vim',

  {
    'ahmedkhalf/project.nvim',
    opts = {
      scope_chdir = 'win',
      patterns = { '.git', 'nx.json', 'project.json' },
      main = 'project_nvim'
    },
    config = function(_, opts)
      require('project_nvim').setup(opts)
    end
  },
}
