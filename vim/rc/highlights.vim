" vim: fdm=marker ft=sourceonsave.vim
" nnoremap <Space>vh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
nnoremap <silent> <Space>vh :exec "hi ".synIDattr(synID(line("."),col("."),1),"name")<CR>
syntax on
set t_Co=16

" hi CursorLine cterm=none ctermbg=236
hi CursorLine cterm=none ctermbg=0

hi SnipeMatch ctermbg=242 ctermfg=NONE
hi CocHighlightText ctermbg=0
hi SignColumn ctermbg=none ctermfg=blue
hi GitGutterAdd ctermbg=none ctermfg=green
hi GitGutterRemove ctermbg=none ctermfg=red
hi GitGutterDelete ctermbg=none ctermfg=red
hi GitGutterChange ctermbg=none ctermfg=darkyellow

hi  User1               cterm=none  ctermbg=0        ctermfg=white
hi  User2               cterm=none  ctermbg=green    ctermfg=black
hi  User3               cterm=none  ctermbg=black    ctermfg=white
hi  User5               cterm=none  ctermbg=gray     ctermfg=black
hi  StatusLineNC        cterm=none  ctermbg=black    ctermfg=none
hi  StatusLineTerm      cterm=none  ctermbg=black    ctermfg=none
hi  StatusLineNormal    cterm=none  ctermbg=green    ctermfg=black
hi  StatusLineInsert    cterm=none  ctermbg=blue     ctermfg=black
hi  StatusLineVisual    cterm=none  ctermbg=magenta  ctermfg=black
hi  StatusLineReplace   cterm=none  ctermbg=red      ctermfg=black
hi  StatusLineDisabled  cterm=none  ctermbg=white    ctermfg=black
hi  TabLineFill         cterm=none  ctermbg=black    ctermfg=white
hi  TabLineSel          cterm=bold  ctermbg=black    ctermfg=white
hi  TabLine             cterm=none  ctermbg=black    ctermfg=gray

hi DiffAdd      ctermbg=LightBlue
hi DiffChange   ctermbg=LightMagenta
hi DiffDelete   ctermfg=Blue ctermbg=LightCyan
hi DiffText     ctermbg=Red cterm=bold
hi Directory    ctermfg=DarkBlue
hi ErrorMsg     cterm=none ctermbg=none ctermfg=red
hi FoldColumn   ctermbg=Grey ctermfg=DarkBlue
hi Folded       ctermbg=8 ctermfg=blue
hi ColorColumn  ctermbg=0 ctermfg=none
hi IncSearch    cterm=reverse
hi ModeMsg      cterm=bold
hi MoreMsg      ctermfg=DarkGreen
hi NonText      ctermbg=none   ctermfg=Blue
hi Pmenu        ctermbg=black  ctermfg=white
hi PmenuSel     ctermbg=blue   ctermfg=black
hi Question     ctermbg=black  ctermfg=DarkGreen
hi Todo        cterm=none ctermbg=black  ctermfg=magenta
hi MatchParen   ctermbg=black  ctermfg=blue      cterm=bold,underline
hi Search       ctermbg=Yellow ctermfg=Black

hi  SpecialKey  ctermfg=DarkBlue
hi  Title       ctermfg=blue
hi  VertSplit   cterm=none            ctermbg=none   ctermfg=darkgray
hi  Visual      cterm=reverse         ctermbg=none   ctermfg=none
hi  VisualNOS   cterm=underline,bold
hi  WarningMsg  ctermfg=DarkRed
hi  WildMenu    cterm=none            ctermfg=black  ctermbg=blue
hi  StatusLine  cterm=none            ctermfg=white  ctermbg=NONE

" Syntax Highlighting
hi  Comment         cterm=none       ctermbg=none  ctermfg=8
hi  Constant        cterm=none       ctermbg=none  ctermfg=cyan
hi  Identifier      cterm=none       ctermbg=none  ctermfg=red
hi  Function        cterm=none       ctermbg=none  ctermfg=blue
hi  PreProc         cterm=none       ctermbg=none  ctermfg=yellow
hi  Special         cterm=none       ctermbg=none  ctermfg=blue
hi  Statement       cterm=none       ctermbg=none  ctermfg=magenta
hi  Type            cterm=none       ctermbg=none  ctermfg=yellow
hi  Number          cterm=none       ctermbg=none  ctermfg=3
hi  String          cterm=none       ctermbg=none  ctermfg=green
hi  Character       cterm=none       ctermbg=none  ctermfg=green
hi  Keyword         cterm=none       ctermbg=none  ctermfg=red
hi  Boolean         cterm=none       ctermbg=none  ctermfg=3
hi  Conditional     cterm=none       ctermbg=none  ctermfg=magenta
hi  Include         cterm=none       ctermbg=none  ctermfg=blue
hi  Define          cterm=none       ctermbg=none  ctermfg=magenta
hi  Macro           cterm=none       ctermbg=none  ctermfg=magenta
hi  Underlined      cterm=underline  ctermbg=none  ctermfg=white
hi  Error           cterm=none       ctermbg=none  ctermfg=red
hi  Delimiter       cterm=none       ctermbg=none  ctermfg=white
hi  SpecialChar     cterm=none       ctermbg=none  ctermfg=white
hi  Tag             cterm=none       ctermbg=none  ctermfg=white
hi  Debug           cterm=none       ctermbg=none  ctermfg=white
hi  SpecialComment  cterm=none       ctermbg=none  ctermfg=8
hi  Label           cterm=none       ctermbg=none  ctermfg=magenta
hi  Exception       cterm=none       ctermbg=none  ctermfg=magenta
hi  PreCondit       cterm=none       ctermbg=none  ctermfg=yellow
hi  StorageClass    cterm=none       ctermbg=none  ctermfg=yellow
hi  Structure       cterm=none       ctermbg=none  ctermfg=yellow
hi  Typedef         cterm=none       ctermbg=none  ctermfg=yellow
hi  Tag             cterm=none       ctermbg=none  ctermfg=blue
hi  SpecialChar     cterm=none       ctermbg=none  ctermfg=blue
hi  Debug           cterm=none       ctermbg=none  ctermfg=blue
hi  Float           cterm=none       ctermbg=none  ctermfg=3

" Special Cases
hi mkdLink      cterm=none ctermbg=none ctermfg=none
hi mkdDelimiter cterm=none ctermbg=none ctermfg=magenta
hi LineNr       cterm=none ctermbg=none ctermfg=gray
hi CursorLineNr cterm=none ctermbg=none ctermfg=white

" C++
hi cIncluded cterm=none ctermbg=none ctermfg=green

" Vimscript
hi vimNotation cterm=none ctermbg=none ctermfg=blue
hi link vimUserFunc Function

" Typescript
hi link typescriptBraces Delimiter
