return {
  -- git'n'shit
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',
  'editorconfig/editorconfig-vim',

  {
    -- TODO(mark 2024-11-04): Do I need/want rooting for projects?
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        patterns = { '.git', 'nx.json', 'project.json' },
      }
    end
  },
}
