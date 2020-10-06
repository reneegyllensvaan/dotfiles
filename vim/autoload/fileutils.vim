" vim: fdm=marker ft=sourceonsave.vim

function! fileutils#chmod(fname, mod) abort
  let l:permissions = getfperm(a:fname)
  if a:mod =~? "^[ugo]*+[rwx]\\+$"
    let [l:targets, l:mods] = split(a:mod, '+')
  elseif a:mod =~? "^[ugo]*-[rwx]\\+$"
  else
    echo "invalid perm spec :("
    return
  end
  if len(l:pparts) > 1
  end
endfunction

function! fileutils#yank_path(reg, fmt, bang)
  let l:path = expand(a:fmt).((a:bang != "!") ? (":".line('.')) : "")
  call setreg(a:reg, l:path)
  echo "Yanked path ".l:path." into register ".a:reg
endfunction

