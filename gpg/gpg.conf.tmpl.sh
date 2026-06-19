#!/bin/sh
cat << EOF
# Generated from dotfiles/gpg/gpg.conf.tmpl.sh
keyserver-options auto-key-retrieve
no-emit-version
use-agent
#no-tty
default-key $GPG_FINGERPRINT
EOF
exit 0
