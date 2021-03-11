let g:prefix_to_context = {
      \"Projects/cobalt2": "work_cobalt2",
      \"Projects/frontend": "work_frontend",
      \"Projects/backend": "work_backend",
      \}

function! Ctx_work_cobalt2()
  let &l:makeprg = join([
        \"eslint_d --ext .js,.jsx,.ts,.tsx",
        \"--format compact",
        \"-c /Users/renee/Projects/cobalt2/cobalt_2/.eslintrc.yml",
        \"--ignore-path /Users/renee/Projects/cobalt2/cobalt_2/.eslintignore"
        \], " ")
  let &l:errorformat = "%f: line %l\\, col %c\\, %m"
  let b:makecmd = 'silent make! /Users/renee/Projects/cobalt2/cobalt_2/src'
  return 1
endfunction

"  ./layers/use_cases/reporting/tests/test_create_or_update_client_email_template.py:13:1: F401 'layers.use_cases.reporting.types.ClientEmailTemplateParamSerializer' imported but unused
"  ./layers/use_cases/reporting/tests/test_create_or_update_client_email_template.py:78:1: F811 redefinition of unused 'test_create_client_email_template' from line 33
function! Ctx_work_backend()
  let &l:makeprg = 'source ../venv/bin/activate && flake8'
  let &l:errorformat = "%f:%l:%c: %m"

  let g:neomake_flake8_maker = {
      \ 'exe': 'flake8',
      \ 'args': [],
      \ 'errorformat': '%f:%l:%c: %m',
      \ }
  let b:makecmd = 'verbose Neomake! flake8'
  return 1
endfunction

function! Ctx_work_frontend()
  let &l:makeprg = 'make'
  let &l:errorformat = "%f: line %l\\, col %c\\, %m"
  let b:makecmd = 'silent make!'
  echo "NYI context 'work_frontend'"
  return 0
endfunction

function! contexts#use(ctx)
  exec "return Ctx_".(a:ctx)."()"
endfunction

function! contexts#infer()
  let l:dir = expand('%:p:~')
  if l:dir[0] != '~'
    return
  endif
  for l:key in keys(g:prefix_to_context)
    if l:dir[2:len(l:key)+1] == l:key
      return contexts#use(g:prefix_to_context[l:key])
    end
  endfor
endfunction
