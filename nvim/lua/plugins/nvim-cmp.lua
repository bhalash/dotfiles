return {
  {
    'L3MON4D3/LuaSnip',
    keys = function()
      return {}
    end,
  },
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-emoji',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local luasnip = require('luasnip')
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          {
            name = 'buffer',
            keyword_length = 2,
            option = {
              -- Complete against all open buffers.
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            }
          },
          {
            name = 'path',
            pathMappings = {
              option = {
                ['@'] = '${folder}/src',
              }
            }
          },
          { name = 'nvim_lsp', keyword_length = 6 },
          { name = 'luasnip', keyword_length = 6 },
        },
        mapping = {
          ['<Tab>'] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end,
            { 'i', 's' }
          ),

          ['<S-Tab>'] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end,
            { 'i', 's' }
          )
        }
      })

    end,
  }
}
