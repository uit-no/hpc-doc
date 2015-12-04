#!/usr/bin/env bash

# fake some work, $1 is the task number
# change this to whatever you want to have done

# sleep between 0 and 10 secs
let sleeptime=10*$RANDOM/32768

echo "task $1 is sleeping for $sleeptime seconds"
sleep $sleeptime
echo "task $1 has slept for $sleeptime seconds"
