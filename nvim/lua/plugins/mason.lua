return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'angularls',
      'cssls',
      'html',
      'jdtls',
      'jsonls',
      'lua_ls',
      'tsgo',
      'vimls',
      'yamlls',
    },
    automatic_enable = {
      'html',
      'lua_ls',
      'tsgo',
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
