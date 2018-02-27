#!/usr/bin/env bash

# Fake some work, $1 is the task number.
# Change this to whatever you want to have done.

# sleep between 0 and 10 secs
let sleeptime=10*$RANDOM/32768

echo "Task $1 is sleeping for $sleeptime seconds"
sleep $sleeptime
echo "Task $1 has slept for $sleeptime seconds"
