-- tpope/vim-obsession

local default_session = '.session.vim'

local function toggle_session_recording(session_name)
  if vim.fn.filereadable(session_name) == 1 then
    print('obsession: ending: ' .. session_name)
    vim.fn.execute('Obsession!')
  else
    print('obsession: recording: ' .. session_name)
    vim.fn.execute('Obsession ' .. session_name)
  end
end

local function source_session(session_name)
  if vim.fn.argc() == 0 and vim.fn.empty(vim.v.this_session) == 1 and vim.fn.filereadable(session_name) == 1 then
    vim.cmd.source(session_name)
  end
end

-- Autoload sessions created by tpope's vim-obsession when starting Vim
vim.api.nvim_create_autocmd({'VimEnter'}, {
  pattern = {'*'},
  nested = true,
 callback = function() source_session(default_session) end,
})

-- Plugin bind
vim.keymap.set('n', '<Plug>(toggle-default-session)', function()
  toggle_session_recording(default_session)
end)
