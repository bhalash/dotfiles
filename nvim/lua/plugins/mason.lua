return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      -- 'angularls',
      'html',
      'jdtls', -- java, not js, lol
      'kotlin_language_server',
      'lua_ls',
      'sqlls',
      'ts_ls',
    },
    automatic_enable = {
      -- 'angularls',
      'html',
      'ts_ls',
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
