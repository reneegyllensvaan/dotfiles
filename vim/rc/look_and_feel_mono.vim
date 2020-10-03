" vim: fdm=marker

let g:onedark_color_overrides = {
      \ "red": {            "gui": "#ABB2BF", "cterm": "204",  "cterm16": "1" },
      \ "dark_red": {       "gui": "#ABB2BF", "cterm": "196",  "cterm16": "9" },
      \ "green": {          "gui": "#ABB2BF", "cterm": "114",  "cterm16": "2" },
      \ "yellow": {         "gui": "#ABB2BF", "cterm": "180",  "cterm16": "3" },
      \ "dark_yellow": {    "gui": "#ABB2BF", "cterm": "173",  "cterm16": "11" },
      \ "blue": {           "gui": "#ABB2BF", "cterm": "39",   "cterm16": "4" },
      \ "purple": {         "gui": "#ABB2BF", "cterm": "170",  "cterm16": "5" },
      \ "cyan": {           "gui": "#ABB2BF", "cterm": "38",   "cterm16": "6" },
      \ "white": {          "gui": "#ABB2BF", "cterm": "145",  "cterm16": "7" },
      \ "black": {          "gui": "#282C34", "cterm": "235",  "cterm16": "0" },
      \ "visual_black": {   "gui": "NONE",    "cterm": "NONE", "cterm16": "0" },
      \ "comment_grey": {   "gui": "#5C6370", "cterm": "59",   "cterm16": "15" },
      \ "gutter_fg_grey": { "gui": "#4B5263", "cterm": "238",  "cterm16": "15" },
      \ "cursor_grey": {    "gui": "#2C323C", "cterm": "236",  "cterm16": "8" },
      \ "visual_grey": {    "gui": "#3E4452", "cterm": "237",  "cterm16": "15" },
      \ "menu_grey": {      "gui": "#3E4452", "cterm": "237",  "cterm16": "8" },
      \ "special_grey": {   "gui": "#3B4048", "cterm": "238",  "cterm16": "15" },
      \ "vertsplit": {      "gui": "#181A1F", "cterm": "59",   "cterm16": "15" },
      \}

if has('gui_running')
  packadd onedark
  colorscheme onedark
end

hi Pmenu ctermbg=16
hi Search ctermbg=11 ctermfg=black
hi Visual ctermbg=238 ctermfg=NONE
hi CocHighlightText ctermbg=0
hi SnipeMatch ctermbg=cyan ctermfg=black guibg=#365A6F

if 0
  " Emit cursor shape control chars
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
endif

"" statusline {{{
hi User1 ctermbg=darkgray ctermfg=white guibg=#22252b
hi User2 ctermbg=green ctermfg=black guibg=#ABB2BF guifg=black
hi User3 ctermbg=darkgray ctermfg=lightgreen guibg=#22252b
hi User5 ctermbg=3 ctermfg=black guibg=#22252b guifg=black

set statusline=%5*\ \ \ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y
function! ActiveStatusLine()
  setlocal statusline=%2*\ %{toupper(mode())}\ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y
endfunction
function! InactiveStatusLine()
  setlocal statusline=%5*\ \ \ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y
endfunction

augroup statusline-toggler
  autocmd!
  autocmd WinEnter * :call ActiveStatusLine()
  autocmd WinLeave * :call InactiveStatusLine()
augroup END

function! StatuslineMode()
  let l:mode=mode()
  return l:ret
endfunction
"" statusline }}}

" cursorline {{{
" TODO: Set up non-terrible-looking cursorline on console
let g:cursorline_enabled = has('gui_running')
function! ToggleCursorLine()
  let g:cursorline_enabled = !g:cursorline_enabled
  if g:cursorline_enabled
    setlocal cursorline
  else
    setlocal nocursorline
  end
endfunction

function! MaybeEnableCursorline()
  if g:cursorline_enabled
    setlocal cursorline
  end
endfunction

augroup cursorline-toggler
  autocmd!
  autocmd WinEnter * :call MaybeEnableCursorline()
  autocmd WinLeave * :setlocal nocursorline
augroup END
" cursorline }}}

" netrw {{{
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide.=',\.(pyc)$'

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction

let g:netrw_winsize = -28
let g:netrw_fastbrowse = 0
autocmd FileType netrw setl bufhidden=wipe
" netrw }}}
