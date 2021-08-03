" vim: fdm=marker ft=sourceonsave.vim
let g:rg_opts = '--smart-case'
command! FzfProjectFiles call skim#run({'source': 'git ls-files-root', 'sink': 'e', 'down': '30%'})
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* RgFromCurrentFile Rg exec "Rg ".expand('%:h')
command! -nargs=* Fd call skim#run({'source': "fd <args>", 'sink': 'e', 'down': '30%'})

command! -nargs=* FzyGrep call fzy#in_buffer("rg <args> \| cut -c -250", ':echo ', "-q : \| grep -Eo '^[^:]'")

command! -nargs=1 Chmod call fileutils#chmod(expand('%'), <q-args>) command! -nargs=* Ls echo system('ls --color=always <args>')

let g:gist_urls = []
function! s:PublishGist()
  redir! > ~/.tmp/vim-gist-urls
  silent write !hub gist create
  redir END
  let l:url = readfile(glob('~/.tmp/vim-gist-urls'))
  call add(g:gist_urls, l:url)
  echo "Created new gist: " . l:url[2]
endfunction
command! Gist call <SID>PublishGist()

command! -bang YankFileNameAbsolute call fileutils#yank_path("+",'%:p', "<bang>")
command! -bang YankFileNameHomedir call fileutils#yank_path("+",'%:p:~', "<bang>")
command! -bang YankFileNameRelative call fileutils#yank_path("+",'%', "<bang>")
command! -bang YankFileName execute "silent ".["","YankFileNameAbsolute","YankFileNameHomedir","YankFileNameRelative"]
      \[confirm('YankFileName', "&Absolute\n&Homedir\n&Relative")]."<bang>"

let g:term_should_startinsert = 0
command! -bang -nargs=* PushTermStartInsert let g:term_should_startinsert = 1
function! PopTermStartInsert()
  if g:term_should_startinsert
    startinsert
  endif
  let g:term_should_startinsert = 0
endfunction
augroup term-pop-startinsert
  autocmd!
  autocmd BufEnter * if &buftype=="terminal" | call PopTermStartInsert() | endif
augroup END

command! -bang -nargs=* Term call term#run(<q-mods>, <q-args>, getcwd(), <q-bang>)
command! -bang -nargs=* SingletonTerm call term#singleton_run(<q-mods>, <q-args>, getcwd(), <q-bang>)
command! -bang -nargs=* SingletonShell call term#singleton_shell(<q-mods>, <q-args>, getcwd())

command! -bang -nargs=* Make call make#infer(<q-args>, <q-bang>)

function! ResetLayerFlags()
  let g:myhooks_ctrl_a_layer = 0
endfunction

function! ProcessInsertLeaveEvents()
  call ResetLayerFlags()
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

  autocmd InsertLeave * call ProcessInsertLeaveEvents()
augroup END

let g:center_cursor_disabled_scrolloff = 4
let g:cached_scrolloff = &so
function! ToggleCenterCursor()
  if &so == 999
    exec 'set so=' . g:center_cursor_disabled_scrolloff
    let g:center_cursor_disabled_scrolloff = &so
  else
    set so=999
  end
  let g:cached_scrolloff = &so
endfunction
if has('nvim')
  augroup center-cursor-settings
    autocmd!
    au TermEnter * set so=0
    au TermLeave * exec "set so=".g:cached_scrolloff
  augroup END
endif

augroup tabclose-left
  autocmd!
  autocmd TabClosed * if expand('<afile>') == tabpagenr() | tabprevious | end
augroup END

augroup clean-noname-buffers
  autocmd!
  " autocmd BufHidden * if (empty(bufname(str2nr(expand('<abuf>'))))) | exec "bd! ".expand("<abuf>") | end
augroup END

function! GitBlameLine()
  return system("git blame ".expand('%')." -L ".getpos('.')[1].",".getpos('.')[1])
endfunction

function! GitBlameLineFull()
  let l:blame = GitBlameLine()
  let l:msg = l:blame

  if l:blame !~# '^[0-9a-f]\{9\} '
    return l:msg
  endif
  let l:hash = l:blame[:8]

  return system("git show --no-patch ".l:hash)
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

function! s:checktime(timer_id)
  checktime
endfunction
if exists('g:autoread_timer_id')
  let g:autoread_timer_id = timer_start(1000, function('s:checktime'), {'repeat': -1})
endif

augroup quickfixOnMakeFinish
  autocmd!
  autocmd QuickFixCmdPost [^l]* botright cwindow
augroup END

function! s:WipeUnattachedBuffers()
  let l:limit = bufnr("$")
  for l:i in range(1, l:limit)
    if bufnr(l:i) > 0
      if win_findbuf(l:i) == []
        exec (l:i)."bw"
      endif
    endif
  endfor
endfunction

command! WipeUnattachedBuffers call <SID>WipeUnattachedBuffers()
command! BWU WipeUnattachedBuffers

command! -bang GitDiff execute "Term! git diff ".["\<C-u>","--staged", ""]
      \[confirm('git diff', "&staged\n&worktree\n")]

command! FzyFindFile call fzy#in_buffer("fd . --type f", ":e ", "")
command! FzyFindFileWindow call fzy#in_buffer("fd . --type f", ":<mods> sp ", "")
