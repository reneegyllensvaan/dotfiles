" vim: fdm=marker ft=sourceonsave.vim

function! myfns#to_pascal(word)
  let l:s = ''
  for word in myfns#split_case(a:word)
    if !len(word)
      continue
    endif
    let l:s .= toupper(word[0]).word[1:]
  endfor
  return l:s
endfunction

function! myfns#to_camel(word)
  let l:words = myfns#split_case(a:word)
  let l:s = l:words[0]
  for word in l:words[1:]
    if !len(word)
      continue
    endif
    let l:s .= toupper(word[0]).word[1:]
  endfor
  return l:s
endfunction

function! myfns#to_snake(word)
  return join(myfns#split_case(a:word), '_')
endfunction

function! myfns#to_upper_snake(word)
  return toupper(join(myfns#split_case(a:word), '_'))
endfunction

function! myfns#split_case(word)
  let l:ignorecase = &ignorecase
  set noignorecase
  let l:words = split(tolower(substitute(a:word, '\([a-z]\)\([A-Z]\)', '\1_\2', 'g')), '_')
  let &ignorecase = l:ignorecase
  return l:words
endfunction
