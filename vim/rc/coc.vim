" vim: ft=vim fdm=marker
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=150
"set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

if has('nvim')
  set signcolumn=yes
else
  set signcolumn=number
end
set number

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 CocSortImports call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 OR CocSortImports

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

imap <C-t> <C-o><Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <silent> K :call <SID>show_documentation()<CR>


nnoremap <silent><nowait> <Space>sR  :CocRestart<cr>
nnoremap <Space>si  :CocSortImports<cr>

" CocList: {{{

nnoremap <silent><nowait> <Space>ss  :<C-u>CocList<cr>
nnoremap <silent><nowait> <Space>sa  :<C-u>CocList actions<cr>
nnoremap <silent><nowait> <Space>sd  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <Space>se  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <Space>sc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <Space>so  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <Space>sy  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <Space>sj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <Space>sk  :<C-u>CocPrev<CR>

vnoremap <silent><nowait> <Space>ss  :<C-u>CocList<cr>
vnoremap <silent><nowait> <Space>sa  :<C-u>CocList actions<cr>
vnoremap <silent><nowait> <Space>sd  :<C-u>CocList diagnostics<cr>
vnoremap <silent><nowait> <Space>se  :<C-u>CocList extensions<cr>
vnoremap <silent><nowait> <Space>sc  :<C-u>CocList commands<cr>
vnoremap <silent><nowait> <Space>so  :<C-u>CocList outline<cr>
vnoremap <silent><nowait> <Space>sy  :<C-u>CocList -I symbols<cr>
vnoremap <silent><nowait> <Space>sj  :<C-u>CocNext<CR>
vnoremap <silent><nowait> <Space>sk  :<C-u>CocPrev<CR>
" CocList: }}}

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Actions:
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>ac  <Plug>(coc-codeaction)
nmap <Leader>rn <Plug>(coc-rename)

" QuickFix:
nmap <Space>qf  <Plug>(coc-fix-current)
xmap <silent> <Space>qF <Plug>(coc-format-selected)
nmap <silent> <Space>qF <Plug>(coc-format-selected)

" Coc Motions:
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Goto:
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
