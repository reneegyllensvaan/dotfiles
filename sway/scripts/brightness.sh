#!/bin/bash
# Shared: brightness percentage for waybar.
# Same logic as polybar/scripts/brightness.sh

if [ -d /sys/class/backlight/nvidia_0 ]; then
    max=$(cat /sys/class/backlight/nvidia_0/max_brightness)
    cur=$(cat /sys/class/backlight/nvidia_0/brightness)
    echo "Bri:$(( cur * 100 / max ))%"
elif [ -d /sys/class/backlight/intel_backlight ]; then
    max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    cur=$(cat /sys/class/backlight/intel_backlight/brightness)
    echo "Bri:$(( cur * 100 / max ))%"
else
    # Fallback: use brightnessctl
    pct=$(brightnessctl -m 2>/dev/null | cut -d, -f4 | tr -d '%')
    echo "Bri:${pct}%"
fi
