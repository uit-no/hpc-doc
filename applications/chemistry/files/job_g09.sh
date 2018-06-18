#!/bin/bash -l

################### Gaussian Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for a given set of nodes and cores. Stallo has got 16 or 20 cores/node,
# so you need to know what you want.
# Runtime for this job is 59 minutes; syntax is hh:mm:ss.
# Memory is set to the maximum advised for a full node, 1500MB/core - giving a total
# of 30000MB/node and leaving some for the system to use. Memory
# can be specified pr core, virtual or total pr job (be carefull).
#-------------------------------------
# SLURM-section
#SBATCH --job-name=g09_runex
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=20
#SBATCH --time=00:59:00
#SBATCH --mem-per-cpu=1500MB
#SBATCH --output=g09_runex.log
#SBATCH --mail-type=ALL
#SBATCH --exclusive
#SBATCH --partition=gaussian # This is a particular gasussian partition due to some technicalities with SLURM.

######################################
# Section for defining job variables and settings:

input=caffeine # Name of input without extention
ext=com # We use the same naming scheme as the software default extention

# We load all the default program system settings with module load:

module --quiet purge
module load Gaussian/09.d01

# Now we create working directory and temporary scratch for the job(s):
# Necessary variables are defined in the notur and the software modules.

export GAUSS_SCRDIR=/global/work/$USER/$SLURM_JOB_ID

mkdir -p $GAUSS_SCRDIR

# Preparing and moving inputfiles to tmp:

submitdir=$SLURM_SUBMIT_DIR
tempdir=$GAUSS_SCRDIR

cp $submitdir/${input}.${ext} $tempdir
cd $tempdir

# Preparation of inputfile is done by G09.prep in folder $g09tooldir
# If you want to inspect it, cd $g09tooldir after loading the gaussian module

Gaussian.prep $input

######################################
# Section for running the program and cleaning up:

# Running the program:

time g09 < ${input}.${ext} > gaussian_$input.out

# Cleaning up and moving files back to home/submitdir:
# Make sure to move all essential files specific for the given job/software.

cp gaussian_$input.out $submitdir
cp $input.chk $submitdir

# To zip some of the output might be a good idea!
#gzip $resultszip
#mv $resultzip.gz $SUBMITDIR/

# Investigate potentially other files to keep:
echo $(pwd)
echo $(ls -ltr)

# ALWAYS clean up after yourself. Please do uncomment the following line
#cd $submitdir
#rm  $tempdir/*
#rmdir $tempdir

echo "Job finished at"
date
################### Job Ended ###################
exit 0
