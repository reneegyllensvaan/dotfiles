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

function! myfns#visual_between(from, to)
  if v:operator == 'v' || v:operator == 'V'
    normal! <Esc>
  endif
  call search(a:from, 'Wbce')
  normal! v
  call search(a:to, 'Wc')
endfunction

function! myfns#inside_name()
  call myfns#visual_between('\(^\|[^A-z.]\)[A-z.]', '[A-z.]\($\|[^A-z.]\)')
endfunction

function! myfns#inside_snake()
  call myfns#visual_between('\(\<\|_\).', '.\(\>\|_\)')
endfunction

function! myfns#inside_capital()
  call myfns#visual_between('\(\<\|[A-Z]\)', '.\(\>\|[A-Z]\)')
endfunction

function! myfns#split_case(word)
  let l:ignorecase = &ignorecase
  set noignorecase
  let l:words = split(tolower(substitute(a:word, '\([a-z]\)\([A-Z]\)', '\1_\2', 'g')), '_')
  let &ignorecase = l:ignorecase
  return l:words
endfunction

function! myfns#start_coc()
  " call EnsurePluginLoaded('coc')
  " runtime plugin/coc.vim
  packadd coc
  execute 'CocEnable'
  if !exists("g:coc_is_sourced")
    let g:coc_is_sourced = 1
    execute 'source' "~/.vim/rc/coc.vim"
    if has('gui_running')
      execute 'CocStart'
    endif
  endif
endfunction

function! myfns#toggle_syntax()
  if !exists("g:syntax_on") || !g:syntax_on
    syntax on
  else
    syntax off
  endif
endfunction

function! myfns#toggle_case_sensitive()
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

function! myfns#toggle_search_direction()
  let l:sq = getreg('/')
  if l:sq =~# '\/e$'
    let l:sq = l:sq[:-3]
  else
    let l:sq = l:sq.'/e'
  endif
  call setreg('/', l:sq)
  echo l:sq
endfunction

function! myfns#delete_function_call()
  call search('\<', 'Wbce')
  " Set up 3 marks for the parts we want to delete
  normal! mzf(mx%mc
  " Then delete them
  normal! `cx`xv`zd
endfunction
