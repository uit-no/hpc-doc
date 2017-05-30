#!/bin/bash -l
################### Gaussian Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for a given set nodes and cores/node. Stallo has got 20 cores/node,
# asking for full nodes will make your life easier!) 
# Runtime for this job is 59 minutes; syntax is dd-hh:mm:ss.
# Memory is set to 1500MB; but does really not matter since you are using full node.
# Though it is worth noting that memory settings for slurm seems to be a hard limit,
# it can be specified pr core or total pr job/node (be carefull with the latter).   
#-------------------------------------
# SLURM-section 
#SBATCH --job-name=g09_runex
#SBATCH -N 2
#SBATCH --ntasks-per-node=20
#SBATCH --time=00-00:59:00
#SBATCH --mem-per-cpu=1500MB
#SBATCH --output=g09_runex.log
#SBATCH --mail-type=ALL
#SBATCH --partition=gaussian
######################################
# Section for defining job variables and settings:
#-------------------------------------
# Area for defining variables:

input=caffeine # Name of input without extention 
extention=com # We use the same naming scheme as the software default

#-------------------------------

# We load all the default program system settings with module load:

module load notur
module load Gaussian/09.d01

# Check other available versions with "module avail gaussian"

#-------------------------------

# Now we create working directory and temporary scratch for the job(s):
# Necessary variables are defined in the notur and the software modules.

export GAUSS_SCRDIR=/global/work/$USER/$SLURM_JOB_ID

mkdir -p $GAUSS_SCRDIR
echo " The job will use scratch directory ${GAUSS_SCRDIR}." # Message written to log for safety measure.

# Preparing and moving inputfiles to tmp:

cd $SUBMITDIR
cp $input.com $GAUSS_SCRDIR

# Checking for old job files to do restart from:
if [ -f $input.chk ]
then
        echo "Copying chk-file to scratch."
        cp $input.chk $GAUSS_SCRDIR
else
        echo "No chk file found."
        echo "Starting the gaussian job without a checkpointfile."
fi

cd $GAUSS_SCRDIR

# Preparation of inputfile is done by G09.prep.slurm in folder $g09tooldir
# If you want to inspect it, cd $g09tooldir after loading the gaussian module

G09.prep $input

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

