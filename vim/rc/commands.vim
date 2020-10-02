let g:rg_opts = '--smart-case'
command! FzfProjectFiles call skim#run({'source': 'git ls-files-root', 'sink': 'e', 'down': '30%'})
command! -bang -nargs=* RgInteractive call fzf#vim#rg_interactive(<q-args>)
" call fzf#vim#grep_interactive("sh -c \'rg --column --line-number --color=always \"{}\" . \| head -n 10'", 1)
command! RgSkim call fzf#vim#rg_interactive("", fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
" FIXME: be able to provide an argument
command! -nargs=* Fd call skim#run({'source': "fd <args>", 'sink': 'e', 'down': '30%'})

command! -nargs=* FzyGrep call FzyCommandInBuffer("rg <args> \| cut -c -250", ':echo ', '')
nnoremap <Space>? :FzyGrep

function! LoadCoc()
  " call EnsureLoaded('coc')
  " runtime plugin/coc.vim
  packadd coc
  execute 'CocEnable'
  if !exists("g:coc_is_sourced")
    let g:coc_is_sourced = 1
    execute 'source' "~/.vim/rc/coc.vim"
    if has('gui_running')
      execute 'CocStart'
    endif
  endif
endfunction

function! ToggleSyntax()
  if !exists("g:syntax_on") || !g:syntax_on
    syntax on
  else
    syntax off
  endif
endfunction

let g:center_cursor_disabled_scrolloff = 4
function! ToggleCenterCursor()
  if &so == 999
    exec 'set so=' . g:center_cursor_disabled_scrolloff
    let g:center_cursor_disabled_scrolloff = &so
  else
    set so=999
  end
endfunction

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

function! GitBlameLine()
  echo system("git blame ".expand('%')." -L ".getpos('.')[1].",".getpos('.')[1])
endfunction

let g:loaded_gitgutter = 0
function! ToggleGitGutter()
  packadd gitgutter
  exec "GitGutterToggle"
endfunction

function! DrillWindowOrTab(b)
  if a:b
    if winnr() == 1
      normal! gT
      $wincmd w
    else
      exec (winnr()-1)."wincmd w"
    end
  else
    if winnr() == winnr('$')
      normal! gt
      1wincmd w
    else
      exec (winnr()+1)."wincmd w"
    end
  end
endfunction

function! NextWindowOrTab(b)
  let prev_number = winnr()
  if a:b
    exec "normal! \<C-w>h"
    if winnr() == prev_number
      " normal! gT
      exec "normal! gT\<C-w>l\<C-w>l\<C-w>l"
    endif
  else
    exec "normal! \<C-w>l"
    if winnr() == prev_number
      " normal! gt
      exec "normal! gt\<C-w>h\<C-w>h\<C-w>h"
    endif
  end
endfunction
