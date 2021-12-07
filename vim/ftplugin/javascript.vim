inoremap <buffer> <C-t><C-o> : {<CR>}<Esc>O
inoremap <buffer> <C-t>' : '',<Left><Left>
inoremap <buffer> <C-t>u undefined

" Override default operator behavior, thanks javascript
inoremap <buffer> <M-e> <Space>===<Space>
inoremap <buffer> <M-E> <Space>!==<Space>
