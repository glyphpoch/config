#!/bin/bash

set -e

# Kill all bars
killall -q polybar ||

# Wait for the bars to exit
while pgrep -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
done

