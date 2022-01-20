let mapleader = 's'

" Normal {{{

" Fits with tmux prefix being on C-a
nnoremap <C-s> <C-a>

" These keys are awkward to reach in combination on my keyboard
nnoremap + "+
vnoremap + "+

" Diff
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>do :windo diffoff<CR>

" Use <Tab> to cycle through buffers in tab
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split buffer horizontally or vertically
nnoremap <leader>v :vsp<CR>
noremap <leader>x :sp<CR>

" Toggle spellchecking
nnoremap <leader>sp :setlocal spell!<CR>

" Clear highlighted results
nnoremap <silent><bs> :nohlsearch<CR>

" Strip all trailing whitespace from the file
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :nohlsearch<CR>

" Yank the whole file to system clipboard
nnoremap <leader>yy :%y+<CR>

" Replace all lines in the file with the contents of the system clipboard
nnoremap <silent><leader>rp gg"_dGVp

" Stop * jumping to next occurrence
nnoremap * :keepjumps normal! mi*`i<CR>

" Yank to EOL. See: https://github.com/neovim/neovim/pull/13268
nnoremap Y y$

" Remove fucky quote characters in snippets pasted from Microsoft Word/HTML
nnoremap <silent><leader>cj :%s/[‘’]/'/e \| %s/[“”]/"/e<CR>

" Yank relative path to file to system clipboard, useful for note-taking
nnoremap <leader>yp :let @+ = expand('%')<CR>

" }}}

" junegunn/fzf.vim {{{

" See: https://github.com/junegunn/fzf.vim#commands
" nnoremap <leader>r :Rg<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Lines<CR>
nnoremap <leader>j :History<CR>
nnoremap <leader>/ :BLines<CR>

" }}}

" Colorcolumn {{{

nnoremap <silent><leader>cc :set colorcolumn=<CR>
nnoremap <silent><leader>ce :set colorcolumn=80<CR>
nnoremap <silent><leader>co :set colorcolumn=120<CR>
nnoremap <silent><leader>cg :execute 'set colorcolumn=' . col('.')<CR>
nnoremap <silent><leader>cb :set colorcolumn=

" }}}

" Visual {{{

" Take visual selection and search with it
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" }}}

" junegunn/goyo.vim {{{

nnoremap <silent><leader>g :Goyo<CR>

" }}}

" tpope/vim-fugitive {{{

noremap <silent><leader>fb :Git blame<CR>
nnoremap <silent><leader>fp :Git pull<CR>
nnoremap <silent><leader>fu :Git push<CR>
nnoremap <silent><leader>fs :Git status<CR>
nnoremap <silent><leader>fw :Gw<CR>
nnoremap <silent><leader>fc :Git commit<CR>
" reset the file in the current buffer
nnoremap <silent><leader>fe :!git checkout %<CR>

" }}}

" mattn/emmet-vim {{{

let g:user_emmet_leader_key='<leader>'

" }}}
