#!/bin/bash
##################     ADF Program System Job-script Stallo   #####################
#
# PBS-section 
#PBS -l nodes=2:ppn=20,walltime=00:59:00
#------------------------------
# Number of cores is 40 total for the job, remark that Stallo has got 16 or 20 cores/node,
# thus specifying number that both adds up to is our general recommodation (80, 160, 240,...)
# Runtime for this job is 59 minutes; syntax is hh:mm:ss. Only one number indicates seconds.
# Memory not set since you are using full node, use either pmem or pvmem (or mem, but be carefull).
#------------------------------
#PBS -N adf_example
#PBS -o adf_example.log
#PBS -j oe
#PBS -m ae
#PBS -V
#
#####################################################################
# Area for defining variables:

jobname=adf_example # Name of input-file without extention.
cores=40 # Number of nodes, used by mpi engine in submit procedure

##############################################################################
#
# We load all the default program system settings with module load:
#
module load notur
module swap openmpi impi
module load adf
#
# NB: Check other available versions with "module avail adf"
##############
# Now we specify working directory and temporary scratch for the job(s):
# SCRATCH and SUBMITDIR are defined in the notur module.
SCRATCH=$SCM_TMPDIR
mkdir -p $SCRATCH
cd $SUBMITDIR
# In case necessary, set SCM_IOBUFFERSIZE
#export SCM_IOBUFFERSIZE=512

# Preparing and moving inputfiles to scratch:
cp $jobname.inp $SCRATCH
cd $SCRATCH
#############
# Running ADF:

$ADFBIN/adf  -n $cores < $jobname.inp > $jobname.out
###### Cleaning up and moving files back to SUBMITDIR:
mv TAPE21 $SUBMITDIR/$jobname-stallo.t21
mv $jobname.out $SUBMITDIR/$jobname.out
# To zip this file might be a good idea!
#
# Other files you want to keep?
echo `pwd`
echo `ls -ltr`
cd $SUBMITDIR
# ALLWAYS clean up after yourself. Please do uncomment the following line
#rm  $SCRATCH/*
#rmdir $SCRATCH
#
echo "Job finished at"
date
############# ADF Job Ended #################
exit 0

