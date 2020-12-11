source ~/.vim/ftplugin/typescript.vim

inoremap <buffer> <expr> <Plug>(expand-xml-tag) "\<C-o>ciw<".expand('<cword>')."></".expand('<cword>').">\<C-o>F<"
imap <buffer> <C-c><C-t> <C-o>h<Plug>(expand-xml-tag)

inoremap <buffer> <expr> <CR> (nr2char(strgetchar(getline('.')[col('.') - 2:], 0)) == '>' && nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == '<') ? "\<CR>\<Esc>O" : "\<CR>"

vmap <buffer> at atV

