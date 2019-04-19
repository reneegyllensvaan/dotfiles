#!/bin/sh
cat << EOF
default-cache-ttl 600
max-cache-ttl 7200
enable-ssh-support
pinentry-program $GUI_GPG_PINENTRY
extra-socket "$HOME/.gnupg/S.gpg-agent.extra"
EOF
