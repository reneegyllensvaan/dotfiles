packadd parinfer
nnoremap <buffer> <M-%> va(
vnoremap <buffer> <M-%> a(

function! s:ListString(v)
  return "[".a:v[0].", ".a:v[1]."]"
endfunction

function! s:IsBefore(a, b)
  echo "Compare: ".s:ListString(a:a).", ".s:ListString(a:b)
  return a:a[0] < a:b[0] || (a:a[0] == a:b[0] && a:a[1] < a:b[1])
endfunction

function! s:SmallerRegion(a, b)
  if a:a == [] && a:b == []
    return []
  elseif a:a == []
    return a:b
  elseif a:b == []
    return a:a
  elseif s:IsBefore(a:a[1][0], a:b[1][0])
    return a:a
  elseif s:IsBefore(a:b[1][0], a:a[1][0])
    return a:b
  elseif s:IsBefore(a:b[1][1], a:a[1][1])
    return a:b
  elseif s:IsBefore(a:b[1][0], a:a[1][1])
    return a:a
  else
    throw "Invalid comparison: ".s:ListString(a:a)." vs ".s:ListString(a:b)
  endif
endfunction

function! s:SelectAroundDelimiter()
  let l:block = []
  let l:cursor = getpos(".")
  for l:delim in ['[', '(', '{']
    exec "normal! va".l:delim
    let l:start = getpos("'<")[1:2]
    let l:end = getpos("'>")[1:2]

    if l:start == [0,0] || l:end == [0,0]
      echo "No block found: ".s:ListString(l:start).', '.s:ListString(l:end)
      continue
    endif

    if s:IsBefore(l:end, l:cursor[1:2]) || s:IsBefore(l:cursor[1:2], l:start)
      echo "Disjoint block: ".s:ListString(l:start).', '.s:ListString(l:end)
      continue
    endif

    let l:block = s:SmallerRegion(l:block, [delim, [l:start, l:end]])
    echo "Found potential block: ".s:ListString(l:start).', '.s:ListString(l:end)
  endfor
  echo "Found block '".l:block[0]."': ".s:ListString(l:block[1][0]).", ".s:ListString(l:block[1][1])
endfunction

nnoremap <M-^> :call <SID>SelectAroundDelimiter()<CR>
