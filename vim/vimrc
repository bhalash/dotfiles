""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core Vim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set term colours.
set termguicolors background=dark

" Enable syntax highlighting.
syntax on

" Backspace will delete.
set backspace=indent,eol,start

" Set relative numbering and toggle keybind.
set relativenumber

" Open split below and to the right instead of up and to the left.
set splitbelow splitright

" Force order of line endings.
set ffs=unix,dos

" Follow auto indent.
set autoindent

" Don't wrap lines outside of words.
set nowrap breakindent linebreak nolist

" Enable line numbers.
set nu

" Enable ruler for column count.
set ruler

" Enable statusbar.
set laststatus=2

" Accept instructions from the top n lines of a file.
set modelines=1

" Stop annoying problem on OS X.
" Arrow keybinds cause a status popup to appear when I tab back to vim.
set shortmess=a

" Disable visual bell. It's annoying as crap in git bash on Windows.
set visualbell
set t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scrolling and Mice
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set padding when scrolling.
set scrolloff=10 sidescrolloff=10

" Scroll with mouse in insert mode.
set mouse=i

" Increase scroll speed.
set ttyfast

" Change how buffer is redrawn. /Should/ increase scroll speed.
set lazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion and Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore common temp files and directories.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.cache,*.bak,*.pyc,*.class
set wildignore+=node_modules
set wildignore+=*public/packs*

" Menu display output.
set wildmenu wildmode=list:full

" Search as I type, and highlight results.
set incsearch smartcase hlsearch

" Searches are assumed to be global on a line.
set gdefault

" Tabbing
set expandtab ts=2 sw=2 sts=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Saving, Filesystem and History
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Save file when it loses focus.
set autowrite

" More frequent saves and bigger undo history.
set updatecount=50 history=2000 undolevels=2000

" Keep a persistent backup file.
set undofile undodir=.undo,~/tmp,/tmp

" Disable swap files.
set noswapfile

" Set a directory in case they *are* turned on.
set directory=~/.vim/.tmp,~/tmp,/tmp

" Highlight the current line and set the colour.
set cul

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Quickfix Window
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:quickfix_is_open = 0

function! QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
  else
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" External Configurations (Plugins)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime plugin/vundle.vim
