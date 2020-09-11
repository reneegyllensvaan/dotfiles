hi Pmenu ctermbg=16
hi Search ctermbg=11 ctermfg=black
hi Visual ctermbg=238 ctermfg=NONE
hi CocHighlightText ctermbg=0

"" statusline
hi User1 ctermbg=darkgray ctermfg=white guibg=#98C379 guifg=grey
hi User2 ctermbg=green ctermfg=black guibg=#C678DD guifg=black
hi User3 ctermbg=darkgray ctermfg=lightgreen guibg=#ffffff guifg=lightgreen

" " This is the prettier version of the statusline below
" set laststatus=2
" set statusline=                          " left align
" set statusline+=%2*\ %{StatuslineMode()}
" set statusline+=\ %1*\ %f                  " short filename
" set statusline+=%=                       " right align
" set statusline+=%*
" set statusline+=%3*\%h%m%r               " file flags (help, read-only, modified)
" set statusline+=%3*\%.25F                " long filename (trimmed to 25 chars)
" set statusline+=%3*\::
" set statusline+=%3*\%l/%L\\|             " line count
" set statusline+=%3*\%y                   " file type

function! ActiveStatusLine()
  if has('g:coc_enabled')
    setlocal statusline=%2*\ %{StatuslineMode()}\ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y%{coc#status()}%{get(b:,'coc_current_function','')}
  else
    setlocal statusline=%2*\ %{StatuslineMode()}\ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y
  end
endfunction
function! InactiveStatusLine()
  setlocal statusline=%5*\ \ \ \ \ \ \ \ %1*\ %t%=%*%3*\%h%m%r%3*%3*\%c:%3*\%l/%L\\|%3*\%y
endfunction

augroup statusline-toggler
    autocmd!
    autocmd WinEnter * :call ActiveStatusLine()
    autocmd WinLeave * :call InactiveStatusLine()
augroup END

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

hi User5 ctermbg=3 ctermfg=black guibg=#ADC39D guifg=black
"" statusline
function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        hi User2 ctermbg=green ctermfg=black guibg=#98C379 guifg=black
        return "NORMAL"
    elseif l:mode==?"v"
        hi User2 ctermbg=magenta ctermfg=black guibg=#C678DD guifg=black
        return "VISUAL"
    elseif l:mode==#"i"
        hi User2 ctermbg=cyan ctermfg=black guibg=#56B6C2 guifg=black
        return "INSERT"
    elseif l:mode==#"R"
        hi User2 ctermbg=red ctermfg=black guibg=#E06C75 guifg=black
        return "REPLACE"
    endif
endfunction

"hi CursorLine cterm=NONE ctermbg=238
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

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
nnoremap <silent> <Leader>tf :call ToggleVExplorer()<CR>
let g:netrw_fastbrowse = 0
autocmd FileType netrw setl bufhidden=wipe

