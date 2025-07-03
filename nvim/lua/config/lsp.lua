local group = vim.api.nvim_create_augroup('LspMappings', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    local kb_opts = { buffer = args.buf, silent = true }

    vim.keymap.set('n', "gd", function() vim.lsp.buf.definition({}) end, kb_opts)
    vim.keymap.set('n', "K", vim.lsp.buf.hover, kb_opts)
    vim.keymap.set('n', "<c-s-K>", vim.lsp.buf.signature_help, kb_opts)
    vim.keymap.set('n', "gD", function() vim.lsp.buf.implementation({}) end, kb_opts)
    vim.keymap.set('n', "1gD", function() vim.lsp.buf.type_definition({}) end, kb_opts)
    vim.keymap.set('n', "gr", function() vim.lsp.buf.references() end, kb_opts)

    vim.keymap.set('n', "<c-]>", function() vim.lsp.buf.declaration({}) end, kb_opts)

    vim.keymap.set('n', "<Leader>re", vim.lsp.buf.rename, kb_opts)
    vim.keymap.set('n', "<Leader>ca", vim.lsp.buf.code_action, kb_opts)

    vim.keymap.set('n', "<Leader>ih", function()
      -- toggles inlay hints
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, kb_opts)

    -- diagnostics
    vim.keymap.set('n', "<Leader>di", vim.diagnostic.open_float, kb_opts)

    vim.keymap.set('n', "<Leader>k", function()
      vim.diagnostic.jump({ float = true, count = -1 })
    end, kb_opts)

    vim.keymap.set('n', "<Leader>j", function()
      vim.diagnostic.jump({ float = true, count = 1 })
    end, kb_opts)
  end,
})

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.lsp.enable({
  'angularls',
  'html',
  'kotlin_language_server',
  'lua_ls',
  'ts_ls',
})
