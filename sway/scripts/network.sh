#!/bin/bash
# Shared: network status for waybar.
# Same logic as polybar/scripts/network.sh

IFACE=wlan0

ssid=$(iw dev "$IFACE" info 2>/dev/null | awk '/ssid/ {sub(/^[[:space:]]*ssid /,""); print}')
signal=$(awk -v iface="$IFACE:" '$1==iface {print int($3)}' /proc/net/wireless 2>/dev/null)
ip=$(ip -br addr show "$IFACE" 2>/dev/null | awk '{print $3}' | cut -d/ -f1)

# rx_file="/tmp/waybar_net_rx_$IFACE"
# tx_file="/tmp/waybar_net_tx_$IFACE"
# rx_cur=$(awk -v iface="$IFACE:" '$1==iface {print $2}' /proc/net/dev)
# tx_cur=$(awk -v iface="$IFACE:" '$1==iface {print $10}' /proc/net/dev)
# rx_prev=$(cat "$rx_file" 2>/dev/null || echo "$rx_cur")
# tx_prev=$(cat "$tx_file" 2>/dev/null || echo "$tx_cur")
# echo "$rx_cur" > "$rx_file"
# echo "$tx_cur" > "$tx_file"
# rx_delta=$((rx_cur - rx_prev))
# tx_delta=$((tx_cur - tx_prev))
# format_rate() {
#     local bytes=$1
#     if [ "$bytes" -ge 1048576 ]; then
#         echo "$((bytes / 1048576)).$(((bytes % 1048576) * 10 / 1048576))M"
#     elif [ "$bytes" -ge 1024 ]; then
#         echo "$((bytes / 1024))K"
#     else
#         echo "${bytes}B"
#     fi
# }
# rx_str=$(format_rate $rx_delta)
# tx_str=$(format_rate $tx_delta)

if [ -n "$ssid" ]; then
    # echo "Net:${ssid} ${signal}%  ${ip}  v${rx_str} ^${tx_str}/s"
    echo "Net:${ssid} ${signal}%  ${ip}"
else
    echo "Net:down"
fi
