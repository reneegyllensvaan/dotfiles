command! FzfProjectFiles call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '30%'})
command! ToggleLineNumbers :set invnumber
