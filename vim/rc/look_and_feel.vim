" vim: fdm=marker ft=sourceonsave.vim


if has('gui_running')
  packadd onedark
  colorscheme onedark
  syntax on

  hi Pmenu ctermbg=16
  hi Search ctermbg=11 ctermfg=black
  hi Visual ctermbg=238 ctermfg=NONE
  hi CocHighlightText ctermbg=0
  hi SnipeMatch guibg=#365A6F guifg=NONE

  hi User1 guibg=#22252b
  hi User2 guibg=#98C379 guifg=black
  hi User3 guibg=#22252b
  hi StatusLineNormal    guibg=#98C379 guifg=black
  hi StatusLineInsert    guibg=#56B6C2 guifg=black
  hi StatusLineVisual    guibg=#C678DD guifg=black
  hi StatusLineReplace   guibg=#E06C75 guifg=black
  hi StatusLineDisabled  guibg=#6F6F6F guifg=black
endif

if 0
  " Emit cursor shape control chars
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
endif

"" statusline {{{
let g:mode_map = {'n': "NORMAL", 'i': 'INSERT', 'v': 'VISUAL', 'r': 'REPLACE'}
let g:statusline_active = join([
      \"%#StatusLineNormal#%{(mode()=='n') ? '  NORMAL ' : ''}",
      \"%#StatusLineInsert#%{(mode()=='i') ? '  INSERT ' : ''}",
      \"%#StatusLineVisual#%{(mode()=='v'||mode()=='\<C-v>') ? '  VISUAL ' : ''}",
      \"%#StatusLineReplace#%{(mode()=='r') ? '  REPLACE ' : ''}",
      \'%1* %t%=%*%3*%h%m%r%3*%3*%c:%3*%l/%L\|%3*%y'], '')
let g:statusline_disabled = join([
      \"%#StatusLineDisabled#%{'         '}",
      \'%1* %t%=%*%3*%h%m%r%3*%3*%c:%3*%l/%L\|%3*%y'], '')
let &statusline = g:statusline_disabled
" set statusline='\ %{StatuslineColor(get(g:mode_map,tolower(mode()),'n'))}\ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y'
" set statusline=%2*\ %{StatuslineColor(get(g:mode_map,tolower(mode()),'n'))}\ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y

function! ActiveStatusLine()
  if has('g:coc_enabled')
    let &l:statusline=g:statusline_active
  else
    let &l:statusline=g:statusline_active
  end
endfunction
function! InactiveStatusLine()
    let &statusline=g:statusline_disabled
endfunction
augroup statusline-toggler
  autocmd!
  autocmd WinEnter * call ActiveStatusLine()
  autocmd WinLeave * call InactiveStatusLine()
augroup END

"" statusline }}}

" cursorline {{{
let g:cursorline_enabled = &cursorline
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
" netrw }}}

