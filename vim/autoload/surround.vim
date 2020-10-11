function! surround#selection(seps, around)
  let [startbufnum, startlnum, startcol, startoff] = getpos("'<")
  let [endbufnum, endlnum, endcol, endoff] = getpos("'>")
  exec "normal! \<Esc>`<i".(a:seps[0])
  if a:around
    normal! m<
  else
    normal! lm<
  end
  exec "normal! \<Esc>`>".(startlnum == endlnum ? 'l' : '')."a".(a:seps[1])
  if a:around
    normal! m>gv
  else
    normal! hm>gv
  end
endfunction


