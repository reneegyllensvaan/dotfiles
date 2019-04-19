#!/bin/sh
cat << EOF
set folder="$HOME/email/work"
set nm_default_uri="notmuch:///$HOME/email/work" 
set sendmail="`which sendmail`"
EOF
