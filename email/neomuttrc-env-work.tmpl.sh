#!/bin/sh
cat << EOF
# vim: ft=neomuttrc
set folder="$HOME/email/work"
set nm_default_uri="notmuch:///$HOME/email/work"
set sendmail="`which msmtp 2>/dev/null`"
EOF
