#!/bin/sh
cat << EOF
# vim: ft=neomuttrc
set folder="$HOME/email/work"
set nm_default_uri="notmuch:///$HOME/email/work"
set sendmail="$HOME/.bin/gmi-send-work"
EOF
exit 0
