#!/bin/bash -l

################### Gaussian Job Batch Script Example ###################
# SLURM-section
#SBATCH --job-name=gaussian_runex
#SBATCH --ntasks=80
## Stallo has got 16 or 20 cores/node, thus the optimal distribution of cores will be a number that is a full number sum of both subsets.
#SBATCH --time=00:59:00 # Syntax is DD-HH:MM:SS.
#SBATCH --mem-per-cpu=1500MB # Giving a total of 30 000MB/node and leaving a bit over 2GB for the system to survive.
#SBATCH --output=gaussina_runex.log
#SBATCH --mail-type=ALL
#SBATCH --exclusive
######################################

# Defining job other job variable and settings:

input=caffeine # Name of input without extention
ext=com # We use the same naming scheme as the software default extention

# We load all the default program system settings with module load:
# But first we flush the environment for unwanted settings

module --quiet purge
module load Gaussian/g16_B.01

# This one is important; setting the heap-size for the job to 20GB:
export GAUSS_LFLAGS2="--LindaOptions -s 20000000"

# Now we create working directory and temporary scratch for the job(s):
# We assume no predefined variables except defaults from used software.

export GAUSS_SCRDIR=/global/work/$USER/$SLURM_JOB_ID
mkdir -p $GAUSS_SCRDIR

# Preparing and moving inputfiles to tmp:

submitdir=$SLURM_SUBMIT_DIR # Assuming slurm batch resource allocation system
tempdir=$GAUSS_SCRDIR

cp $submitdir/${input}.${ext} $tempdir
cd $tempdir

# Typically Gaussian creates rather large temp-files, and they will clog physical drives easilly of not split into smaller parts:

lfs setstripe –c 8 .

# NOTE: Preparation of inputfile is done by the wrapper. For convenience we have moved the wrapper to work as an intermediate step around the binary, the old setup
# does exist but requires that you uncomment the lines below and comment the lines in the  "Running the program"-paragraph.

#Gaussian.prep $input
#time g16 < ${input}.${ext} > gaussian_$input.out # This is for Gaussian 16, for Gaussian 09 you need g09.

# Running the program and cleaning up:

# NOTE: We have now placed a wrapper around the binary so that the startup command for Gaussian has changed.

time g16.ib ${input}.${ext} > gaussian_$input.out

cp gaussian_$input.out $submitdir
cp $input.chk $submitdir

# Make sure to move all essential files specific for the given job/software.
# To zip some of the output might be a good idea if the resultsfiles are large.

# ALWAYS clean up after yourself. Please do uncomment the following line
#cd $submitdir
#if [ -z $tempdir ]
#then
#    echo "tempdir not set, please clean up manually!"
#else
#    cd $tempdir
#    rm *
#    cd $submitdir
#    rmdir $temdir
#fi
#
echo "Job finished at"
date
#
exit 0
