#!/bin/bash -l
#SBATCH --job-name=turbomole
#SBATCH --account=nnXXXXk
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=1000MB
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=20
#SBATCH --mail-type=ALL
#SBATCH --partition=multinode

# For TURBOMOLE v7.2:
# --nodes           : scale by the size of the calculation
# --ntasks-per-node : always a singel task per node
# --cpus-per-task   : always full nodes

# load modules
module --quiet purge
module load TURBOMOLE/7.2

# TURBOMOLE needs this variable
export TURBOTMPDIR=/global/work/${USER}/${SLURM_JOBID}
workdir=${TURBOTMPDIR}
submitdir=${SLURM_SUBMIT_DIR}

# copy files to work
mkdir -p $workdir
cd $workdir
cp $submitdir/* $workdir

# set parallel environment
export PARNODES=${SLURM_NTASKS}
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# run jobex calculation
dscf > dscf.out

# copy files back
mv * $submitdir

# clean up
rm -r $workdir

exit 0
