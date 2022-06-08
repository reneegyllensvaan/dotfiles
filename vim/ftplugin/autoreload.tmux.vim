augroup source-on-save
  autocmd!
  autocmd BufWritePost <buffer> !source-file ~/.tmux.conf \; display-message "tmux.conf reloaded."
augroup END
