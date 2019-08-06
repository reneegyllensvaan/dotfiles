command! FzfProjectFiles call skim#run({'source': 'git ls-files-root', 'sink': 'e', 'down': '30%'})

command! -bang -nargs=* RgInteractive call fzf#vim#rg_interactive(<q-args>)

command! -nargs=* Fd call skim#run({'source': "fd <args>", 'sink': 'e', 'down': '30%'})

command! ToggleLineNumbers :set invnumber

command! -range GB echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")
