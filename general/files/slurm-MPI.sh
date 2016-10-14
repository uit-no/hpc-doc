#!/bin/bash

####################################
# example for a multi-node MPI job #
####################################
# This script asks for a given set of cores. Stallo has got 16 or 20 cores/node,
# asking for something that adds up to both is our general recommodation (80, 160 etc)
# Runtime for this job is 5 minutes; syntax is dd-hh:mm:ss. 
# Memory is set to 1500MB; this should not matter as long as you are running on full nodes. 
# Though it is worth noting that memory settings for slurm seems to be a hard limit,
# it can be specified pr core or total pr job/node (be carefull with the latter).   
# Note also that we have specified 1500MB and NOT 1.5 GB. (that leaves a small bit for the system).

#SBATCH --job-name=example_job

# 80 MPI tasks in total
#SBATCH --ntasks=80

# run for five minutes
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00
# If you plan to run for much longer, please check necessary partions
# with sinfo. For multinode mpi jobs it would be --partition=multinode.
# 1500MB memory per core
#SBATCH --mem-per-cpu=1500MB

# turn on all mail notification
#SBATCH --mail-type=ALL

# no bash command may be placed before the last SBATCH directive

# $SCRATCH will be set to /global/work/$USER/$SLURM_JOBID.stallo-adm.uit.no
mkdir -p $SCRATCH
cd $SCRATCH

# we copy everything we need to the scratch directory
# $SLURM_SUBMIT_DIR points to the path where this script was submitted from
cp $SLURM_SUBMIT_DIR/my_binary.x $SCRATCH

# we execute the job and time it
time mpirun ./my_binary.x > my_output

# after the job is done we copy our output back to $SLURM_SUBMIT_DIR
cp $SCRATCH/my_output $SLURM_SUBMIT_DIR

# we step out of $SCRATCH and remove it
cd $SLURM_SUBMIT_DIR
rm -rf $SCRATCH

# happy end
exit 0
