return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local actions = require 'telescope.actions'

      require'telescope'.setup({
        extensions = {
          coc = {
            theme = 'ivy',
            -- always use Telescope locations to preview definitions,
            -- declarations, and implementations etc
            prefer_locations = true,
          }
        },
        defaults = {
          -- TODO(workmark 2023-10-16): Come back and play with this.
          -- path_display = { 'smart' },
          file_ignore_patterns = {
            '^.git/',
            '*.xlf' -- angular i18n files
          },
          mappings = {
            i = {
              -- INFO(mark 2023-06-05): This changes all pickers to have a
              -- single mode, they will now exit from insert mode upon <ESC>.
              ['<esc>'] = actions.close,
              ['<C-h>'] = 'which_key',
            },
          },
        },
        pickers = {
          current_buffer_fuzzy_find = {
            layout_config = {
              horizontal = {
                height = 0.8,
                width = 0.8,
              }
            },
          },
          oldfiles = {
            theme = 'ivy',
            previewer = true,
            mappings = {
              i = {
                ["<CR>"] = actions.select_tab_drop,
              },
            },
          },
          grep_string = {
            theme = 'ivy',
          },
          buffers = {
            theme = 'ivy',
            previewer = false,
            show_all_buffers = true,
          },
          colorscheme = {
            theme = 'dropdown',
            enable_preview = true,
          },
          live_grep = {
            -- Search for exact case.
            file_ignore_patterns = {
              '%.xlf', -- angular i18n files
              'package-lock.json',
            },
            vimgrep_arguments = {
              'rg',
              '--color=never',
              '--no-heading',
              '--with-filename',
              '--line-number',
              '--column',
            },
          },
          find_files = {
            theme = 'ivy',
            previewer = true,
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--follow",
            },
            hidden = true,
          }
        }
      });

      vim.keymap.set('n', '<leader><space>', ':Telescope find_files<CR>');
      vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>');

      -- TODO(mark 2025-10-13): Look at better ways to integrate LSP + Telescope
      -- into my workflow. The grep_string function is so so useful!
      vim.keymap.set('n', '<leader>g', ':Telescope grep_string<CR>');
      vim.keymap.set('n', '<leader>h', ':Telescope lsp_references<CR>');

      vim.keymap.set('n', '<leader>m', ':Telescope live_grep<CR>');
      vim.keymap.set('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>');

      vim.keymap.set('n', 'q:', ':Telescope command_history<CR>');
      vim.keymap.set('n', '<leader>u', ':Telescope buffers<CR>');

      vim.keymap.set('n', '<leader>b', ':Telescope git_bcommits<CR>');
      vim.keymap.set('n', '<leader><Tab>', ':Telescope projects<CR>');
      vim.keymap.set('n', '<leader><CR>', ':Telescope oldfiles<CR>');
    end
  },
}
