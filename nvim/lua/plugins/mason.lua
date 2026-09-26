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
      'pylsp',
      'tsc',
      'vimls',
      'yamlls',
    },
    automatic_enable = {
      'html',
      'lua_ls',
      'tsc',
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
