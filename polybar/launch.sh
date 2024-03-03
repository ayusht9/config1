#!/bin/bash

# Check if Polybar is running
if pgrep -x polybar > /dev/null; then
    echo "Polybar is already running. Exiting..."
    exec killall polybar
fi

# Log a separator line to the file
echo "---" | tee -a /tmp/polybar.log

# Launch Polybar and append both stdout and stderr to the log file
nohup polybar bar >> /tmp/polybar.log 2>&1 &

# Disown the background process
disown

echo "Polybar launched..."
