#!/bin/sh

< ~/.vim/files/recent.log \
  mawk \
  -v re="$HOME/Projects" \
  '-F;' \
  -v home="$HOME" \
  '$3 ~ re {
    sub(home, "~", $3)
    print $3
  }'\
  | sort \
  | uniq -c \
  | sort -nr \
  | grep -vE '^\s*(1|2)'
