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
    let l:cmd = $SHELL" -c '".l:cmd."'"
  endif
  if has('nvim')
    exec a:mods." new"
    call termopen(l:cmd, {'cwd': a:dir})
    exec "file ".l:term_name
  else
    exec a:mods." call term_start(\"".l:cmd."\", {'term_name': '".
          \l:term_name."', 'cwd': '".a:dir."', 'term_finish': 'close'})"
  endif
  setlocal bufhidden=wipe nobuflisted nonumber
  if has('nvim')
    exec "autocmd TermClose <buffer> bd! ".bufnr()
  end
  startinsert
endfunction

function! term#singleton_shell(mods, cmd, dir) abort
  if bufexists('scratchterm')
    exec a:mods." sb ".bufnr('scratchterm')
    return
  endif
  if has('nvim')
    exec a:mods." new"
    call termopen($SHELL, {})
    file scratchterm
  else
    exec a:mods." call term_start('".($SHELL)."', {'term_name': 'scratchterm', 'cwd': '".a:dir."', 'term_finish': 'close'})"
  endif
  setlocal bufhidden=wipe nobuflisted nonumber
  nnoremap <buffer> <C-s> <C-w>c
  tnoremap <buffer> <C-s> <C-w>c
  nnoremap <buffer> <C-Space> <C-w>c
  tnoremap <buffer> <C-Space> <C-w>c
  nnoremap <buffer> <C-@> <C-w>c
  tnoremap <buffer> <C-@> <C-w>c
  autocmd BufEnter <buffer> startinsert
  if has('nvim')
    autocmd TermClose <buffer> bw!
    tnoremap <buffer> <C-s> <C-\><C-n><C-w>c
    nnoremap <buffer> <C-Space> <C-\><C-n><C-w>c
    tnoremap <buffer> <C-Space> <C-\><C-n><C-w>c
    nnoremap <buffer> <C-@> <C-\><C-n><C-w>c
    tnoremap <buffer> <C-@> <C-\><C-n><C-w>c
  end
  startinsert
endfunction

if !exists('g:term_auto_increment')
  let g:term_auto_increment = 0
end
function! term#run(mods, cmd, dir, bang)
  let l:cmd = $SHELL." -c '".a:cmd."'"
  if has('nvim')
    exec a:mods." new"
    call termopen(l:cmd, {})
    exec "file ".cmd."-".g:term_auto_increment
  else
    exec a:mods
          \." call term_start('".l:cmd
          \."', {'term_name': '"
          \.(cmd."-".g:term_auto_increment)
          \."', 'cwd': '".a:dir
          \."', 'term_finish': 'close'})"
  endif
  let g:term_auto_increment += 1
  let l:bufnr = bufnr()
  setlocal nonumber
  nnoremap <buffer> <C-s> <C-w>c
  tnoremap <buffer> <C-s> <C-w>c
  autocmd BufEnter <buffer> startinsert!
  if has('nvim')
    exec "autocmd TermClose <buffer> bw! ".l:bufnr
  end
  startinsert
endfunction

