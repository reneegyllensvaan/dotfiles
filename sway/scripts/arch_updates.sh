#!/usr/bin/env bash
# Shared: arch updates count.
# Same logic as polybar/scripts/arch_updates.sh

set -euo pipefail

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(paru -Qum 2>/dev/null | wc -l); then
    updates_aur=0
fi

updates=$((updates_arch + updates_aur))

re='^[0-9]+$'
if ! [[ $updates_arch =~ $re ]]; then
   updates_aur=999; exit 1
fi

if ! [[ $updates_aur =~ $re ]]; then
   updates_aur=999; exit 1
fi

echo "P:$updates_arch Y:$updates_aur"
