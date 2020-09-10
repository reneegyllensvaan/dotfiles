#!/bin/sh

< ~/.vim/files/recent-write.log \
  grep -v '/\.git/' \
  | mawk \
  -v re="$HOME/$1" \
  '-F;' \
  -v home="$HOME" \
  '$3 ~ re {
    sub(home, "~", $3)
    print $3
  }'\
  | sort \
  | uniq -c \
  | sort -nr \
  | grep -vE '^\s*(1|2) '
