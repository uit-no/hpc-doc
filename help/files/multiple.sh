#!/usr/bin/env bash

# Jobscript example that can run several tasks in parallel.
# All features used here are standard in bash so it should work on
# any sane UNIX/LINUX system.
# Author: roy.dragseth@uit.no
#
# This example will only work within one compute node so let's run
# on one node using all the cpu-cores:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20

# We assume we will (in total) be done in 10 minutes:
#SBATCH --time=0-00:10:00

# Let us use all CPUs:
maxpartasks=$SLURM_TASKS_PER_NODE

# Let's assume we have a bunch of tasks we want to perform.
# Each task is done in the form of a shell script with a numerical argument:
# dowork.sh N
# Let's just create some fake arguments with a sequence of numbers
# from 1 to 100, edit this to your liking:
tasks=$(seq 100)

cd $SLURM_SUBMIT_DIR

for t in $tasks; do
  # Do the real work, edit this section to your liking.
  # remember to background the task or else we will
  # run serially
  ./dowork.sh $t &

  # You should leave the rest alone...

  # count the number of background tasks we have spawned
  # the jobs command print one line per task running so we only need
  # to count the number of lines.
  activetasks=$(jobs | wc -l)

  # if we have filled all the available cpu-cores with work we poll
  # every second to wait for tasks to exit.
  while [ $activetasks -ge $maxpartasks ]; do
    sleep 1
    activetasks=$(jobs | wc -l)
  done
done

# Ok, all tasks spawned. Now we need to wait for the last ones to
# be finished before we exit.
echo "Waiting for tasks to complete"
wait
echo "done"
