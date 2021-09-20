setlocal expandtab
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal shiftround

set cindent
set cinoptions=(0,u0,U0

inoremap <buffer> <expr> <Plug>(python-argument-punning) "\<C-o>ciw".expand('<cword>')."=".expand('<cword>').",\<CR>"
imap <buffer> <C-c><C-n> <C-o>h<Plug>(python-argument-punning)

imap <buffer> <C-t><C-t> <C-o>h<Plug>(python-argument-punning)
nmap <buffer> crg cr[i<Esc>
nmap <buffer> crG e[]<Left>
nmap <buffer> crl cr[iList<Esc>
nmap <buffer> cro cr[iOptional<Esc>

inoremap <buffer> <C-t><C-l> print("{}".format())<Left><Left>

inoremap <buffer> <C-t><C-u> UUID
inoremap <buffer> <C-t>u uuid4()<Left>
inoremap <buffer> <C-t><C-n> None
inoremap <buffer> <C-t><C-a> <Space>=<Space>attr.ib(type=)<Left>

command! PythonBlack %!black -q -
nnoremap <buffer> <C-s>F :PythonBlack<CR>

command! PythonIgnoreUnusedImport normal!A<Space><Space>#<Space>noqa:<Space>F401,<Space>pylint:<Space>disable=unused-import
command! PythonIgnoreNotAnIterable normal!A<Space><Space>#<Space>pylint:<Space>disable=not-an-iterable
nnoremap <buffer> <C-s><C-l> :LintBackendFlake8<CR>
