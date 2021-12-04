""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = 'f'

" So "+ is difficult to reach on my split 36 key keyboard.
nnoremap + "+

" Page backwards and forwards through a stack of open files.
nnoremap <leader>s :prev<CR>
nnoremap <leader>d :n<CR>

" Use <Tab> to cycle through buffers.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Split buffer.
nnoremap <leader>v :vsp<CR>
noremap <leader>x :sp<CR>

" Toggle spellchecking.
nnoremap <leader>sp :setlocal spell!<CR>

" Toggle highlighted results.
nnoremap <silent><bs> :nohlsearch<CR>

" Strip trailing whitespace from the file.
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :noh<CR>

" Quickly yank all lines in the file.
nnoremap <leader>yy :%y+<CR>

" Replace all lines in the file with the contents of the clipboard.
nnoremap <silent><leader>rp gg"_dGVp

" Stop * searches jumping word.
nnoremap * :keepjumps normal! mi*`i<CR>

" Format JSON in buffer.
nnoremap <silent><leader>jf :set ft=json <bar> %!python -m json.tool<CR>

" Toggle quickfix window.
nnoremap <leader>qf :call QuickfixToggle()<CR>

" See: https://github.com/neovim/neovim/pull/13268
nnoremap Y y$

" Set and clear colorcolumn.
nnoremap <silent><leader>cc :set colorcolumn=<CR>
nnoremap <silent><leader>ce :set colorcolumn=80<CR>
nnoremap <silent><leader>co :set colorcolumn=120<CR>
nnoremap <silent><leader>ch :execute 'set colorcolumn=' . col('.')<CR>

" Remove fucky quote characters in snippets pasted from Microsoft Word/HTML.
nnoremap <silent><leader>cj :%s/[‘’]/'/e \| %s/[“”]/"/e<CR>

" Take visual selection and search with it.
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
