inoremap <expr> <Plug>(python-argument-punning) "\<C-o>ciw".expand('<cword>')."=".expand('<cword>').",\<CR>"
imap <C-c><C-n> <C-o>h<Plug>(python-argument-punning)

imap <C-t><C-t> <C-o>h<Plug>(python-argument-punning)

inoremap <C-t><C-l> print("{}".format())<Left><Left>

inoremap <C-t><C-n> None

command! PythonIgnoreUnusedImport normal!A<Space><Space>#<Space>noqa:<Space>F401,<Space>pylint:<Space>disable=unused-import

