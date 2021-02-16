" vim: fdm=marker foldlevel=0
inoremap <buffer> <C-t> <Nop>
nmap <buffer> crt cr<

" Arrow

" TF: Tap-Fhrase  {{{
" }}}

" TT: Tap-Type  {{{
inoremap <buffer> <C-t><C-t><C-u> :<Space>undefined;
inoremap <buffer> <C-t><C-t><C-l> :<Space>null;
inoremap <buffer> <C-t><C-t><C-n> :<Space>number;
inoremap <buffer> <C-t><C-t><C-b> :<Space>boolean;
inoremap <buffer> <C-t><C-t><C-s> :<Space>string;

inoremap <buffer> <C-t><C-t><C-o><C-u> <Left><Space>\|<Space>undefined
inoremap <buffer> <C-t><C-t><C-o><C-l> <Left><Space>\|<Space>null
inoremap <buffer> <C-t><C-t><C-o><C-n> <Left><Space>\|<Space>number
inoremap <buffer> <C-t><C-t><C-o><C-b> <Left><Space>\|<Space>boolean
inoremap <buffer> <C-t><C-t><C-o><C-s> <Left><Space>\|<Space>string
" }}}
