#!/bin/bash

# Rofi theme (change this to your custom theme if needed)
ROFI_CMD="rofi -dmenu -i -p Power"

# Options
options="Shutdown\nReboot\nLock\nSuspend\nLogout"

# Show menu
choice=$(echo -e "$options" | $ROFI_CMD)

# Handle choice
case "$choice" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Lock)
        if command -v swaylock &>/dev/null; then
            ~/.config/sway/lock.sh
        elif command -v betterlockscreen &>/dev/null; then
            betterlockscreen -l
        else
            notify-send "No lock command found"
        fi
        ;;
    Suspend)
        systemctl suspend
        ;;
    Logout)
        if command -v loginctl &>/dev/null; then
            loginctl terminate-user "$USER"
        else
            pkill -KILL -u "$USER"
        fi
        ;;
esac

