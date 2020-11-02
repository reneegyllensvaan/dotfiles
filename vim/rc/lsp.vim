packadd nvim-lspconfig
packadd nvim-treesitter
packadd completion-nvim
packadd completion-buffers
packadd completion-treesitter

" lua require'completion'.on_attach()
" lua require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>

" --- completion-nvim ---
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

" --- diagnostic-nvim ---
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ''

" sign define LspDiagnosticsErrorSign text=✖
" sign define LspDiagnosticsWarningSign text=
" sign define LspDiagnosticsInformationSign text=➤
sign define LspDiagnosticsErrorSign text=
sign define LspDiagnosticsWarningSign text=
sign define LspDiagnosticsInformationSign text=
sign define LspDiagnosticsHintSign text=➤

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
