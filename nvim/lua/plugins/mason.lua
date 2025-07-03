return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    automatic_enable = {
      'angularls',
      'html',
      'kotlin-language-server',
      'lua_ls',
      'ts_ls',
    }
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
