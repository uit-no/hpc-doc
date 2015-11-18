#!/usr/bin/env bash

# which account to charge
#PBS -AnnXXXXk

# we run on two nodes, 40 cores in total
#PBS -lnodes=2:ppn=20

# we run for max 10 minutes
#PBS -lwalltime=00:10:00

# no bash command may be placed before the last PBS directive

# create temporary scratch area for this job on the global file system
SCRATCH_DIRECTORY=/global/work/$USER/$PBS_JOBID
mkdir -p $SCRATCH_DIRECTORY

# we will run the calculation in the scratch directory and not
# in the home directory
cd $SCRATCH_DIRECTORY

# here we execute an MPI-parallel binary
mpirun -np $PBS_NP $PBS_O_WORKDIR/my_binary > $PBS_O_WORKDIR/my_output.txt

# before cleaning up remember to copy back important files

# clean up the scratchdir (commented out)
# cd /tmp
# rm -rf $SCRATCH_DIRECTORY
