-- colorschemes: set colo in init.lua, not here!
return {
  'HoNamDuong/hybrid.nvim',
  'KijitoraFinch/nanode.nvim',
  'Mofiqul/vscode.nvim',
  'catppuccin/nvim',
  'marko-cerovac/material.nvim',
  'navarasu/onedark.nvim',
  'projekt0n/github-nvim-theme',
  'rebelot/kanagawa.nvim',
  'sainnhe/edge',
  'sainnhe/edge',
  'sainnhe/gruvbox-material',
  'sainnhe/sonokai',
  'tomasiser/vim-code-dark',

  {
    'AlexvZyl/nordic.nvim',
    config = function()
      require('nordic').load()
    end
  },

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
      -- vim.cmd.colorscheme 'tokyonight-storm'
      vim.cmd.colorscheme = 'nordic'
      vim.cmd([[hi SpellBad gui=underline guifg=#fc2d83]]) -- TODO(mark 2026-10-21): tweak
      vim.cmd([[hi ColorColumn guibg=#2d3454]]) -- Lighten the ColorColumn for better visibility
      vim.cmd([[hi Comment guifg=#959cbc]])     -- brighten comments
    end
  },
}
