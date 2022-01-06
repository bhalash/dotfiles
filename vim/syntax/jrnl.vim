" Sourced from https://github.com/austintraver/vim-jrnl/blob/main/after/syntax/jrnl.vim
" TODO(mark 2022-01-06): needs better integration IMO
syntax match JrnlTag /@.\{-}\w\+/ display
syntax match JrnlDate /\v\d{4}(-\d\d){2}/ display
syntax match JrnlBracket /\v[\[\]]/ conceal display contains=JrnlDate
syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syntax match NoSpellApostrophe '\'s' contains=@NoSpell
syntax region JrnlEntryLine start='\v^\[\d{4}(-\d\d){2} \d?\d(:[0-6]\d){1,2}( [apAP][mM])?\]' end=/$/ display contains=JrnlDate,JrnlTag,Spell
syntax region JrnlBoxDone start=/^\v\z(\s+)*- \[[xc]\]\s+/ end=/\v^(\z1\s(\s+- \[ \])@!|$)@!/
syntax region JrnlBoxEmpty start=/^\v\s*- \[ \]\s+/ end=/$/
syntax region JrnlBoxQuestion start=/^\v\s*- \[\?\]\s+/ end=/$/
syntax region JrnlBoxInfo start=/^\v\s*- \[i\]\s+/ end=/$/

setlocal filetype=markdown
