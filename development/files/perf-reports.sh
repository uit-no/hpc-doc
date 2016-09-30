#!/usr/bin/env bash

#PBS -A_______
#PBS -lnodes=1
#PBS -lwalltime=00:10:00

module load perf-reports/5.1

# create temporary scratch area for this job on the global file system
SCRATCH_DIRECTORY=/global/work/$USER/$PBS_JOBID
mkdir -p $SCRATCH_DIRECTORY

# run the performance report
# all you need to do is to launch your "normal" execution
# with "perf-report"
cd $SCRATCH_DIRECTORY
perf-report mpiexec -n $PBS_NP $PBS_O_WORKDIR/example.x

# perf-report generates summary files in html and txt format
# we copy result files to submit dir
cp *.html *.txt $PBS_O_WORKDIR

# clean up the scratch directory
cd /tmp
rm -rf $SCRATCH_DIRECTORY
