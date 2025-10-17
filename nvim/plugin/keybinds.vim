" Fits with tmux prefix being on C-a
nnoremap <C-s> <C-a>

" Remap alternate-file to '', easier on my stupid keyboard
noremap '' <C-^>

" Page up and down on nav keys
noremap <C-j> <PageDown>
noremap <C-k> <PageUp>

" Use <Tab> to cycle through buffers in tab
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split buffer
nnoremap <leader>v :vsp<CR>
nnoremap <leader>x :sp<CR>
nnoremap <leader>t <C-W>T

" Toggle spellchecking
" nnoremap <leader>a :setlocal spell!<CR>

" Clear highlighted search easier
" nnoremap <C-BS> :nohlsearch<CR>
nnoremap <BS> :nohlsearch<CR>

" Strip all trailing whitespace from the file
nnoremap <silent><leader><BS> :%s/\s\+$//<CR>:let @/=''<CR> :nohlsearch<CR> :w<CR>

" Stop * jumping to next occurrence
nnoremap * :keepjumps normal! mi*`i<CR>

" Most of the time I'm happy with the top seplling suggestion
nnoremap z= 1z=

" Insert one character at end of line, because I am lazy, lol
" nnoremap <silent><CR> :exec "normal A" . nr2char(getchar()) . "\e"<CR>

nnoremap : <cmd>FineCmdline<CR>

" Colorcolumn
" This function defaults to 80.
nnoremap <leader>cc <Plug>(dotfiles-toggle-colorcolumn)
nnoremap <silent><leader>cp :set colorcolumn=120<CR>
nnoremap <silent><leader>cg :execute 'set colorcolumn=' . col('.')<CR>

" Find & Replace
" Stolen from Reddit - replace word under cursor
nnoremap <CR> ciw
" Replace all instances of word in file or selection
" nnoremap <leader>S :%s,\<<C-r>=expand("<cword>")<CR>\>,
" vnoremap <leader>S :s,\<<C-r>=expand("<cword>")<CR>\>,

nnoremap <leader>s :s,
nnoremap <leader>S :%s,
vnoremap <leader>s :s,
nnoremap S :%s,,

" nnoremap <leader>f :%g,

" Take visual selection and search with it
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Yank
" These keys are awkward to reach in combination on my stupid keyboard
nnoremap + "+
vnoremap + "+

" Yank the whole file to system clipboard
nnoremap <leader>yy :%y+<CR>
" Yank marked up snippet to clipboard
vnoremap <leader>y :call functions#YankSnippet()<CR>

" zen-mode.nvim
nnoremap <silent><leader>z :ZenMode<CR>

" tpope/vim-fugitive
" nnoremap <silent><leader>fdd :GDelete!<CR>
nnoremap <silent><leader>fb :Git blame<CR>
nnoremap <silent><leader>fv :Gvdiffsplit<CR>
nnoremap <silent><leader>fw :Gw<CR>
nnoremap <silent><leader>fc :Git commit<CR>
nnoremap <silent><leader>f :Gw<CR>
" reset the file in the current buffer
" nnoremap <silent><leader>fe :!git checkout %<CR>

" tpope/vim-obsession
" FIXME(mark 2024-10-09): Get this working, lol!
nnoremap <leader>P <Plug>(dotfiles-session-toggle)
