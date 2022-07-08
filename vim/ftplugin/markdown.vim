packadd fastfold

function! s:ToggleChecked() abort
  let line = getline('.')
  if line =~ "- \\[ \\]"
    call setline('.', substitute(line, '- \[ \]', '- [x]', ""))
  else
    call setline('.', substitute(line, '- \[x\]', '- [ ]', ""))
  endif
endfunction

function! s:IndentSubtree(v) abort
  let l:pos = getpos('.')[1]

  " Find first heading on or above cursor
  let l:line = getline(l:pos)
  while l:line !~# '^#'
    let l:pos -= 1
    if l:pos < 1
      echo 'no parent heading found'
      return
    endif
    let l:line = getline(l:pos)
  endwhile

  let l:base_indent = len(substitute(l:line, '^\(#*\).*', '\1', ''))
  if l:base_indent + a:v < 1
    echo "cannot reduce indent below 1"
    return
  endif

  let l:line = getline(l:pos)
  let l:indent = len(substitute(l:line, '^\(#*\).*', '\1', ''))
  while l:pos < getpos('$')[1]
    if l:indent > 0 && a:v > 0
      call setline(l:pos, repeat('#', a:v).l:line)
    elseif l:indent > 0
      call setline(l:pos, l:line[-a:v:])
    endif
    let l:pos += 1

    let l:line = getline(l:pos)
    let l:indent = len(substitute(l:line, '^\(#*\).*', '\1', ''))
    if l:indent > 0 && l:indent <= l:base_indent
      break
    endif
  endwhile
endfunction
nnoremap <buffer> ># :call <SID>IndentSubtree(+1)<CR>
nnoremap <buffer> <# :call <SID>IndentSubtree(-1)<CR>


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

" Use ^I for folding
nnoremap <buffer> <Tab> za

" List item management:
" nnoremap <silent> <buffer> o A<CR>
nnoremap <silent> <buffer> o A<CR>
nnoremap <silent> <buffer> <C-c><C-i> o<C-d><C-d>-<Space>

iabbrev <buffer> -[] -<space>[<space>]
" iabbrev <buffer> [] []()<Left><Left><Left>

inoreabbrev <buffer> H1 # {{{1<CR><!-- 1}}} --><Up><Left><Left><Left><Left><Left>
inoreabbrev <buffer> H2 ## {{{2<CR><!-- 2}}} --><Up><Left><Left><Left><Left><Left>
inoreabbrev <buffer> H3 ### {{{3<CR><!-- 3}}} --><Up><Left><Left><Left><Left><Left>

setlocal expandtab
setlocal shiftwidth=2

" " Emacs org-mode style folding: use headers as folds and tab to un/fold
" function! MarkdownLevel()
"     if getline(v:lnum) =~# '^# .*$'
"         return ">1"
"     endif
"     if getline(v:lnum) =~# '^## .*$'
"         return ">2"
"     endif
"     if getline(v:lnum) =~# '^### .*$'
"         return ">3"
"     endif
"     if getline(v:lnum) =~# '^#### .*$'
"         return ">4"
"     endif
"     if getline(v:lnum) =~# '^##### .*$'
"         return ">5"
"     endif
"     if getline(v:lnum) =~# '^###### .*$'
"         return ">6"
"     endif
"     return "="
" endfunction
" au BufEnter *.md setlocal foldexpr=MarkdownLevel()
" au BufEnter *.md setlocal foldmethod=expr
