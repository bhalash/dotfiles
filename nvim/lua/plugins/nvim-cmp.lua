return {
  {
    'L3MON4D3/LuaSnip',
    keys = function()
      return {}
    end,
  },
  -- 'hrsh7th/cmp-path', -- FIXME(mgrealis 2026-01-06): do I want this?
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-emoji',
  'onsails/lspkind.nvim',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local lspkind = require('lspkind')
      local luasnip = require('luasnip')
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        completion = {
          -- Align completeopt for LSP.
          completeopt = 'menu,menuone,noinsert,noselect',
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = {
              -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
              -- can also be a function to dynamically calculate max width such as
              -- menu = function() return math.floor(0.45 * vim.o.columns) end,
              menu = 50, -- leading text (labelDetails)
              abbr = 50, -- actual suggestion item
            },
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (_entry, vim_item)
              -- ...
              return vim_item
            end
          })
        },
        experimental = {
          ghost_text = true,
        },
        sources = {
          {
            name = 'nvim_lsp',
            dup = 0
          },

          {
            name = 'buffer',
            max_item_count = 8,
            dup = 0,
            option = {
              -- Complete against all open buffers.
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            }
          },

          -- {
          --   name = 'path',
          --   dup = 0,
          --   keyword_length = 5,
          --   pathMappings = {
          --     option = {
          --       ['@'] = '${folder}/src',
          --     }
          --   }
          -- },
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
