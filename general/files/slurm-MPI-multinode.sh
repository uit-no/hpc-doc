#!/bin/bash

####################################
# example for a multi-node MPI job #
####################################

#SBATCH --job-name=example_job

# 80 MPI tasks in total
#SBATCH --ntasks=80

# run for five minutes
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00

# 1GB memory per core
#SBATCH --mem-per-cpu=1GB

# turn on all mail notification
#SBATCH --mail-type=ALL

# no bash command may be placed before the last SBATCH directive

# $SCRATCH will be set to /global/work/$USER/$SLURM_JOBID.stallo-adm.uit.no
mkdir -p $SCRATCH
cd $SCRATCH

# we copy everything we need to the scratch directory
# $SLURM_SUBMIT_DIR points to the path where this script was submitted from
cp $SLURM_SUBMIT_DIR/my_binary.x $SCRATCH

# make sure that temporary message files are created on the local disk
# this is important for performance
export TMP=/tmp
export TEMP=/tmp
export TMPDIR=/tmp

# we execute the job and time it
time mpirun ./my_binary.x > my_output

# after the job is done we copy our output back to $SLURM_SUBMIT_DIR
cp $SCRATCH/my_output $SLURM_SUBMIT_DIR

# we step out of $SCRATCH and remove it
cd $SLURM_SUBMIT_DIR
rm -rf $SCRATCH

# happy end
exit 0
