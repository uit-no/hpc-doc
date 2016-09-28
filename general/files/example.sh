#!/bin/bash
# First example of running a parallel job under the batch system.
#
# allocate a total of 80 processes, since this is both dividable by 16 and 20.
#-----------------------
#SBATCH --job-name=Hello_World
#SBATCH --ntasks=80
# run for ten minutes
#SBATCH --time=0-00:10:00
#SBATCH --mem-per-cpu=1GB
#SBATCH --mail-type=ALL
#-----------------------

module load notur

mkdir -p $SCRATCH
cd $SUBMITDIR

cp hello_c_mpi.x $SCRATCH

cd $SCRATCH

time mpirun ./hello_c_mpi.x > hello.output

cp hello.output $SUBMITDIR
cd $SUBMITDIR

rm -rf $SCRATCH
