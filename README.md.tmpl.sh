#!/bin/sh
cat << EOF
<!-- Generated from dotfiles/README.md.tmpl.sh -->
# Renee's dotfiles
i write these so i can write the code

EOF
cat etc/macos-setup.md

cat etc/linux-setup.md

exec true
