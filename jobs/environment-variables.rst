

Job related environment variables
=================================

Here we list some environment variables that are defined when you run a job
script.  These is not a complete list. Please consult the SLURM documentation
for a complete list.

Job number::

  SLURM_JOBID
  SLURM_ARRAY_TASK_ID  # relevant when you are using job arrays

List of nodes used in a job::

  SLURM_NODELIST

Scratch directory::

  SCRATCH  # defaults to /global/work/${USER}/${SLURM_JOBID}.stallo-adm.uit.no

We recommend to **not** use $SCRATCH but to construct a variable yourself and use that in your script, e.g.::

  SCRATCH_DIRECTORY=/global/work/${USER}/my-example/${SLURM_JOBID}

The reason for this is that if you forget to sbatch your job script, then $SCRATCH may suddenly be undefined and you risk erasing your
entire /global/work/${USER}.

Submit directory (this is the directory where you have sbatched your job)::

  SUBMITDIR
  SLURM_SUBMIT_DIR

Default number of threads::

  OMP_NUM_THREADS=1

Task count::

  SLURM_NTASKS
