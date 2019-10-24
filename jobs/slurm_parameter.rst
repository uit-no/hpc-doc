.. _slurm_parameter:

SLURM Workload Manager
=======================

SLURM is the workload manager and job scheduler used for Stallo.

There are two ways of starting jobs with SLURM; either interactively with ``srun``
or as a script with ``sbatch``.

Interactive jobs are a good way to test your setup before you put it into a script
or to work with interactive applications like MATLAB or python.
You immediately see the results and can check if all parts behave as you expected.
See :ref:`interactive` for more details.

SLURM Parameter
-----------------

SLURM supports a multitude of different parameters.
This enables you to effectivly tailor your script to your need when using Stallo
but also means that is easy to get lost and waste your time and quota.

The following parameters can be used as command line parameters with ``sbatch`` and
``srun`` or in jobscript, see :ref:`job_script_examples`.
To use it in a jobscript, start a newline with ``#SBTACH`` followed by the parameter.
Replace <....> with the value you want, e.g. ``--job-name=test-job``.


Basic settings:
+++++++++++++++

=============================    ===============================================================================
Parameter                        Function
=============================    ===============================================================================
--job-name=<name>                Job name to be displayed by for example ``squeue``
--output=<path>                  | Path to the file where the job (error) output is written to 
--mail-type=<type>               | Turn on mail notification; type can be one of BEGIN, END, FAIL, REQUEUE or ALL
--mail-user=<email_address>      Email address to send notifications to
=============================    ===============================================================================


Requesting Resources
+++++++++++++++++++++

=============================   ============================================================================================================================
Parameter                       Function
=============================   ============================================================================================================================
--time=<d-hh:mm:ss>             Time limit for job. Job will be killed by SLURM after time has run out. Format days-hours:minutes:seconds
--nodes=<num_nodes>             Number of nodes. Multiple nodes are only useful for jobs with distributed-memory (e.g. MPI).
--mem=<MB>                      Memory (RAM) per node. Number followed by unit prefix, e.g. 16G
--mem-per-cpu=<MB>              Memory (RAM) per requested CPU core
--ntasks-per-node=<num_procs>   Number of (MPI) processes per node. More than one useful only for MPI jobs. Maximum number depends nodes (number of cores)
--cpus-per-task=<num_threads>   CPU cores per task. For MPI use one. For parallelized applications benchmark this is the number of threads.
--ntasks-per-core=1             Disables hyperthreading.
--ntasks-per-core=2             Enables hyperthreading. Only useful in special circumstances.
--exclusive                     Job will not share nodes with other running jobs. You will be charged for the complete nodes even if you asked for less.
=============================   ============================================================================================================================


Accounting
+++++++++++++++++++++
See also :ref:`label_partitions`.

==================      ==========================================================================================================
Parameter               Function
==================      ==========================================================================================================
--account=<name>        Project (not user) account the job should be charged to.
--partition=<name>      Partition/queue in which o run the job. 
--qos=devel             On stallo the *devel* QOS (quality of servive) can be used to submit short jobs for testing and debugging.
==================      ==========================================================================================================


Advanced Job Control
+++++++++++++++++++++

==========================   ==================================================================================================================================================================
Parameter                    Function
==========================   ==================================================================================================================================================================
--array=<indexes>            Submit a collection of similar jobs, e.g. ``--array=1-10``. (sbatch command only). See official `SLURM documentation <https://slurm.schedmd.com/job_array.html>`_
--dependency=<state:jobid>   Wait with the start of the job until specified dependencies have been satified. E.g. --dependency=afterok:123456
==========================   ==================================================================================================================================================================
