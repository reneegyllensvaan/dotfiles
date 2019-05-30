command! FzfProjectFiles call fzf#run({'source': 'git ls-files-root', 'sink': 'e', 'down': '30%'})
"command! FzfProjectFiles call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '30%'})
command! -nargs=* Fd call fzf#run({'source': "fd <q-args>", 'sink': 'e', 'down': '30%'})
command! ToggleLineNumbers :set invnumber
command! -range GB echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")
