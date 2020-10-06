let g:rg_opts = '--smart-case'
command! FzfProjectFiles call skim#run({'source': 'git ls-files-root', 'sink': 'e', 'down': '30%'})
" FIXME: be able to provide an argument
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -nargs=* Fd call skim#run({'source': "fd <args>", 'sink': 'e', 'down': '30%'})

command! -nargs=* FzyGrep call FzyCommandInBuffer("rg <args> \| cut -c -250", ':echo ', "-q : \| grep -Eo '^[^:]'")

command! -nargs=* Chmod call myfns#chmod(expand('%'), <q-args>)
command! -bang YankFileNameAbsolute call setreg("+", expand('%:p').((expand("<bang>") != "!") ? (":".line('.')) : ""))
command! -bang YankFileNameHomedir call setreg("+", expand('%:p:~').((expand("<bang>") != "!") ? (":".line('.')) : ""))
command! -bang YankFileNameRelative call setreg("+", expand('%').((expand("<bang>") != "!") ? (":".line('.')) : ""))
command! -bang YankFileName exec (["","YankFileNameAbsolute","YankFileNameHomedir","YankFileNameRelative"][confirm('YankFileName', "&Absolute\n&Homedir\n&Relative")].expand("<bang>"))

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

augroup myhooks
  autocmd!
  " This isn't really used for anything in my vim config currently, I'm just
  " logging all files so i can experiment with a 'recent files' type of scoring
  " for fuzzy matchers.
  autocmd BufReadPost * :call writefile([localtime().";".getcwd().";".expand("%:p")],
        \glob("~/.vim/files/recent.log"), "a")
  autocmd BufWritePost * :call writefile([localtime().";".getcwd().";".expand("%:p")],
        \glob("~/.vim/files/recent-write.log"), "a")
augroup END

let g:center_cursor_disabled_scrolloff = 4
function! ToggleCenterCursor()
  if &so == 999
    exec 'set so=' . g:center_cursor_disabled_scrolloff
    let g:center_cursor_disabled_scrolloff = &so
  else
    set so=999
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

