#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# launch Polybar, using default config location ~/.config/polybar/config
for m in $(polybar --list-monitors | cut -d":" -f1); do 
	MONITOR=$m polybar --reload mybar &
done
echo "Polybar launched..."
