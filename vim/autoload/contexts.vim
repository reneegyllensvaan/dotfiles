let g:prefix_to_context = {
      \"Projects/cobalt2": "work_cobalt2",
      \"Projects/frontend": "work_frontend",
      \"Projects/backend": "work_backend",
      \}

function! g:Ctx_work_cobalt2()
  let &l:makeprg = join([
        \"eslint_d --ext .js,.jsx,.ts,.tsx",
        \"--format compact",
        \"-c /Users/renee/Projects/cobalt2/cobalt_2/.eslintrc.yml",
        \"--ignore-path /Users/renee/Projects/cobalt2/cobalt_2/.eslintignore"
        \], " ")
  let &l:errorformat = "%f: line %l\\, col %c\\, %m"
endfunction

function! contexts#use(ctx)
  exec "call g:Ctx_".(a:ctx)."()"
endfunction

function! contexts#infer()
  let l:abs = expand('%:p:h')
  let l:dir = substitute(l:abs, glob('~'), '', '')
  if len(l:dir) < len(l:dir)
    let l:dir = l:dir[1:]
  endif
  for l:key in keys(g:prefix_to_context)
    if l:dir =~ ('^'.l:key)
      return contexts#use(g:prefix_to_context[l:key])
    end
  endfor
endfunction
call contexts#infer()
