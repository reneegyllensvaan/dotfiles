function! myfns#chmod(fname, mod) abort
  let l:permissions = getfperm(a:fname)
  if a:mod =~? "^[ugo]*+[rwx]\\+$"
    let [l:targets, l:mods] = split(a:mod, '+')
  elseif a:mod =~? "^[ugo]*-[rwx]\\+$"
  else
    echo "invalid perm spec :("
    return
  end
  if len(l:pparts) > 1
endfunction
