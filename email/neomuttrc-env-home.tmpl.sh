#!/bin/sh
cat << EOF
# Generated from dotfiles/email/neomuttrc-env-home.tmpl.sh
# vim: ft=neomuttrc
set folder="$HOME/email/home"
set nm_default_uri="notmuch:///$HOME/email/home"
set sendmail="$HOME/.bin/gmi-send-home"
EOF
exit 0
