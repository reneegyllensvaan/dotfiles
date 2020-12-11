function! visualops#surround_selection(seps, around)
  call setpos('.', getpos("'<"))
  normal! mz
  call setpos('.', getpos("'>"))
  normal! mx
  let [startbufnum, startlnum, startcol, startoff] = getpos("'z")
  let [endbufnum, endlnum, endcol, endoff] = getpos("'x")
  exec "normal! \<Esc>`zi".(a:seps[0])
  if a:around
    normal! m<
  else
    normal! lm<
  end
  exec "normal! \<Esc>`x".(startlnum == endlnum ? 'l' : '')."a".(a:seps[1])
  if a:around
    normal! m>gv
  else
    normal! hm>gv
  end
endfunction

" function! visualops#surround(seps)
"   let s:seps = a:seps
"   function! OpFunc(foo)
"     normal! `[v`]
"     let [startbufnum, startlnum, startcol, startoff] = getpos("'[")
"     let [endbufnum, endlnum, endcol, endoff] = getpos("']")
"     exec "normal! \<Esc>`[i".(s:seps[0])
"     normal! m[
"     exec "normal! \<Esc>`]".(startlnum == endlnum ? 'l' : '')."a".(s:seps[1])
"     normal! m]
"   endfunction
"   set opfunc=OpFunc
" endfunction

function! visualops#surround(seps)
  let s:seps = a:seps
  function! OpFunc(foo)
    call setpos('.', getpos("'["))
    normal! mz
    call setpos('.', getpos("']"))
    normal! mx
    exec "normal! `xa".s:seps[1]."\<Esc>`zi".s:seps[0]."\<Esc>"
  endfunction
  set opfunc=OpFunc
endfunction

function! visualops#break_lines()
  let l:col = col('.')
  let l:bufnr = bufnr()
  for x in range(line("'>"), line("'<"), -1)
    let l:line = getline(x)
    if len(l:line) > l:col
      call setpos('.', [l:bufnr, x, l:col, 0])
      exec "normal! i\<CR>\<Esc>"
    endif
  endfor
endfunction


"  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu elit eu nisi
"  rutrum tincidua et ac tortor. Quisque laoreet feugiat arcu, tincidunt porttitor risus
"  efficitur ut. Phasellus ac justo gravida, posuere metus nec, luctus mi. Aenean
"  sollicitudin, ante nec volutpat elementum, justo nisl laoreet nunc, id vestibulum
"  tortor neque et augue. Donec posuere, sapien sed varius lacinia, erat ligula cursus
"  sem, eu finibus justo nunc consequat magna. Ut vulputate urna a leo sodales tristique.
"  Cras consequat ipsum pulvinar risus lacinia, et venenatis massa pretium. Suspendisse
"  commodo augue justo. Nulla ipsum ligula, posuere sit amet semper sit amet, venenatis
"  quis dui. Etiam risus odio, aliquet quis leo ut, rutrum mollis elit. Mauris nec dapibus
"  sapien, sed efficitur ligula. Aenean dolor justo, eleifend vel erat fermentum, porta
"  vehicula mauris.
