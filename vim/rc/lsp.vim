" ex: fdm=marker
packadd nvim-lspconfig
packadd nvim-treesitter
packadd completion-nvim
packadd completion-buffers
packadd completion-treesitter

lua << EOF
local nvim_lsp = require'lspconfig'

nvim_lsp.pyright.setup{
}

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>

" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>

" --- completion-nvim --- {{{
let g:completion_enable_auto_signature = 0  " crazy slow
let g:completion_matching_smart_case = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

augroup lsp-attach
  autocmd!
  autocmd BufEnter * lua require'completion'.on_attach()
augroup END
set completeopt=menuone,noinsert,noselect
set shortmess+=c
" let g:completion_enable_auto_popup = 0

" {'complete_items': ['lsp', 'snippet', 'path']},
let g:completion_chain_complete_list = [
      \{'complete_items': ['lsp']},
      \{'mode': '<c-p>'},
      \{'mode': '<c-n>'},
      \]

" check previous cols
function! s:check_behind() abort
  function! s:col_is_space(col)
    return a:col && getline('.')[a:col - 1] =~# '\s'
  endfunction
  let prev = col('.') - 1
  return !prev || s:col_is_space(prev) && s:col_is_space(prev - 1)
endfunction

" <TAB>/<S-TAB> through completeopts
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_behind() ? "\<TAB>" :
      \ completion#trigger_completion()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" prevent completion-nvim from conflicting with auto-pairs
let g:completion_confirm_key = ""
inoremap <expr> <CR> pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<CR>"
" --- completion-nvim --- }}}

" --- diagnostic-nvim --- {{{
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ''

" sign define LspDiagnosticsErrorSign text=✖
" sign define LspDiagnosticsWarningSign text=
" sign define LspDiagnosticsInformationSign text=➤
sign define LspDiagnosticsErrorSign text=
sign define LspDiagnosticsWarningSign text=
sign define LspDiagnosticsInformationSign text=
sign define LspDiagnosticsHintSign text=➤
" --- diagnostic-nvim --- }}}

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=150
set shortmess+=c
set signcolumn=yes
set number

" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
