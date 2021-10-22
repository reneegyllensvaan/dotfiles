nnoremap <buffer> <C-s><C-f> :%!xmllint --format -<CR>
inoremap <buffer> <expr> <Plug>(expand-xml-tag) "\<C-o>ciw<".expand('<cword>')."></".expand('<cword>').">\<C-o>F<"
imap <buffer> <C-c><C-t> <C-o>h<Plug>(expand-xml-tag)
