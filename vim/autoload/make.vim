function! make#infer(args, bang)
  if contexts#infer()
    exec b:makecmd
  end
endfunction
