#!/bin/bash -l

# Note that this is a setup for the highmem 128GB nodes. To run on the regular
# nodes, change to the normal partition and reduce the memory requirement.
#####################################
#SBATCH --job-name=comsol_runex
#SBATCH --nodes=2
#SBATCH --cpus-per-task=16      # Highmem nodes have 16 cores
#SBATCH --mem-per-cpu=7500MB    # Leave some memory for the system to work
#SBATCH --time=0-01:00:00       # Syntax is DD-HH:MM:SS
#SBATCH --partition=highmem     # For regular nodes, change to "normal"
#SBATCH --mail-type=ALL         # Notify me at start and finish
#SBATCH --exclusive             # Not necessary, implied by the specs above
##SBATCH --account=nnXXXXk      # Change to your account and uncomment
#####################################

# define input
inp=$1  # First input argument: Name of input without extention
std=$2  # Second input argument: Type of study
ext=mph # We use the same naming scheme as the software default extention

# define directories
submitdir=${SLURM_SUBMIT_DIR}
workdir=/global/work/${USER}/${SLURM_JOBID}

# create work directory
mkdir -p ${workdir}

# move input to workdir
cp ${inp}.${ext} ${workdir}

# load necessary modules
module purge --quiet
module load COMSOL/5.3-intel-2016a

# run calculation in workdir
cd ${workdir}
time comsol -nn ${SLURM_NNODES}\
            -np ${SLURM_CPUS_PER_TASK}\
            -mpirsh /usr/bin/ssh\
            -mpiroot $I_MPI_ROOT\
            -mpi intel batch\
            -inputfile ${inp}.${ext}\
            -outputfile ${inp}_out.${ext}\
            -study ${std}\
            -mlroot /global/apps/matlab/R2014a

# move output back
mv *out* $submitdir

# cleanup
cd $submitdir
rm -r ${workdir}

exit 0
