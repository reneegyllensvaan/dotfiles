#!/bin/bash
# Wayland version of info-hackspeed.
# Uses wev (Wayland equivalent of xinput test) to count keypresses.
# Falls back to evtest if wev isn't available.

METRIC=cpm  # cpm or wpm
INTERVAL=20

multiply_by=60
divide_by=$INTERVAL

case "$METRIC" in
    wpm) divide_by=$((divide_by * 5)) ;;
    cpm) ;;
    *) echo "Unsupported metric \"$METRIC\""; exit 1 ;;
esac

cache=$(mktemp hackspeed_cache.XXXXX)
trap 'rm "$cache"' EXIT

printf '' > "$cache"

# wev: Wayland event viewer. Filter key press events.
# If wev isn't available, try to find a keyboard device with evtest.
if command -v wev >/dev/null 2>&1; then
    wev -f wl_keyboard:key | \
        stdbuf -o0 awk '/pressed: 1/ {printf "."}' >> "$cache" &
elif command -v evtest >/dev/null 2>&1; then
    # find first keyboard device
    kbd=$(evtest --list-devices 2>/dev/null | awk '/keyboard|Keyboard/' RS= | head -1 | grep -o '/dev/input/event[0-9]*')
    if [ -n "$kbd" ]; then
        evtest --grab "$kbd" 2>/dev/null | \
            stdbuf -o0 awk '/EV_KEY.*value 1/ {printf "."}' >> "$cache" &
    else
        echo "No keyboard found"
        exit 0
    fi
else
    echo "No input tool (wev/evtest)"
    exit 0
fi

while true; do
    lines=$(stat --format %s "$cache" 2>/dev/null || echo 0)
    printf '' > "$cache"
    value=$((lines * multiply_by / divide_by))
    printf "# %d %s\\n" "$value" "$METRIC"
    sleep "$INTERVAL"
done
