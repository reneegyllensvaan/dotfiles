nnoremap <buffer> <expr> <C-c><C-c> bufnr() == 1 ? ":wq<CR>" : ":w<CR>:bd<CR>"
