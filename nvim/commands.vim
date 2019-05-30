command! FzfProjectFiles call fzf#run({'source': 'fd', 'sink': 'e', 'down': '30%'})
"command! FzfProjectFiles call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '30%'})
command! -nargs=* Fd call fzf#run({'source': "<args>", 'sink': 'e', 'down': '30%'})
command! ToggleLineNumbers :set invnumber
