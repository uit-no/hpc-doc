#!/bin/bash -l

################### VASP Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for a given set of nodes and cores. cores. Stallo has got
# 16 or 20 cores/node, so you need to know what you want.
# Runtime for this job is 59 minutes; syntax is hh:mm:ss.
# Memory si set to the maximum amound adviced when asking for a full node, it
# adds up to 30 000MB, leaving a small part for the system to use. Memory
# can be specified pr core, virtual or total pr job (be carefull).
#-------------------------------------
# SLURM-section
#SBATCH --job-name=vasp_runex
#SBATCH -N 2
#SBATCH --ntasks-per-node=20
#SBATCH --time=02:00:00
##SBATCH --mem-per-cpu=1500MB
#SBATCH --output=vasp_runex.log
#SBATCH --mail-type=ALL
#SBATCH --exclusive
#SBATCH --partition=multinode

######################################
# Section for defining job variables and settings:

proj=CeO2job # Name of job folder
input=${proj}/{INCAR,KPOINTS,POTCAR,POSCAR} # Input files from job folder

# We load all the default program system settings with module load:

module purge
module load VASP/5.4.1.plain
# You may check other available versions with "module avail VASP"

# Now we create working directory and temporary scratch for the job(s):
# Necessary variables are defined in the notur and the software modules.

export VASP_WORKDIR=/global/work/$USER/$SLURM_JOB_ID

mkdir -p /global/work/$USER/$SLURM_JOB_ID

# Preparing and moving inputfiles to tmp:

submitdir=$SLURM_SUBMIT_DIR
tempdir=$VASP_WORKDIR

cd $submitdir
cp $input $tempdir
cd $tempdir

######################################
# Section for running the program and cleaning up:

# Running the program:

time mpirun vasp_std

# Cleaning up and moving files back to home/submitdir:
# Make sure to move all essential files specific for the given job/software.

cp OUTCAR $submitdir/${input}.OUTCAR

# To zip some of the output might be a good idea!
#gzip $resultszip
#mv $resultzip.gz $submitdir/

# Investigate potentially other files to keep:
echo $(pwd)
echo $(ls -ltr)

# ALWAYS clean up after yourself. Please do uncomment the following line
# If we have to, we get really grumpy!
#cd $submitdir
#rm  $tempdir/*
#rmdir $tempdir

echo "Job finished at"
date
################### Job Ended ###################
exit 0
