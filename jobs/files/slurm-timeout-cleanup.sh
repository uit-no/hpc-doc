#!/bin/bash -l

# job name
#SBATCH --job-name=example

# replace this by your account
#SBATCH --account=...

# one core only
#SBATCH --ntasks=1

# we give this job 4 minutes
#SBATCH --time=0-00:04:00

# asks SLURM to send the USR1 signal 120 seconds before end of the time limit
#SBATCH --signal=B:USR1@120

# define the handler function
# note that this is not executed here, but rather
# when the associated signal is sent
your_cleanup_function()
{
    echo "function your_cleanup_function called at $(date)"
    # do whatever cleanup you want here
}

# call your_cleanup_function once we receive USR1 signal
trap 'your_cleanup_function' USR1

echo "starting calculation at $(date)"

# the calculation "computes" (in this case sleeps) for 1000 seconds
# but we asked slurm only for 240 seconds so it will not finish
# the "&" after the compute step and "wait" are important
sleep 1000 &
wait
