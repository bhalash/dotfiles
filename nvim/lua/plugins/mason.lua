return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      -- 'angularls',
      'html',
      'jdtls', -- java, not js, lol
      'jsonls',
      'kotlin_language_server',
      'lua_ls',
      'sqlls',
      'ts_ls',
      'vimls',
      'yamlls',
    },
    automatic_enable = {
      -- 'angularls',
      'html',
      'lua_ls',
      'ts_ls',
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
