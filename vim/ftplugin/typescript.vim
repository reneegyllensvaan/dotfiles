" setlocal makeprg=npm\ run\ eslint
" let &l:makeprg = "eslint_d --ext .js,.jsx,.ts,.tsx --format compact -c /Users/renee/Projects/cobalt2/cobalt_2/.eslintrc.yml --ignore-path /Users/renee/Projects/cobalt2/cobalt_2/.eslintignore"
" let &l:errorformat = "%f: line %l\\, col %c\\, %m"
" autocmd BufWritePost <buffer> silent make! <afile> | silent redraw!
" autocmd QuickFixCmdPost [^l]* cwindow
