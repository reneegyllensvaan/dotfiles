source ~/.vim/ftplugin/transient.vim

function! s:InsertJiraHeader()
  let l:url = getreg('+')
  if l:url !~? 'https:\/\/.*NC-\d\+'
    return ""
  endif

  let l:issue = substitute(l:url, '.*NC-', 'NC-', '')
  return "\<CR>\<CR>  - ".l:url."\<Up>\<Up>".l:issue.": "
endfunction

inoremap <buffer> <expr> <C-t><C-j> <SID>InsertJiraHeader()
