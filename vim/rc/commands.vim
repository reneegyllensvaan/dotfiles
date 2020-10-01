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

let g:cursorline_enabled = 0
function! ToggleCursorLine()
  let g:cursorline_enabled = !g:cursorline_enabled
  if g:cursorline_enabled
    setlocal cursorline
  else
    setlocal nocursorline
  end
endfunction
