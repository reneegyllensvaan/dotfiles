nnoremap <Space>vh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
syntax on
set t_Co=16

hi Pmenu ctermbg=16
hi CocHighlightText ctermbg=0
hi SnipeMatch ctermbg=242 ctermfg=NONE
hi CursorLine cterm=none ctermbg=236

hi StatusLineNC cterm=none ctermbg=black ctermfg=none
hi User1 ctermbg=0 ctermfg=white
hi User2 ctermbg=green ctermfg=black
hi User3 ctermbg=black ctermfg=white
hi User5 ctermbg=gray ctermfg=black
hi TabLineFill cterm=none ctermbg=black ctermfg=white
hi TabLineSel cterm=bold ctermbg=black ctermfg=white
hi TabLine cterm=none ctermbg=black ctermfg=gray

hi DiffAdd      ctermbg=LightBlue
hi DiffChange   ctermbg=LightMagenta
hi DiffDelete   ctermfg=Blue ctermbg=LightCyan
hi DiffText     ctermbg=Red cterm=bold
hi Directory    ctermfg=DarkBlue
hi ErrorMsg     ctermfg=White ctermbg=DarkRed
hi FoldColumn   ctermfg=DarkBlue ctermbg=Grey
hi Folded       ctermbg=Grey ctermfg=DarkBlue
hi IncSearch    cterm=reverse
hi CursorLineNr ctermfg=white
hi LineNr       ctermfg=gray
hi ModeMsg      cterm=bold
hi MoreMsg      ctermfg=DarkGreen
hi NonText      ctermfg=Blue
hi PmenuSel     ctermfg=White ctermbg=DarkBlue
hi Question     ctermfg=DarkGreen ctermbg=black
hi Todo   cterm=bold,underline ctermfg=magenta ctermbg=black
hi MatchParen cterm=bold,underline ctermfg=blue ctermbg=black
hi Search     ctermfg=Black ctermbg=Yellow

hi SpecialKey ctermfg=DarkBlue
hi Title      ctermfg=blue
hi VertSplit  cterm=reverse
hi Visual     ctermbg=59 ctermfg=NONE
hi VisualNOS  cterm=underline,bold
hi WarningMsg ctermfg=DarkRed
hi WildMenu   cterm=NONE ctermfg=black ctermbg=blue
hi StatusLine cterm=NONE ctermfg=white ctermbg=NONE

" Syntax Highlighting:
hi Comment    cterm=NONE ctermfg=gray
hi Constant   cterm=NONE ctermfg=DarkGreen
hi Identifier cterm=NONE ctermfg=red
hi Function   cterm=NONE ctermfg=blue
hi PreProc    cterm=NONE ctermfg=yellow
hi Special    cterm=NONE ctermfg=white
hi Statement  ctermfg=magenta
hi Type cterm=NONE ctermfg=yellow

hi link String Constant
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Number
hi link Conditional Repeat
hi link Label Statement
hi link Keyword Statement
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
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special

" Special Cases:
hi mkdLink ctermfg=white ctermbg=none
hi mkdDelimiter ctermfg=magenta ctermbg=none
