#!/bin/sh
cat << EOF
default-cache-ttl 600
max-cache-ttl 7200
enable-ssh-support
pinentry-program $DOT_GUI_GPG_PINENTRY
EOF
