augroup quickfixOnMakeFinish
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
augroup END

function! make#infer(args, bang)
  if contexts#infer()
    exec b:makecmd
  end
endfunction
