" vim: fdm=marker ft=sourceonsave.vim
" nnoremap <Space>vh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
" nnoremap <silent> <Space>vh :exec "hi ".synIDattr(synID(line("."),col("."),1),"name")<CR>
set t_Co=16

" hi CursorLine cterm=none ctermbg=236
hi CursorLine cterm=none ctermbg=0

hi SnipeMatch ctermbg=242 ctermfg=NONE
hi SignColumn ctermbg=none ctermfg=blue
hi GitGutterAdd ctermbg=none ctermfg=green
hi GitGutterRemove ctermbg=none ctermfg=red
hi GitGutterDelete ctermbg=none ctermfg=red
hi GitGutterChange ctermbg=none ctermfg=darkyellow

hi  CocHighlightText         ctermbg=0
hi  CocGitAddedSign          cterm=none  ctermbg=green   ctermfg=black
hi  CocGitChangeAddedSign    cterm=none  ctermbg=yellow  ctermfg=green
hi  CocGitChangeRemovedSign  cterm=none  ctermbg=yellow  ctermfg=red
hi  CocGitChangedSign        cterm=none  ctermbg=yellow  ctermfg=black
hi  CocGitRemovedSign        cterm=none  ctermbg=red     ctermfg=black
hi  CocGitTopRemovedSign     cterm=none  ctermbg=none    ctermfg=red

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

hi  DiffAdd      cterm=none      ctermbg=LightBlue
hi  DiffChange   cterm=none      ctermbg=LightMagenta
hi  DiffDelete   cterm=none      ctermfg=Blue          ctermbg=LightCyan
hi  DiffText     cterm=none      ctermbg=Red           cterm=bold
hi  Directory    cterm=none      ctermfg=DarkBlue
hi  ErrorMsg     cterm=none      ctermbg=none          ctermfg=red
hi  FoldColumn   cterm=none      ctermbg=Grey          ctermfg=DarkBlue
hi  Folded       cterm=none      ctermbg=8             ctermfg=blue
hi  ColorColumn  cterm=none      ctermbg=0             ctermfg=none
hi  IncSearch    cterm=none      cterm=reverse
hi  ModeMsg      cterm=none      cterm=bold
hi  MoreMsg      cterm=none      ctermfg=DarkGreen
hi  NonText      cterm=none      ctermbg=none          ctermfg=Blue
hi  Pmenu        cterm=none      ctermbg=black         ctermfg=white
hi  PmenuSel     cterm=none      ctermbg=blue          ctermfg=black
hi  Question     cterm=none      ctermbg=black         ctermfg=DarkGreen
hi  Todo         cterm=none      ctermbg=black         ctermfg=magenta
hi  MatchParen   ctermbg=black   ctermfg=blue          cterm=bold,underline
hi  Search       ctermbg=Yellow  ctermfg=Black

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
" hi  Keyword         cterm=none       ctermbg=none  ctermfg=red
hi  Keyword         cterm=none       ctermbg=none  ctermfg=magenta
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
hi link jsStorageClass Keyword
hi link jsFunction Keyword

" Weird stuff that's up while i'm away:
" hi  Delimiter       cterm=none       ctermbg=none  ctermfg=black

hi  TSTag           cterm=none  ctermbg=none  ctermfg=blue
hi  TSTagName       cterm=none  ctermbg=none  ctermfg=blue
hi  TSConstructor   cterm=none  ctermbg=none  ctermfg=red
hi  TSType          cterm=none  ctermbg=none  ctermfg=red
hi  TSKeyword       cterm=none  ctermbg=none  ctermfg=magenta
hi  TSProperty      cterm=none  ctermbg=none  ctermfg=blue
hi  TSField         cterm=none  ctermbg=none  ctermfg=blue
hi  TSArgument      cterm=none  ctermbg=none  ctermfg=yellow
hi  TSVariable      cterm=none  ctermbg=none  ctermfg=white
hi  TSConstBuiltin  cterm=none  ctermbg=none  ctermfg=darkyellow
hi  TSTypeBuiltin   cterm=none  ctermbg=none  ctermfg=yellow
