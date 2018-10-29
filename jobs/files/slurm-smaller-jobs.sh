#!/bin/bash

#SBATCH --job-name=example
#SBATCH --ntasks=20
#SBATCH --time=0-00:05:00
#SBATCH --mem-per-cpu=500MB

cd ${SLURM_SUBMIT_DIR}

# first set of parallel runs
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &

wait

# here a post-processing step
# ...

# another set of parallel runs
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &
mpirun -n 4 ./my-binary &

wait

exit 0
