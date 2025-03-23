require'mason'.setup{}

require'mason-lspconfig'.setup {
  ensure_installed = {
    'lua_ls',
    'angularls',
  },
}

require'lspconfig'.lua_ls.setup {
}

require'lspconfig'.angularls.setup {
}
