" vim: fdm=marker ft=sourceonsave.vim

function! editfns#to_pascal(word)
  let l:s = ''
  for word in editfns#split_symbol(a:word)
    if !len(word)
      continue
    endif
    let l:s .= toupper(word[0]).word[1:]
  endfor
  return l:s
endfunction

function! editfns#to_camel(word)
  let l:words = editfns#split_symbol(a:word)
  let l:s = l:words[0]
  for word in l:words[1:]
    if !len(word)
      continue
    endif
    let l:s .= toupper(word[0]).word[1:]
  endfor
  return l:s
endfunction

function! editfns#to_kebab(word)
  return join(editfns#split_symbol(a:word), '-')
endfunction

function! editfns#to_snake(word)
  return join(editfns#split_symbol(a:word), '_')
endfunction

function! editfns#to_upper_snake(word)
  return toupper(join(editfns#split_symbol(a:word), '_'))
endfunction

function! editfns#visual_between(from, to)
  if v:operator == 'v' || v:operator == 'V'
    normal! <Esc>
  endif
  call searchpos(a:from, 'Wbce')
  normal! v
  call searchpos(a:to, 'Wc')
endfunction

function! editfns#inside_name()
  let l:old_isk = &l:isk
  setlocal isk+=.
  normal! viw
  let &l:isk = l:old_isk
endfunction

function! editfns#inside_snake()
  call editfns#visual_between('\(\<\|_\).', '.\(\>\|_\)')
endfunction

function! editfns#inside_capital()
  call editfns#visual_between('\(\<\|[A-Z]\)', '.\(\>\|[A-Z]\)')
endfunction

function! editfns#split_symbol(word)
  let l:ignorecase = &ignorecase
  set noignorecase
  let l:word = substitute(a:word, '-', '_', 'gi')
  let l:words = split(tolower(substitute(l:word, '\([a-z]\)\([A-Z]\)', '\1_\2', 'gi')), '_')
  let &ignorecase = l:ignorecase
  return l:words
endfunction

function! editfns#around_delimiters()
  if getline(".")[getpos(".")[2]-1] =~# '[\[\]\{\}\(\)]'
    normal! v%
    return
  endif
  call searchpos('[\[\(\{]', 'Wbce')
  normal! v%
endfunction

function! editfns#toggle_syntax()
  if !exists("g:syntax_on") || !g:syntax_on
    syntax on
  else
    syntax off
  endif
endfunction

function! editfns#toggle_case_sensitive()
  let l:sq = getreg('/')
  if l:sq =~# '\/c$'
    let l:sq = l:sq[:-3].'/C'
  elseif l:sq =~# '\/C$'
    let l:sq = l:sq[:-3].'/c'
  else
    let l:sq = l:sq.'/C'
  endif
  call setreg('/', l:sq)
  echo l:sq
endfunction

function! editfns#toggle_search_direction()
  let l:sq = getreg('/')
  if l:sq =~# '\/e$'
    let l:sq = l:sq[:-3]
  else
    let l:sq = l:sq.'/e'
  endif
  call setreg('/', l:sq)
  echo l:sq
endfunction

function! editfns#delete_function_call()
  call search('\<', 'Wbce')
  " Set up 3 marks for the parts we want to delete
  normal! mzf(mx%mc
  " Then delete them
  normal! `cx`xv`zd
endfunction
