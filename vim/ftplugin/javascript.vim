inoremap <buffer> <C-t><C-o> : {<CR>}<Esc>O
inoremap <buffer> <C-t>' : '',<Left><Left>
inoremap <buffer> <C-t>u undefined

inoremap <buffer> <C-t><C-l> console.log('value:', value)<Esc>bbb*Ncgn
inoremap <buffer> <C-t>l console.log({})<Left><Left>

" Override default operator behavior, thanks javascript
inoremap <buffer> <M-C-E> <Space>===<Space>
inoremap <buffer> <M-E> <Space>!==<Space>
