packadd fastfold

function! s:ToggleChecked() abort
  let line = getline('.')
  if line =~ "- \\[ \\]"
    call setline('.', substitute(line, '- \[ \]', '- [x]', ""))
  else
    call setline('.', substitute(line, '- \[x\]', '- [ ]', ""))
  endif
endfunction


function! s:ToggleLineItem() abort
  let line = getline('.')
  if line =~ "\^\s*- "
    normal! ^dw
  else
    exec "normal! I-\<Space>"
  endif
endfunction

function! s:GenerateMarkdownTocToRegister(register)
  call setreg(a:register, system('markdown-toc', join(getline(1,'$'),"\n")))
endfunction
command! MarkdownToc normal! :call <SID>GenerateMarkdownTocToRegister('x')<CR>"xp

" <C-t>: Structural snippets
nnoremap <buffer> <C-t><C-c> o<Esc>cc<BS><BS>-<Space>[<Space>]<Space>
nnoremap <buffer> <C-t><C-l> o<Esc>cc<BS><BS>----------------------<Esc>

nnoremap <silent> <buffer> <C-l><C-i> :call <SID>ToggleLineItem()<CR>
nnoremap <silent> <buffer> <C-n> <<
nnoremap <silent> <buffer> <C-e> >>
nnoremap <silent> <buffer> gqq Vgq

nnoremap <silent> <buffer> <C-c><C-c> :call <SID>ToggleChecked()<CR>

" List item management:
" nnoremap <silent> <buffer> o A<CR>
nnoremap <silent> <buffer> o A<CR>
nnoremap <silent> <buffer> <C-c><C-i> o<C-d><C-d>-<Space>

iabbrev <buffer> -[] -<space>[<space>]
" iabbrev <buffer> [] []()<Left><Left><Left>

inoreabbrev <buffer> H1 # {{{1<CR><!-- 1}}} --><Up><Left><Left><Left><Left><Left>
inoreabbrev <buffer> H2 ## {{{2<CR><!-- 2}}} --><Up><Left><Left><Left><Left><Left>
inoreabbrev <buffer> H3 ### {{{3<CR><!-- 3}}} --><Up><Left><Left><Left><Left><Left>

" Language: (experimental)
iabbrev <buffer> anoth another
iabbrev <buffer> dacol Data Collection

setlocal expandtab
setlocal shiftwidth=2
