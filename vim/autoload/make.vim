function! make#infer(args, bang)
  if contexts#infer()
    packadd neomake
    let &makeprg = &l:makeprg
    exec b:makecmd
  end
endfunction
