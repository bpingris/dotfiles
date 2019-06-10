#!/usr/bin/env bash

# self explanatoty
killall -q polybar

# wait for the bar to be killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar bar

echo "Bar launched!"
