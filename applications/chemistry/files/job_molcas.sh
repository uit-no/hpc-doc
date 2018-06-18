#!/bin/bash -l

################### VASP Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for a given set of cores nodes and cores. Stallo has got 16 or 20 cores/node,
# asking for something that adds up to both is our general recommodation (80, 160 etc), you would
# then need to use --ntasks instead of --nodes and --ntasks-per-node. (replace both).
# Runtime for this job is 59 minutes; syntax is hh:mm:ss.
# Memory is set to the maximum advised for a full node, 1500MB/core - giving a total
# of 30000MB/node and leaving some for the system to use. Memory
# can be specified pr core, virtual or total pr job (be carefull).
#-------------------------------------
# SLURM-section
#SBATCH --job-name=molcas_runex
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
##SBATCH --ntasks=20
#SBATCH --time=00:59:00
#SBATCH --mem-per-cpu=1500MB
#SBATCH --output=molcas_runex.log
#SBATCH --mail-type=ALL
#SBATCH --exclusive

######################################
# Section for defining job variables and settings:


proj=ehtane # Name of project/folder
input=C2H6 # Name of job input

# We load all the default program system settings with module load:

module --quiet purge
module load Molcas/molcas82-intel-2015a
# You may check other available versions with "module avail Molcas"

# Now we create working directory and temporary scratch for the job(s):
# Necessary variables are defined in the notur and the software modules.

export MOLCAS_WORKDIR=/global/work/$USER/$SLURM_JOBID
mkdir -p $MOLCAS_WORKDIR

# Preparing and moving inputfiles to tmp:

submitdir=$SLURM_SUBMIT_DIR
tempdir=$MOLCAS_WORKDIR

cd $submitdir
cp ${input}.* $tempdir
cd $tempdir

######################################
# Section for running the program and cleaning up:

# Running the program:
time molcas  Project=${proj} -f ${input}*.input

# Cleaning up and moving files back to home/submitdir:
# Make sure to move all essential files specific for the given job/software.

cp * $submitdir

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
