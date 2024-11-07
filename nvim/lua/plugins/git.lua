-- git and projects
return {
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',
  'editorconfig/editorconfig-vim',

  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        patterns = { '.git', 'nx.json', 'project.json' },
      }
    end
  },
}
