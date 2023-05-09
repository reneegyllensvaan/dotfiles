augroup kitty-auto-source
  autocmd!
  autocmd BufWritePost <buffer> silent !kill -SIGUSR1 $KITTY_PID
augroup END
