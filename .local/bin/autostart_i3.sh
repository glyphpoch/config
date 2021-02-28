#!/bin/bash

set -eu

COLOUR_TEMP_APP=redshift
COMPOSITOR=picom
NOTIFICATION_DAEMON=dunst
IDLE="xset s off -dpms"
KEYBOARD_LAYOUT=gb
WALLPAPER=$HOME/.config/wallpapers/ubuntu16.png

# Start colour temperature adjustment app
killall -q ${COLOUR_TEMP_APP} ||
while pgrep -x ${COLOUR_TEMP_APP}  >/dev/null; do sleep 1; done
${COLOUR_TEMP_APP} &

# Start the compositor
killall -q ${COMPOSITOR} ||
while pgrep -x ${COMPOSITOR}  >/dev/null; do sleep 1; done
${COMPOSITOR} &

# Start the notification daemon
killall -q ${NOTIFICATION_DAEMON} ||
while pgrep -x ${NOTIFICATION_DAEMON}  >/dev/null; do sleep 1; done
${NOTIFICATION_DAEMON} &

# Set up idle timeouts/screen saver
${IDLE}

# Set keyboard layout
setxkbmap -layout ${KEYBOARD_LAYOUT}

# Set wallpaper
feh --bg-scale ${WALLPAPER}
