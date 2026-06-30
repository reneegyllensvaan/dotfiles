#!/bin/sh
cat << EOF
# Generated from dotfiles/sway/fuzzel.ini.tmpl.sh
[colors]
background=${BACKGROUND}ff
text=${FOREGROUND}ff
match=${COLOR04}ff
selection=${COLOR08}ff
selection-text=${FOREGROUND}ff
selection-match=${COLOR04}ff
border=${COLOR08}ff
EOF
exit 0
