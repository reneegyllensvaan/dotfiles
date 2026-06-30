#!/bin/bash
# Logitech mouse battery via kernel hidpp power_supply
# Only shows if a Logitech HID++ device battery is present

battery_dir=/sys/class/power_supply/hidpp_battery_0

[ -d "$battery_dir" ] || exit 0

read -r capacity < "$battery_dir/capacity" 2>/dev/null || exit 0
read -r status < "$battery_dir/status" 2>/dev/null

case "$status" in
    Charging) icon="+" ;;
    Full)     icon="=" ;;
    *)        icon=""  ;;
esac

echo "Mb${icon} ${capacity}%"
