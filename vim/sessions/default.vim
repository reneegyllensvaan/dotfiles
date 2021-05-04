let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/backend
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +72 layers/use_cases/access/tests/test_get_user_access.py
badd +139 ~/infrastructure/sceptre/templates/lambda/github-webhook-jenkins-forwarder-fn.yaml
badd +36 gateway/alchemy/company_document.py
badd +12 gateway/alchemy/document_index.py
badd +97 ~/frontend/cobalt_2/src/Application.tsx
badd +115 gateway/alchemy/access.py
badd +37 userdata/models/access.py
badd +76 gateway/in_memory/access.py
badd +154 layers/interfaces/gateway/access.py
badd +53 layers/use_cases/access/list_access_requests.py
badd +458 layers/interfaces/gateway/user.py
badd +150 layers/use_cases/access/handle_access_request.py
badd +81 ~/frontend/cobalt_2/src/components/investments/CopyExistingRequestContainer.tsx
badd +136 ~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx
badd +134 ~/frontend/cobalt_2/src/components/investments/RecurringRequestForm.tsx
badd +6 ~/frontend/cobalt_2/src/components/investments/utils.ts
argglobal
%argdel
set stal=2
tabnew
tabnew
tabrewind
edit ~/frontend/cobalt_2/src/Application.tsx
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 97 - ((38 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 97
normal! 042|
lcd ~/frontend/cobalt_2
tabnext
edit ~/backend/layers/use_cases/access/handle_access_request.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 1resize ' . ((&columns * 182 + 182) / 365)
exe '2resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 182 + 182) / 365)
exe 'vert 3resize ' . ((&columns * 182 + 182) / 365)
argglobal
balt ~/backend/gateway/alchemy/access.py
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 150 - ((22 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 150
normal! 0
lcd ~/backend
wincmd w
argglobal
if bufexists("~/backend/layers/use_cases/access/list_access_requests.py") | buffer ~/backend/layers/use_cases/access/list_access_requests.py | else | edit ~/backend/layers/use_cases/access/list_access_requests.py | endif
if &buftype ==# 'terminal'
  silent file ~/backend/layers/use_cases/access/list_access_requests.py
endif
balt ~/backend/layers/interfaces/gateway/user.py
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 53 - ((21 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 53
normal! 09|
lcd ~/backend
wincmd w
argglobal
if bufexists("~/backend/layers/use_cases/access/tests/test_get_user_access.py") | buffer ~/backend/layers/use_cases/access/tests/test_get_user_access.py | else | edit ~/backend/layers/use_cases/access/tests/test_get_user_access.py | endif
if &buftype ==# 'terminal'
  silent file ~/backend/layers/use_cases/access/tests/test_get_user_access.py
endif
balt ~/backend/userdata/models/access.py
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 72 - ((39 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 72
normal! 0
lcd ~/backend
wincmd w
exe '1resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 1resize ' . ((&columns * 182 + 182) / 365)
exe '2resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 182 + 182) / 365)
exe 'vert 3resize ' . ((&columns * 182 + 182) / 365)
tabnext
edit ~/frontend/cobalt_2/src/components/investments/RecurringRequestForm.tsx
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 182 + 182) / 365)
exe '2resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 182 + 182) / 365)
exe '3resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 3resize ' . ((&columns * 182 + 182) / 365)
argglobal
balt ~/frontend/cobalt_2/src/components/investments/utils.ts
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
73
normal! zo
88
normal! zo
116
normal! zo
118
normal! zo
let s:l = 135 - ((39 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 135
normal! 022|
lcd ~/frontend/cobalt_2
wincmd w
argglobal
if bufexists("~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx") | buffer ~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx | else | edit ~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx | endif
if &buftype ==# 'terminal'
  silent file ~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx
endif
balt ~/frontend/cobalt_2/src/components/investments/CopyExistingRequestContainer.tsx
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
120
normal! zo
202
normal! zo
204
normal! zo
206
normal! zo
let s:l = 147 - ((19 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 147
normal! 041|
lcd ~/frontend/cobalt_2
wincmd w
argglobal
if bufexists("~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx") | buffer ~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx | else | edit ~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx | endif
if &buftype ==# 'terminal'
  silent file ~/frontend/cobalt_2/src/components/investments/ActivityAndRequestsContainer.tsx
endif
balt ~/frontend/cobalt_2/src/components/investments/CopyExistingRequestContainer.tsx
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
120
normal! zo
202
normal! zo
204
normal! zo
206
normal! zo
let s:l = 117 - ((19 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 117
normal! 05|
lcd ~/frontend/cobalt_2
wincmd w
exe 'vert 1resize ' . ((&columns * 182 + 182) / 365)
exe '2resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 2resize ' . ((&columns * 182 + 182) / 365)
exe '3resize ' . ((&lines * 39 + 41) / 83)
exe 'vert 3resize ' . ((&columns * 182 + 182) / 365)
tabnext 3
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=Ac
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
