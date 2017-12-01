#!/bin/env bash -l

#####################################
# SLURM-section
# Note that this is a setup for the highmem 128GB nodes and will not work in normal partition.
#SBATCH --job-name=comsol_runex
#SBATCH -N 2 --ntasks-per-node=16
#SBATCH --mem-per-cpu=7500MB # Leaving some memory for the system to work. 
#SBATCH --time=0-01:01:00 # Syntax is DD-HH:MM:SS
#SBATCH --partition=highmem # Necessary for running on high mem nodes.
#SBATCH --mail-type=ALL
#SBATCH --exclusive # Since you do not want to share this node. 
#####################################

input=$1 # Name of input without extention.
ext=mph # We use the same naming scheme as the software default extention
study=$2 # To be able to add parameter outside of the script. 
# If necessary, you can also define a project here.
############
# We need to prepare for jobs running on /global/work by making
# a temp file for this job and moving input there:
submitdir=$SLURM_SUBMIT_DIR
comsol_wrk=/global/work/$USER/$SLURM_JOBID
makedir -p comsol_wrk
cp $input.$ext $comsol_wrk
cd $comsol_wrk
############
# Now there is time to prepare the software to do the job;

module purge
module load COMSOL/5.3-intel-2016a
# Now we are ready to submit job to batch system:

time comsol -nn $SLURM_JOB_NUM_NODES -np $SLURM_NTASKS batch -inputfile $inp.$ext  -outputfile ${inp}_out.$ext  -study $study

# I allways like to have a timer on, maybe one weird tic of mine. I also exploit some
# built in features and slurm variables in this submit line.

#############

# When time is done, time to clean up
# First we move home results:
#mv *.out $project/

mv *out* $submitdir
cd ..
##rm -fr $scratchdisk 

exit 0

