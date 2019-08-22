#!/bin/bash -l

#SBATCH --account=nn....k

#SBATCH --job-name=example
#SBATCH --output=example.log

# Stallo nodes have either 16 or 20 cores: 80 is a multiple of both
#SBATCH --ntasks=80

# make sure no other job runs on the same node
#SBATCH --exclusive

# syntax is    DD-HH:MM:SS
#SBATCH --time=00-00:30:00

# allocating 30 GB on a node and leaving a bit over 2 GB for the system
#SBATCH --mem-per-cpu=1500MB

################################################################################
# no bash commands above this line
# all sbatch directives need to be placed before the first bash command

# name of the input file without the .com extention
input=example

# flush the environment for unwanted settings
module --quiet purge
# load default program system settings
module load Gaussian/g16_B.01

# set the heap size for the job to 20 GB
export GAUSS_LFLAGS2="--LindaOptions -s 20000000"

# split large temporary files into smaller parts
lfs setstripe –c 8 .

# create scratch space for the job
export GAUSS_SCRDIR=/global/work/${USER}/${SLURM_JOB_ID}
tempdir=${GAUSS_SCRDIR}
mkdir -p ${tempdir}

# copy input and checkpoint file to scratch directory
cp ${SLURM_SUBMIT_DIR}/${input}.com ${tempdir}
if [ -f "${SLURM_SUBMIT_DIR}/${input}.chk" ]; then
    cp ${SLURM_SUBMIT_DIR}/${input}.chk ${tempdir}
fi

# run the code
cd ${tempdir}
time g16.ib ${input}.com > ${input}.out

# copy output and checkpoint file back
cp ${input}.out ${SLURM_SUBMIT_DIR}
cp ${input}.chk ${SLURM_SUBMIT_DIR}

# remove the scratch directory after the job is done
# cd ${SLURM_SUBMIT_DIR}
# rm -rf /global/work/${USER}/${SLURM_JOB_ID}

exit 0
