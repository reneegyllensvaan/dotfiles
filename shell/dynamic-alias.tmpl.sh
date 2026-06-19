cat << EOF
# Generated from dotfiles/shell/dynamic-alias.tmpl.sh
`which 2>&1 >/dev/null gsed && echo "alias sed='gsed'"`
`which 2>&1 >/dev/null ggrep && echo "alias grep='ggrep'"`
`which 2>&1 >/dev/null bat && echo "alias cat='bat'"`
EOF
exit 0
