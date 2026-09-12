-- Strip trailing whitespace before saving a file.
vim.api.nvim_create_autocmd({'BufWritePre', 'FileWritePre'}, {
  pattern = {
    '*.css',
    '*.html',
    '*.js',
    '*.lua',
    '*.scss',
    '*.ts',
    '*.vim',
    '*enkinsfile',
  },
  command = ':%s/\\s\\+$//e',
})
