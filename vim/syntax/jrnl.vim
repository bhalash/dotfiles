" vim:fdls=0
"
" NOTE(mark 2022-01-09): lifted from jrnl.vim
"
" See: https://github.com/wren/jrnl.vim
" See: https://github.com/wren/jrnl.vim/blob/main/after/syntax/jrnl.vim
" See: https://learnvimscriptthehardway.stevelosh.com/chapters/45.html
" See: https://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"
" TODO(mark 2022-01-09): Some things I'd like to fix:
"
"  - Compatibility with markdown syntax, epspecially highlight of links and em,
"    strong text
"  - Highlight of hyperlinks
"  - Highlight or title and tags in more than first post in a group
"
" License ------------------------------------------------------------------ {{{
"
" jrnl.vim is licensed under the Apache 2.0 license (see below). These are the
" same terms as Neovim, and is compatible with the Vim license.
"
" ---
"
" Copyright © 2020 Jonathan Wren <jonathan@nowandwren.com>
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"      http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
" implied.
"
" See the License for the specific language governing permissions and
" limitations under the License.
"
" }}}

highlight JrnlBoxActive guifg=#CBE697 gui=reverse
highlight JrnlBoxDone guifg=#545454 gui=strikethrough
highlight JrnlBoxEmpty guifg=#CBE697
highlight JrnlBoxImportant guifg=#EA9073 gui=bold,reverse
highlight JrnlBoxInfo guifg=#9CDBFC
highlight JrnlBoxQuestion guifg=#B283AF
highlight JrnlBoxStar guifg=#EEC476 gui=bold,reverse
highlight JrnlDate guifg=#545454 guibg=none
highlight JrnlEntryLine guifg=#66C9FF guibg=none gui=bold,underline
highlight JrnlNope guifg=none guibg=none gui=none
highlight JrnlSpoilers guibg=#000000
highlight JrnlTag guifg=#F8CC7A

syntax match JrnlDate /\v\[\d{4}(-\d\d){2} \d\d(:\d\d){1,2}( [aApP][mM])?\] / contained conceal display
syntax match JrnlTag /@.\{-}\w\+/ display
syntax match NoSpellApostrophe '\'s' contains=@NoSpell
syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syntax match jLeadingWhiteSpace /\v^.{-}\] +/ contained
syntax match jNumByNum /\v<\d+x\d+>/ contains=@NoSpell display
syntax match jbracket /\v[\[\]]/ contained conceal display
syntax match jseasonepbody /s\d\de\d\d/ contains=@NoSpell display
syntax match jseasoneptitle /s\d\de\d\d/ contains=@NoSpell contained display

syntax region JrnlEntryLine start='\v^\[\d{4}(-\d\d){2} \d?\d(:[0-6]\d){1,2}( [apAP][mM])?\]' end=/$/ display
  \ contains=JrnlDate,jseasoneptitle,JrnlTag,Spell
syntax region JrnlBoxDone start=/^\v\z(\s+)*- \[[xc]\]\s+/ end=/\v^(\z1\s(\s+- \[ \])@!|$)@!/
syntax region JrnlBoxEmpty start=/^\v\s*- \[ \]\s+/ end=/$/
syntax region JrnlBoxActive start=/^\v\s*- \[\.\]\s+/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlBoxQuestion start=/^\v\s*- \[\?\]\s+/ end=/$/
syntax region JrnlBoxInfo start=/^\v\s*- \[i\]\s+/ end=/$/
syntax region JrnlBoxImportant start=/\v^\s*- \[!\]\s+/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlBoxStar start=/\v^\s*- \[\*\]/ end=/$/ contains=jLeadingWhiteSpace
syntax region JrnlSpoilers matchgroup=jspoilers start=/||/ end=/||/ concealends contains=@Spell,jseasonepbody

highlight def link jlbracket JrnlDate
highlight def link jseasoneptitle JrnlEntryLine
highlight def link jspoilers JrnlSpoilers
highlight def link jLeadingWhiteSpace JrnlNope

" These get overridden by indentLine, so we need matchadd
call matchadd('Conceal', '- \[ \]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[x\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[?\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[!\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[c\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[i\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[\.\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '- \[\*\]', 10, -1, { 'conceal': ''})
call matchadd('Conceal', '^\s*\zs-\ze [^\[]', 10, -1, { 'conceal': ''})

function! JrnlFolds()
  let line = getline(v:lnum)
  if match(line, '\v^\s*#/-+/?#?\s*$') >= 0
    return "s1"
  elseif match(line, '\v^\s*#-+#?\s*$') >= 0
    return "a1"
  elseif match(line, '\v^\s*#{5} ') >= 0
    return ">6"
  elseif match(line, '\v^\s*#{4} ') >= 0
    return ">5"
  elseif match(line, '\v^\s*#{3} ') >= 0
    return ">4"
  elseif match(line, '\v^\s*#{2} ') >= 0
    return ">3"
  elseif match(line, '\v^(\s*# |\*{1,2})') >= 0
    return ">2"
  elseif match(line, '\v^\[\d{4}(-\d\d){2} \d?\d(:[0-6]\d){1,2}( [apAP][mM])?\] ') >= 0
    return ">1"
  else
    return "="
  endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=JrnlFolds()
