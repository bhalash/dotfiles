-- colorschemes: set colo in init.lua, not here!
return {
  'AlexvZyl/nordic.nvim',
  'HoNamDuong/hybrid.nvim',
  'KijitoraFinch/nanode.nvim',
  'Mofiqul/vscode.nvim',
  'catppuccin/nvim',
  'marko-cerovac/material.nvim',
  'navarasu/onedark.nvim',
  'projekt0n/github-nvim-theme',
  'sainnhe/edge',
  'sainnhe/sonokai',
  'tomasiser/vim-code-dark',
  'rebelot/kanagawa.nvim',

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
      vim.cmd.colorscheme 'tokyonight-storm'
      vim.cmd([[hi ColorColumn guibg=#2d3454]]) -- Lighten the ColorColumn for better visibility
      vim.cmd([[hi Comment guifg=#959cbc]])     -- brighten comments
    end
  },
}
