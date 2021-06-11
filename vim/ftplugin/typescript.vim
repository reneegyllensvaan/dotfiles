" vim: fdm=marker foldlevel=0 ft=sourceonsave.vim
inoremap <buffer> <C-t> <Nop>
nmap <buffer> crt cr<
inoremap <buffer> <C-t><C-o> : {<CR>}<Esc>O
inoremap <buffer> <C-t>' : '',<Left><Left>

inoremap <buffer> <C-t><C-l> console.log('value:', value)<Esc>bbb*Ncgn

" TF: Tap-Fhrase  {{{
nnoremap <buffer> <Plug>(object-string-entry) o:<Space>'',<Left><Left><Left><Left><Left>
inoremap <buffer> <Plug>(object-string-entry) <C-o>A:<Space>'',<Left><Left>

nmap <buffer> <C-t><C-f><C-s> <Plug>(object-string-entry)
imap <buffer> <C-t><C-f><C-s> <Plug>(object-string-entry)

inoremap <buffer> <C-t><C-f><C-f> ()<Space>=><Space>
" }}}

" TT: Tap-Type  {{{
inoremap <buffer> <C-t><C-t><C-d> :<Space>undefined;
inoremap <buffer> <C-t><C-t><C-u> :<Space>UUID;
inoremap <buffer> <C-t><C-t><C-l> :<Space>null;
inoremap <buffer> <C-t><C-t><C-n> :<Space>number;
inoremap <buffer> <C-t><C-t><C-b> :<Space>boolean;
inoremap <buffer> <C-t><C-t><C-s> :<Space>string;
inoremap <buffer> <C-t><C-t><C-f> :<Space>()<Space>=><Space>void;<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

inoremap <buffer> <C-t><C-t><C-o><C-d> <Left><Space>\|<Space>undefined
inoremap <buffer> <C-t><C-t><C-o><C-u> <Left><Space>\|<Space>UUID
inoremap <buffer> <C-t><C-t><C-o><C-l> <Left><Space>\|<Space>null
inoremap <buffer> <C-t><C-t><C-o><C-n> <Left><Space>\|<Space>number
inoremap <buffer> <C-t><C-t><C-o><C-b> <Left><Space>\|<Space>boolean
inoremap <buffer> <C-t><C-t><C-o><C-s> <Left><Space>\|<Space>string
" }}}

inoreabbrev <buffer> FN function(props: Props) {<CR>}<Esc>O<Esc>k$F(i
inoreabbrev <buffer> KFN function({}: Props) {<CR>}<Esc>O<Esc>k$F(i
