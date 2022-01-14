function! s:SessionName()
  if system('git rev-parse 2> /dev/null; echo $?') == 0
    return trim(system('git rev-parse --abbrev-ref HEAD')) . '.vim'
  else
    return 'Session.vim'
  endif
endfunction

" Toggle session based upon git branch name, fallback to Session.vim
function! ToggleObsession()
  let session = s:SessionName()

  if filereadable(session)
    execute 'Obsession!'
  else
    execute 'Obsession ' . session
  endif
endfunction

" Autoload sessions created by tpope's vim-obsession when starting Vim
" See: https://gist.github.com/robmiller/5135652
augroup sourcesession
  autocmd!

  let session = s:SessionName()

  autocmd VimEnter * nested
  \ if !argc() && empty(v:this_session) && filereadable(session) |
  \   execute 'source ' . session |
  \ endif
augroup END

nnoremap <silent><leader>' :call ToggleObsession()<CR>
