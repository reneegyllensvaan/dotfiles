function! term#singleton_run(mods, cmd, dir)
  let l:term_name = '!!'.a:cmd
  if bufexists(l:term_name)
    exec "bd! ".bufnr(l:term_name)
  endif
  exec a:mods." call term_start(a:cmd, {'term_name': '".
        \l:term_name."', 'cwd': '".a:dir."', 'term_finish': 'close'})"
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
