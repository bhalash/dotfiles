-- treesitter
return {
  'nvim-treesitter/completion-treesitter',
  {
    'nvim-treesitter/nvim-treesitter',
    -- version = false, -- use latest
    opts = {
      -- highlight = {
      --   enable = true,
      --   -- additional_vim_regex_highlighting = true,
      -- },
      init = function()
        local ensure_installed = {
          'angular',
          'bash',
          'css',
          'groovy',
          'html',
          'javascript',
          'jsdoc',
          'json',
          'lua',
          'markdown',
          'markdown_inline',
          'python',
          'regex',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        }

        -- local already_installed = require('nvim-treesitter.config').get_installed()
        --
        -- :filter(function(parser) return not vim.tbl_contains(already_, parser) end)
        -- :totable()

        require('nvim-treesitter').install(vim.iter(ensure_installed))

        vim.api.nvim_create_autocmd('FileType', {
          callback = function()
          -- Enable treesitter highlighting and disable regex syntax
          pcall(vim.treesitter.start)
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end,
        })
      end,
    },
    config = function(_, opts)
      require'nvim-treesitter.install'.prefer_git = true
      require'nvim-treesitter'.setup(opts)
    end,
  },
}
