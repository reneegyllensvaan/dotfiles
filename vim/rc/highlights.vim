" vim: fdm=marker ft=sourceonsave.vim
nnoremap <Space>vh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
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

hi StatusLineNC cterm=none ctermbg=black ctermfg=none
hi StatusLineTerm cterm=none ctermbg=black ctermfg=none
hi User1 ctermbg=0 ctermfg=white
hi User2 ctermbg=green ctermfg=black
hi User3 ctermbg=black ctermfg=white
hi User5 ctermbg=gray ctermfg=black

hi StatusLineNormal   ctermbg=green      ctermfg=black
hi StatusLineInsert   ctermbg=blue       ctermfg=black
hi StatusLineVisual   ctermbg=magenta    ctermfg=black
hi StatusLineReplace  ctermbg=red        ctermfg=black
hi StatusLineDisabled ctermbg=white      ctermfg=black
" function! StatuslineColor(mode)
"   if a:mode[0] == '\%6N'
"     hi User2 ctermbg=green
"   elseif a:mode[0] == 'I'
"     hi User2 ctermbg=blue
"   elseif a:mode[0] == 'V'
"     hi User2 ctermbg=magenta
"   elseif a:mode[0] == 'R'
"     hi User2 ctermbg=red
"   end
"   return a:mode
" endfunction
hi TabLineFill cterm=none ctermbg=black ctermfg=white
hi TabLineSel  cterm=bold ctermbg=black ctermfg=white
hi TabLine     cterm=none ctermbg=black ctermfg=gray

hi DiffAdd      ctermbg=LightBlue
hi DiffChange   ctermbg=LightMagenta
hi DiffDelete   ctermfg=Blue ctermbg=LightCyan
hi DiffText     ctermbg=Red cterm=bold
hi Directory    ctermfg=DarkBlue
hi ErrorMsg     ctermbg=DarkRed ctermfg=White
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
hi Todo         ctermbg=black  ctermfg=magenta   cterm=bold,underline
hi MatchParen   ctermbg=black  ctermfg=blue      cterm=bold,underline
hi Search       ctermbg=Yellow ctermfg=Black

hi SpecialKey ctermfg=DarkBlue
hi Title      ctermfg=blue
hi VertSplit  cterm=none ctermbg=none ctermfg=darkgray
hi Visual     cterm=reverse ctermbg=none ctermfg=none
hi VisualNOS  cterm=underline,bold
hi WarningMsg ctermfg=DarkRed
hi WildMenu   cterm=none ctermfg=black ctermbg=blue
hi StatusLine cterm=none ctermfg=white ctermbg=NONE

" Syntax Highlighting
hi Comment    cterm=none ctermbg=none ctermfg=8
hi Constant   cterm=none ctermbg=none ctermfg=cyan
hi Identifier cterm=none ctermbg=none ctermfg=red
hi Function   cterm=none ctermbg=none ctermfg=blue
hi PreProc    cterm=none ctermbg=none ctermfg=yellow
hi Special    cterm=none ctermbg=none ctermfg=blue
hi Statement  cterm=none ctermbg=none ctermfg=magenta
hi Type       cterm=none ctermbg=none ctermfg=yellow
hi Number     cterm=none ctermbg=none ctermfg=darkyellow
hi String     cterm=none ctermbg=none ctermfg=green
hi Keyword    cterm=none ctermbg=none ctermfg=red
hi Boolean    cterm=none ctermbg=none ctermfg=darkyellow

" Links {{{
hi link Character Constant
hi link Label Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi link SpecialChar Special
hi Delimiter cterm=none ctermbg=none ctermfg=white
hi link SpecialComment Special
hi link Debug Special
" hi link vimIsCommand Statement

hi link Float Number

hi link Conditional Repeat
" Links }}}

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
" hi link typescriptDOMFormProp Keyword
