inoremap <buffer> <expr> <Plug>(python-argument-punning) "\<C-o>ciw".expand('<cword>')."=".expand('<cword>').",\<CR>"
imap <buffer> <C-c><C-n> <C-o>h<Plug>(python-argument-punning)

imap <buffer> <C-t><C-t> <C-o>h<Plug>(python-argument-punning)

inoremap <buffer> <C-t><C-l> print("{}".format())<Left><Left>

inoremap <buffer> <C-t><C-n> None
inoremap <buffer> <C-t><C-a> =<Space>attr.ib(type=)<Left>

command! PythonIgnoreUnusedImport normal!A<Space><Space>#<Space>noqa:<Space>F401,<Space>pylint:<Space>disable=unused-import
command! PythonIgnoreNotAnIterable normal!A<Space><Space>#<Space>pylint:<Space>disable=not-an-iterable
nnoremap <buffer> <C-s><C-l> :LintBackendFlake8<CR>
