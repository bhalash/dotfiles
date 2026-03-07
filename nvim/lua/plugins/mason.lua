return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'angularls',
      'html',
      'jsonls',
      'lua_ls',
      'sqlls',
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
