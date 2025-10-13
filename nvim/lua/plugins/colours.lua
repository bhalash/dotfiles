-- colorschemes
return {
  'AlexvZyl/nordic.nvim',
  'HoNamDuong/hybrid.nvim',
  'Mofiqul/vscode.nvim',
  'dgox16/oldworld.nvim',
  'marko-cerovac/material.nvim',
  'navarasu/onedark.nvim',
  'projekt0n/github-nvim-theme',
  'rebelot/kanagawa.nvim',
  'sainnhe/edge',
  'sainnhe/sonokai',
  'tomasiser/vim-code-dark',

  {
    'navarasu/onedark.nvim',
    opts = { style = 'darker' }
  },

  {
    'folke/tokyonight.nvim',
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.o.termguicolors = true
      vim.g.sonokai_style = 'maia'
      vim.cmd.colorscheme 'tokyonight-night'

      -- Lighten the ColorColumn for better visibility
      -- TODO(mark 2025-10-09): Brighten work laptop screen?
      vim.cmd([[hi ColorColumn guibg=#2d3454]])
    end
  },
}
