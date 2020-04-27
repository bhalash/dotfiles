" Suppress html5-tidy errors. w0rp/ale uses html5-tidy for linting HTML files.
" Unfortunately html5-tidy is abandonware as of March 2019. The last master
" branch release (5.6.0) was in November 2017, at which point it errors out on
" custom HTML5 elements.
"
" Example:
"
"   <ion-toolbar> is not recognized!
"
" See: http://www.html-tidy.org/
" See: https://github.com/w0rp/ale/blob/master/ale_linters/html/tidy.vim#L5

let g:ale_html_tidy_options = '-q -e -language en 2>/dev/null'
