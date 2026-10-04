if (vim.env.NODE_DIR ~= nil) then
  -- Set custom node version for LSP tools. Needed on my work machine.
  -- See: https://neovim.io/doc/user/provider/#provider-nodejs
  -- See: https://jaketrent.com/post/set-node-version-nvim/
  vim.g.node_host_prog = vim.env.NODE_DIR .. '/node'
  vim.cmd("let $PATH = '" .. vim.env.NODE_DIR .. ":' . $PATH")
end

local group = vim.api.nvim_create_augroup('LspMappings', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local snacks = require'snacks'

    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    local kb_opts = { buffer = args.buf, silent = true }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, kb_opts)

    vim.keymap.set('n', 'gd', function()
      vim.cmd('vsp')
      vim.lsp.buf.definition({})
    end, kb_opts)

    vim.keymap.set('n', '<c-s-K>', vim.lsp.buf.signature_help, kb_opts)
    vim.keymap.set('n', '1gD', vim.lsp.buf.type_definition, kb_opts)

    vim.keymap.set('n', 'gd', snacks.picker.lsp_declarations)
    vim.keymap.set('n', 'gr', snacks.picker.lsp_references)

    vim.keymap.set('n', '<c-]>', vim.lsp.buf.declaration, kb_opts)

    vim.keymap.set('n', '<leader>rd', snacks.picker.lsp_symbols)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, kb_opts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, kb_opts)

    vim.keymap.set('n', '<Leader>ih', function()
      -- toggles inlay hints
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, kb_opts)

    -- diagnostics

    -- TODO(mark 2026-10-01): tweak these at work next week - could make key information more visible
    vim.keymap.set('n', '<Leader>i', vim.diagnostic.open_float, kb_opts)
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

    local function prev_diagnostic() vim.diagnostic.jump({ float = true, count = 1 }) end
    local function next_diagnostic() vim.diagnostic.jump({ float = true, count = -1 }) end

    -- TODO(mark 2026-10-01): tweak this at work next week - what's a good key?
    local function buffer_diagnostics()
      -- snacks.picker.diagnostics()

      snacks.picker.diagnostics_buffer({
        layout = 'bottom',
        -- layout = 'dropdown',
        -- layout = 'ivy_split',
        -- layout = 'left',
        -- layout = 'right',
        -- layout = 'select',
        -- layout = 'sidebar',
        -- layout = 'telescope',
        win = {
          input = {
            keys = {
              ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
              ['<C-x>'] = { 'edit_split', mode = { 'i', 'n' } },
              ['<C-v>'] = { 'edit_vsplit', mode = { 'i', 'n' } },
            }
          }
        },
      })
    end

    vim.keymap.set('n', '[a', prev_diagnostic)
    vim.keymap.set('n', ']a', next_diagnostic)
    vim.keymap.set('n', '[A', buffer_diagnostics)
  end,
})

-- Enable to show line diagnostics automatically in hover window when over issue.
vim.o.updatetime = 100

-- TODO(mark 2026-10-01): tweak these at work - what's a good setup?
vim.diagnostic.config({
  float = { border = 'single' },
  severity_sort = true,
  virtual_text = true,
})

vim.lsp.enable({
  'angularls',
  'cssls',
  'html',
  'jdtls',
  'jsonls',
  'lua_ls',
  'tsc',
  'vimls',
  'yamlls',
})
