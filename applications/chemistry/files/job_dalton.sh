#!/bin/bash -l

# Write the account to be charged here
# (find your account number with `cost`)
#SBATCH --account=nnXXXXk

#SBATCH --job-name=daltonexample

# we ask for 20 cores
#SBATCH --ntasks=20

# run for five minutes
#              d-hh:mm:ss
#SBATCH --time=0-00:05:00

# 500MB memory per core
# this is a hard limit
#SBATCH --mem-per-cpu=500MB

# Remove percentage signs to turn on all mail notification
#%%%SBATCH --mail-type=ALL

# You may not place bash commands before the last SBATCH directive!

# Load Dalton
# You can find all installed Dalton installations with:
#   module avail dalton
module load Dalton/2013.2

# Define the input files
molecule_file=caffeine.mol
input_file=b3lyp_energy.dal

# Define and create a unique scratch directory
SCRATCH_DIRECTORY=/global/work/${USER}/daltonexample/${SLURM_JOBID}
mkdir -p ${SCRATCH_DIRECTORY}
cd ${SCRATCH_DIRECTORY}

# Define and create a temp directory
TEMP_DIR=${SCRATCH_DIRECTORY}/temp
mkdir -p ${TEMP_DIR}

# copy input files to scratch directory
cp ${SLURM_SUBMIT_DIR}/${input_file} ${SLURM_SUBMIT_DIR}/${molecule_file} ${SCRATCH_DIRECTORY}

# run the code
dalton -N ${SLURM_NTASKS} -t ${TEMP_DIR} ${input_file} ${molecule_file}

# copy output and tar file to submit dir
cp *.out *.tar.gz ${SLURM_SUBMIT_DIR}

# we step out of the scratch directory and remove it
cd ${SLURM_SUBMIT_DIR}
rm -rf ${SCRATCH_DIRECTORY}

# happy end
exit 0
