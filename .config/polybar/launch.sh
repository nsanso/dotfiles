#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

# Launch bars in all monitors
if type "xrandr"; then
	for M in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		echo "---" | tee -a /tmp/polybar-$M.log
		MONITOR=$M polybar bar 2>&1 | tee -a /tmp/polybar-$M.log & disown
	done
else
	echo "---" | tee -a /tmp/polybar.log
	polybar bar 2>&1 | tee -a /tmp/polybar.log & disown
fi

