" tpope/vim-obsession
"
" INFO(mark 2023-12-10): This is custom functionality hacked in around me. I
" work primarily in monorepos. Sometimes I want just a default session shared
" across branches (which is fine), but in other cases I would like a
" branch-specific session.

let s:default_session = 'Session.vim'

" Toggle session based upon git branch name, fallback to Session.vim
function! s:ToggleSession(session_name)
  if filereadable(a:session_name)
    execute 'Obsession!'
  else
    execute 'Obsession ' . a:session_name
  endif
endfunction

"
" Git Sessions
" ------------------------------------------------------------------------------
"

function s:GitSessionName() abort
  if system('git rev-parse 2> /dev/null; echo $?') == 0
    return 'Session.' . substitute(trim(system('git rev-parse --abbrev-ref HEAD')), '/', '-', 'g') . '.vim'
  else
    return ''
  endif
endfunction

function s:SourceGitSession() abort
  let git_session = s:GitSessionName()

  if !argc() && empty(v:this_session) && filereadable(git_session)
    execute 'source ' . git_session
  endif
endfunction

function s:ToggleGitSession() abort
  call s:ToggleSession(s:GitSessionName())
endfunction

"
" Default Sessions
" ------------------------------------------------------------------------------
"

function s:ToggleDefaultSession() abort
  s:ToggleSession(s:default_session)
endfunction

function s:SourceDefaultSession() abort
  if !argc() && empty(v:this_session) && filereadable(s:default_session)
    execute 'source ' . s:default_session
  endif
endfunction

" Autoload sessions created by tpope's vim-obsession when starting Vim
" See: https://gist.github.com/robmiller/5135652
augroup sourcesession
  autocmd!
  autocmd VimEnter * nested call s:SourceGitSession()
  autocmd VimEnter * nested call s:SourceDefaultSession()
augroup END

nmap <Plug>(toggle-default-session) :call <SID>ToggleDefaultSession()<CR>
nmap <Plug>(toggle-git-session) :call <SID>ToggleGitSession()<CR>

" TODO(mark 2023-12-10): Move to keyboard file?
nnoremap <silent><leader>i <Plug>(toggle-default-session)
nnoremap <silent><leader>I <Plug>(toggle-git-session)
