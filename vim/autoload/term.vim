if empty(v:servername)
  call remote_startserver('vim-'.rand())
endif
if has('gui_macvim') && has('gui_running')
  let $MACVIM_RUNNING = "yes"
end
let $PYTHONUNBUFFERED = 1
let $EDITOR = "host-vim"
let $VISUAL = $EDITOR
let $GIT_EDITOR = "host-vim-wait"

function! term#singleton_run(mods, cmd, dir, bang)
  let l:term_name = '!!'.a:cmd
  let l:cmd = a:cmd
  if bufexists(l:term_name)
    exec "bd! ".bufnr(l:term_name)
  endif
  if a:bang == '!'
    let l:cmd = "zsh -c '".l:cmd."'"
  endif
  exec a:mods." call term_start(\"".l:cmd."\", {'term_name': '".
        \l:term_name."', 'cwd': '".a:dir."', 'term_finish': 'close'})"
  setlocal bufhidden=hide nobuflisted
endfunction

function! term#singleton_shell(mods, cmd, dir)
  if bufexists('scratchterm')
    exec a:mods." sb ".bufnr('scratchterm')
    return
  endif
  exec a:mods." call term_start('zsh', {'term_name': 'scratchterm', 'cwd': '".a:dir."', 'term_finish': 'close'})"
  setlocal bufhidden=hide nobuflisted
  nnoremap <buffer> <C-s> <C-w>c
  tnoremap <buffer> <C-s> <C-w>c
  autocmd BufEnter <buffer> startinsert
  startinsert
endfunction

function! term#run(mods, cmd, dir, bang)
  " if bufexists('scratchterm')
  "   exec a:mods." sb ".bufnr('scratchterm')
  "   return
  " endif
  exec a:mods." call term_start('".(empty(a:cmd) ? 'zsh' : a:cmd)
        \."', {'term_name': '".(empty(a:cmd) ? '!zsh'.rand() : a:cmd)
        \."', 'cwd': '".a:dir."'".
        \.(a:bang == '!' ? '' : ", 'term_finish': 'close'")."})"
  setlocal bufhidden=hide nobuflisted
endfunction
