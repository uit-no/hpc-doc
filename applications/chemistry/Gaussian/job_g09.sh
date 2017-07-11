#!/bin/bash -l
################### Gaussian Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for a given set of cores. Stallo has got 16 or 20 cores/node,
# asking for something that adds up to both is our general recommodation (80, 160 etc)
# Runtime for this job is 59 minutes; syntax is hh:mm:ss. 
# Memory not set since you are using full node, 
# it can be specified pr core, virtual or total pr job (be carefull).   
#-------------------------------------
# SLURM-section 
#SBATCH --job-name=g09_runex
#SBATCH -N 2 
#SBATCH --ntasks-per-node=20
#SBATCH --time=00:59:00
#SBATCH --mem-per-cpu=1500MB
#SBATCH --output=g09_runex.log
#SBATCH --mail-type=ALL
#SBATCH --exclusive
#SBATCH --partition=gaussian
######################################
# Section for defining job variables and settings:
#-------------------------------------
# Area for defining variables:

input=caffeine # Name of input without extention 
extention=com # We use the same naming scheme as the software default

#-------------------------------

# We load all the default program system settings with module load:

module load Gaussian/09.d01

# Check other available versions with "module avail gaussian"

#-------------------------------

# Now we create working directory and temporary scratch for the job(s):
# Necessary variables are defined in the notur and the software modules.

export GAUSS_SCRDIR=/global/work/$USER/$SLURM_JOB_ID
export SUBMITDIR=$SLURM_SUBMIT_DIR

mkdir -p $GAUSS_SCRDIR

# Preparing and moving inputfiles to tmp:

cp $SUBMITDIR/caffeine.com $GAUSS_SCRDIR
cd $GAUSS_SCRDIR

# Preparation of inputfile is done by G09.prep in folder $g09tooldir
# If you want to inspect it, cd $g09tooldir after loading the gaussian module

G09.prep.slurm $input

######################################
# Section for running the program and cleaning up:
#-------------------------------------

# Running the program:

time g09 < $input.com > gaussian_$input.out

# Cleaning up and moving files back to home/submitdir:
# Make sure to move all essential files 
# specific for the given job/software.

cp gaussian_$input.out $SUBMITDIR
cp $input.chk $SUBMITDIR

# To zip some of the output might be a good idea!

# Investigate potentially other files to keep:
echo `pwd`
echo `ls -ltr`

# ALLWAYS clean up after yourself. Please do uncomment the following line
#cd $SUBMITDIR
#rm  $GAUSS_SCRDIR/*
#rmdir $GAUSS_SCRDIR


echo "Job finished at"
date
################### Job Ended ###################
exit 0

