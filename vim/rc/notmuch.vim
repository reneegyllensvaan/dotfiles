let g:notmuch_date_format = '%y-%m-%d'
let g:notmuch_folders = [
      \['all mail', '*'],
      \['inbox', 'tag:inbox'],
      \['new', 'tag:inbox and tag:unread'],
      \['unread', 'tag:unread'],
      \]
