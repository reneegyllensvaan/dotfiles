#!/bin/sh
cat << EOF
keyserver-options auto-key-retrieve
no-emit-version
use-agent
#no-tty
default-key $GPG_FINGERPRINT
EOF
exit 0
