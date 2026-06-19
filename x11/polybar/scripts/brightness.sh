#!/bin/bash
max=$(cat /sys/class/backlight/nvidia_0/max_brightness)
cur=$(cat /sys/class/backlight/nvidia_0/brightness)
echo "Bri:$(( cur * 100 / max ))%"
