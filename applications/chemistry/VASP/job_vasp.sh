#!/bin/bash -l
################### VASP Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for a given set of cores. Stallo has got 16 or 20 cores/node,
# asking for something that adds up to both is our general recommodation (80, 160 etc)
# Runtime for this job is 59 minutes; syntax is hh:mm:ss. 
# Memory not set since you are using full node, 
# it can be specified pr core, virtual or total pr job (be carefull).   
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
#-------------------------------------
# Area for defining variables:

input=CeO2job # Name of job folder

#-------------------------------

# We load all the default program system settings with module load:

module purge
module load notur
module load VASP/5.4.1.plain

# Check other available versions with "module avail vasp"

#-------------------------------

# Now we create working directory and temporary scratch for the job(s):
# Necessary variables are defined in the notur and the software modules.

export SUBMITDIR=$SLURM_SUBMIT_DIR
export WORKDIR=/global/work/$USER/$SLURM_JOB_ID

mkdir -p /global/work/$USER/$SLURM_JOB_ID

# Preparing and moving inputfiles to tmp:

cd $SUBMITDIR
cp $input/{INCAR,KPOINTS,POTCAR,POSCAR} $WORKDIR
cd $WORKDIR

######################################
# Section for running the program and cleaning up:
#-------------------------------------

# Running the program:

time mpirun vasp_std

# Cleaning up and moving files back to home/submitdir:
# Make sure to move all essential files 
# specific for the given job/software.

cp OUTCAR $SUBMITDIR/${input}.OUTCAR

# To zip some of the output might be a good idea!
#gzip $resultszip
#mv $resultzip.gz $SUBMITDIR/

# Investigate potentially other files to keep:
echo `pwd`
echo `ls -ltr`

# ALLWAYS clean up after yourself. Please do uncomment the following line
# If we have to, we get really grumpy!
#cd $SUBMITDIR
#rm  $WORKDIR/*
#rmdir $WORKDIR

echo "Job finished at"
date
################### Job Ended ###################
exit 0

