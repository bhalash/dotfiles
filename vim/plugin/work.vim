""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Contracting/Job Specific Configuration
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Check if Wakatime is installed and I'm in a work-related folder.

function LogWork()
  return filereadable(expand('~/.wakatime.cfg')) && getcwd() =~ 'Projects'
endfunction
