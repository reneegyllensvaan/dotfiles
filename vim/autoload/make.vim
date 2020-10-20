augroup quickfixOnMakeFinish
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
augroup END

function! make#infer(foo, bar)
  echo 'foo: '.a:foo
  echo 'bar: '.a:bar
endfunction
