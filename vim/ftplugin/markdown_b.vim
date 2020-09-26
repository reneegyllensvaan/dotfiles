function! s:ToggleChecked() abort
  let line = getline('.')
  if line =~ '- [ ]'
    call setline('.', substitute(line, '- \[ \]', 'aaaaa', ""))
  else
    call setline('.', substitute(line, '- [x]', '- [ ]', ""))
  endif

endfunction

nnoremap <buffer> <C-c><C-c> :call <SID>ToggleChecked()<CR>
