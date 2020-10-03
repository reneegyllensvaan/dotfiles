augroup SourceOnSave
  autocmd!
  autocmd <buffer> BufWritePost * source %
augroup END
