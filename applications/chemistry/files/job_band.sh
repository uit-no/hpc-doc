#!/bin/bash -l

################### ADF Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for a given set of cores nodes and cores. Stallo has got 16 or 20 cores/node,
# asking for something that adds up to both is our general recommodation (80, 160 etc), you would
# then need to use --ntasks instead of --nodes and --ntasks-per-node. (replace both).
# Runtime for this job is 59 minutes; syntax is hh:mm:ss.
# Memory is set to the maximum advised for a full node,
# of 30000MB/node and leaving some for the system to use. Memory
# can be specified pr core, virtual or total pr job (be carefull).
#-------------------------------------
# SLURM-section
#SBATCH --job-name=band_runex
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=20
#SBATCH --time=00:59:00
#SBATCH --mem-per-cpu=1500MB # Be ware of memory needs!
#SBATCH --output=band_runex.log
#SBATCH --mail-type=ALL
#SBATCH --exclusive
#SBATCH --partition=multinode

######################################
# Section for defining job variables and settings:


input=silicone # Name of input without extention
ext=adf # We use the same naming scheme as the software default, also for extention
cores=40  # Number of cores potentially used by mpi engine in submit procedure

# We load all the default program system settings with module load:

module --quiet purge
module load ADF/adf2017.108

# Now we create working directory and temporary scratch for the job(s):
# Necessary variables are defined in the notur and the software modules.

export SCM_TMPDIR=/global/work/$USER/$SLURM_JOBID
mkdir -p $SCM_TMPDIR

# Preparing and moving inputfiles to tmp:

submitdir=$SLURM_SUBMIT_DIR
tempdir=$SCM_TMPDIR

cd $submitdir
cp ${input}.${ext} $tempdir
cd $tempdir

# In case necessary, set SCM_IOBUFFERSIZE
#export SCM_IOBUFFERSIZE=1024 # Or higher if necessary.

######################################
# Section for running the program and cleaning up:

# Running the program:

time band  -n $cores < ${input}.${ext} > band_$input.out

# Cleaning up and moving files back to home/submitdir:
# Make sure to move all essential files specific for the given job/software.

cp band_$input.out $submitdir/band_$input.out
cp TAPE21 $submitdir/$input.t21

# To zip some of the output might be a good idea!
#gzip $input.t21
#mv $input.t21.gz $submitdir/

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
