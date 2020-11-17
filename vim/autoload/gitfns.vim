
function gitfns#prompt_git_files() abort
  let s:git_prompt_files = []
  command! -nargs=* VoidCmd call add(g:git_prompt_files, <q-args>)
  call fzy#leader_script("gf", ":VoidCmd ")
  if empty(l:message)
    return 0
  else
    return s:git_prompt_files
  end
endfunction

function gitfns#stash() abort
  let l:message = input('Stash message: ')
  if empty(l:message)
    return
  end
  " TODO: Check if there's a nice way to stash individual files
  " call fzy#leader_script("gf", ":VoidCmd ")<CR>
endfunction

function gitfns#discard_confirm() abort
  let l:files = gitfns#prompt_git_files()
  if !l:files
    return
  end
  for l:file in l:files
    echo l:file
  endfor
  let l:message = input(': ')
endfunction
