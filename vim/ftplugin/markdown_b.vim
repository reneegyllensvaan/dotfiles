function! s:ToggleChecked() abort
  let line = getline('.')
  if line =~ "- \\[ \\]"
    call setline('.', substitute(line, '- \[ \]', '- [x]', ""))
  else
    call setline('.', substitute(line, '- \[x\]', '- [ ]', ""))
  endif

endfunction

nnoremap <silent> <buffer> <C-c><C-c> :call <SID>ToggleChecked()<CR>
iabbrev <buffer> -[] -<space>[<space>]
iabbrev <buffer> [] []()<Left><Left><Left>

" Language: (experimental)
iabbrev <buffer> anoth another
