#!/bin/sh
# Don't believe the warning below: this is the file you want to edit

echo "# Generated from dotfiles/shell/alias-generated.tmpl.sh"
echo ""

try_override () {
  if which $2 >/dev/null 2>&1; then
    eval "$1='$2'"
    echo "alias $1='$2'"
  else
    ls='ls'
  fi
}

try_override  sed   gsed
try_override  grep  ggrep
# try_override  cat   bat
try_override  ls    exa
try_override  vim   nvim

cat << EOF

alias lass='$ls -lahg --color=always | less -R'
alias la='$ls -lahg'
EOF
exit 0
