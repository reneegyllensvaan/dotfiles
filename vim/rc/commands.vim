" vim: fdm=marker ft=sourceonsave.vim
let g:rg_opts = '--smart-case'
command! FzfProjectFiles call skim#run({'source': 'git ls-files-root', 'sink': 'e', 'down': '30%'})
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -nargs=* Fd call skim#run({'source': "fd <args>", 'sink': 'e', 'down': '30%'})

command! -nargs=* FzyGrep call fzy#in_buffer("rg <args> \| cut -c -250", ':echo ', "-q : \| grep -Eo '^[^:]'")

command! -nargs=1 Chmod call fileutils#chmod(expand('%'), <q-args>)

command! -bang YankFileNameAbsolute call fileutils#yank_path("+",'%:p', "<bang>")
command! -bang YankFileNameHomedir call fileutils#yank_path("+",'%:p:~', "<bang>")
command! -bang YankFileNameRelative call fileutils#yank_path("+",'%', "<bang>")
command! -bang YankFileName execute "silent ".["","YankFileNameAbsolute","YankFileNameHomedir","YankFileNameRelative"]
      \[confirm('YankFileName', "&Absolute\n&Homedir\n&Relative")]."<bang>"

command! -bang -nargs=* Term call term#run(<q-mods>, <q-args>, getcwd(), <q-bang>)
command! -bang -nargs=* SingletonTerm call term#singleton_run(<q-mods>, <q-args>, getcwd(), <q-bang>)
command! -bang -nargs=* SingletonShell call term#singleton_shell(<q-mods>, <q-args>, getcwd())

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

