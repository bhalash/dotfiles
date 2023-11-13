-- Core Configuration {{{

-- Enable syntax highlighting
-- syntax on

-- Disable mouse interactions >_>
vim.o.mouse = ''

-- Backspace will delete
vim.o.backspace = 'indent,eol,start'

-- Enable relative line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- Open split below and to the right instead of up and to the left
vim.o.splitbelow = true
vim.o.splitright = true

-- Force order of line endings
vim.o.fileformats = 'unix,dos'

-- Follow auto indent
vim.o.autoindent = true

-- Don't wrap lines outside of words
vim.o.wrap = false
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.list = false

-- Enable ruler for column count
vim.o.ruler = true

-- Enable statusbar
vim.o.laststatus = 2

-- Accept instructions from the top n lines of a file
vim.o.modelines = 1

-- Disable visual bell. It's annoying as crap in git bash on Windows
vim.o.visualbell = true

-- Statusbar - good if you don't want to use a plugin.
-- vim.o.statusline = [[[%{substitute(getcwd(), '^.*/', '', '')}] %<%f %h%m%r %y%=%{v:register} %-14.(%l,%c%V%) %P]]
vim.o.statusline = [[[%{substitute(getcwd(), '^.*/', '', '')}] %{expand('%:t')} %h%m%r %y%=%{v:register} %-14.(%l,%c%V%) %P]]

-- }}}

-- Scrolling! {{{

-- Set padding when scrolling
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- Increase scroll speed
vim.o.ttyfast = true

-- Change how buffer is redrawn. /Should/ increase scroll speed
vim.o.lazyredraw = true

-- Highlight the current line and set the colour
vim.o.cul = true

-- }}}

-- Completion and Indentation {{{

-- Ignore common temp files and directories
vim.o.wildignore = '*.cache,*/.tmp/*,node_modules'

-- Menu display output
vim.o.wildmenu = true
vim.o.wildmode = 'list:full'

-- Search as I type, and highlight results
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Searches are assumed to be global on a line
vim.o.gdefault = true

-- Set tabbing and indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- }}}

-- Saving, Filesystem and History {{{

-- Write file when it loses focus
vim.o.autowrite = true

-- More frequent saves and bigger undo history
vim.o.updatecount = 50
vim.o.history = 2000
vim.o.undolevels = 2000

-- Keep a persistent backup file
vim.o.undofile = true
vim.o.undodir = '~.undo,~/.tmp,/tmp'

-- Disable swap files, but set directories in case they *are* turned on
vim.o.swapfile = false

-- }}}
