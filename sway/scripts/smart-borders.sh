#!/bin/bash
# Show title bars only when workspace has >1 tiling window.
swaymsg -t subscribe -m '["window","workspace"]' | while read -r _; do
    sleep 0.05
    swaymsg -t get_tree | jq -r '
        recurse(.nodes[]?, .floating_nodes[]?)
        | select(.type == "workspace")
        | "\(.name) \([
              recurse(.nodes[]?, .floating_nodes[]?)
              | select(.type == "con" and .app_id != null and .visible == true)
            ] | length)"' | while read -r ws count; do
        if [ "$count" -gt 1 ]; then
            swaymsg "[workspace=$ws] border normal"
        else
            swaymsg "[workspace=$ws] border pixel 1"
        fi
    done
done
