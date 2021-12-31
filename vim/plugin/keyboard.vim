let mapleader = 's'

" Normal {{{

" Trying something dumb :-)
" NOTE(mark 2021-12-30): this depends on swapping ' <-> ; on my keyboard!
" noremap h '
" noremap ' l
" noremap l k
" noremap k j
" noremap j h

" These combinations are awkward to reach on my keyboard
nnoremap + "+
nnoremap ` <C-^>

" NOTE(mark 2021-12-30): trying these out for size :-)
nnoremap <leader>! ZQ<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <leader>q ZZ<CR>
nnoremap <leader>w :w<CR>

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
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :noh<CR>

" Yank the whole file to system clipboard
nnoremap <leader>yy :%y+<CR>

" Replace all lines in the file with the contents of the system clipboard
nnoremap <silent><leader>rp gg"_dGVp

" Stop * jumping to next occurrence
nnoremap * :keepjumps normal! mi*`i<CR>

" Format JSON in buffer
nnoremap <silent><leader>jf :set ft=json <bar> %!python -m json.tool<CR>

" See: https://github.com/neovim/neovim/pull/13268
nnoremap Y y$

" Remove fucky quote characters in snippets pasted from Microsoft Word/HTML
nnoremap <silent><leader>cj :%s/[‘’]/'/e \| %s/[“”]/"/e<CR>

" }}}

" junegunn/fzf.vim {{{

" TODO(mark 2021-12-29): these needs some love/reduction
" See: https://github.com/junegunn/fzf.vim#commands
" nnoremap <leader>r :Rg<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>f :Lines<CR>
nnoremap <leader>j :History<CR>
nnoremap <Leader>* :Rg <C-R><C-W><CR>
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

" TODO(mark 2021-12-29): these needs some love/reduction
noremap <silent><leader>fb :Git blame<CR>
nnoremap <silent><leader>fp :Git pull<CR>
nnoremap <silent><leader>fu :Git push<CR>
nnoremap <silent><leader>fs :Git status<CR>
nnoremap <silent><leader>fw :Gw<CR>
nnoremap <silent><leader>fc :Git commit<CR>
" reset the file in the current buffer
nnoremap <silent><leader>fr :!git checkout %<CR>

" }}}

" tpope/vim-obsession {{{

" TODO(mark 2021-12-29): move to a 'less easy' key to avoid accidents?
nnoremap <silent><leader>b :Ob!<CR>

" }}}

" mattn/emmet-vim {{{

let g:user_emmet_leader_key='<leader>'

" }}}
