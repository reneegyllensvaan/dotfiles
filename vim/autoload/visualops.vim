function! visualops#surround_selection(seps, around)
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


