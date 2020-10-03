#!/bin/sh
cat << EOF
# vim: ft=neomuttrc
set folder="$HOME/email/home"
set nm_default_uri="notmuch:///$HOME/email/home"
set sendmail="$HOME/.bin/gmi-send-home"
EOF
exit 0
