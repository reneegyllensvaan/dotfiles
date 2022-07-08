highlight MarkdownCompleted ctermfg=darkgray
augroup markdownSyntax
   au!
   autocmd Syntax <buffer> call LoadMarkdownSyntax()
augroup END
function! LoadMarkdownSyntax()
  au! markdownSyntax
  set syntax=markdown
  syntax match MarkdownCompleted containedin=mkdListItemLine /\[x] .*$/
endfunction

function! s:ToggleChecked() abort
  let line = getline('.')
  if line =~ "- \\[ \\]"
    call setline('.', substitute(line, '- \[ \]', '- [x]', ""))
  else
    call setline('.', substitute(line, '- \[x\]', '- [ ]', ""))
  endif
  write
endfunction
nnoremap <silent> <buffer> <C-c><C-c> :call <SID>ToggleChecked()<CR>
