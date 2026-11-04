return {
  'catppuccin/nvim',
  'projekt0n/github-nvim-theme',
  'rebelot/kanagawa.nvim',
  {
    'navarasu/onedark.nvim',
    opts = { style = 'darker' }
  },
  {
    'folke/tokyonight.nvim',
    opts = {
      transparent = true,
      dim_inactive = true,
      style = 'storm',
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
