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


Differences between CPUs and tasks
-------------------------------------

As a new users writing your first SLURM job script the difference between
``--ntasks`` and ``--cpus-per-taks`` is typically quite confusing.
Assuming you want to run your program on a single node with  16 cores which 
SLURM parameters should you specify?

The answer is it depends whether the your application supports MPI.
MPI (message passing protocol) is a communication interface used for developing 
parallel computing programs on distributed memory systems.
This is necessary for applications running on multiple computers (nodes) to be able to
share (intermediate) results.

To decide which set of parameters you should use, check if your application utilizes
MPI and therefore would benefit from running on multiple nodes simultaneously.
On the other hand you have an non-MPI enables application or made a mistake in 
your setup, it doesn't make sense to request more than one node.


Settings for OpenMP and MPI jobs
--------------------------------

Single node jobs
++++++++++++++++

For applications that are not optimized for HPC (high performance computing) systems
like simple python or R scripts and a lot of software which is optimized for desktop PCs.

Simple applications and scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Many simple tools and scripts are not parallized at all and therefore won't profit from
more than one CPU core.

=============================   ============================================================================================================================
Parameter                       Function
=============================   ============================================================================================================================
--nodes=1                       Start a unparallized job on only one node
--ntasks-per-node=1             For OpenMP, only one task is necessary
--cpus-per-task=1               Just one CPU core will be used.
--mem=<MB>                      Memory (RAM) for the job. Number followed by unit prefix, e.g. 16G
=============================   ============================================================================================================================

If you are unsure if your application can benefit from more cores try a higher number and
observe the load of your job. If it stays at approximately one there is no need to ask for more than one.


OpenMP applications
^^^^^^^^^^^^^^^^^^^
OpenMP (Open Multi-Processing) is a multiprocessing library is often used for programs on
shared memory systems. Shared memory describes systems which share the memory between all 
processing units (CPU cores), so that each process can access all data on that system.

=============================   ============================================================================================================================
Parameter                       Function
=============================   ============================================================================================================================
--nodes=1                       Start a parallel job for a shared memory system on only one node
--ntasks-per-node=1             For OpenMP, only one task is necessary
--cpus-per-task=<num_threads>   Number of threads (CPU cores) to use
--mem=<MB>                      Memory (RAM) for the job. Number followed by unit prefix, e.g. 16G
=============================   ============================================================================================================================


Multiple node jobs (MPI)
+++++++++++++++++++++++++

For MPI applications.

Depending on the frequency and bandwidth demand of your setup, you can either just start a number of MPI tasks request whole nodes.
While using whole nodes guarantees that a low latency and high bandwidth it usually results in a longer queuing time compared to cluster wide job.
With the latter the SLURM manager can distribute your task across all nodes of stallo and utilize otherwise unused cores on nodes which for example run a 16 core job on a 20 core node. This usually results in shorter queuing times but slower inter-process connection speeds.

To use whole nodes
^^^^^^^^^^^^^^^^^^

=============================   =============================================================================================================================
Parameter                       Function
=============================   =============================================================================================================================
--nodes=<num_nodes>             Start a parallel job for a distributed memory system on several nodes
--ntasks-per-node=<num_procs>   Number of (MPI) processes per node. Maximum number depends nodes (16 or 20 on Stallo)
--cpus-per-task=1               Use one CPU core per task. 
--exclusive                     Job will not share nodes with other running jobs. You don't need to specify memory as you will get all available on the node.
=============================   =============================================================================================================================


To distribute your job
^^^^^^^^^^^^^^^^^^^^^^

=============================   ============================================================================================================================
Parameter                       Function
=============================   ============================================================================================================================
--ntasks=<num_procs>            Number of (MPI) processes in total.
--cpus-per-task=1               Use one CPU core per task. 
--mem-per-cpu=<MB>              Memory (RAM) per requested CPU core. Number followed by unit prefix, e.g. 2G
=============================   ============================================================================================================================



Job related environment variables
---------------------------------

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



.. _label_partitions:

Partitions (queues) and services
--------------------------------

SLURM differs slightly from the previous Torque system with respect to
definitions of various parameters, and what was known as queues in Torque may
be covered by both ``--partition=...`` and ``--qos=...``.

We have the following partitions:

normal:
    The default partition. Up to 48 hours of walltime.

singlenode:
    If you ask for less resources than available on one single node, this will be the partition your job
    will be put in. We may remove the single-user policy on this partition in the future.
    This partition is also for single-node jobs that run for longer than 48 hours.

multinode:
    Request this partition if you ask for more resources than you will find on
    one node and request walltime longer than 48 hrs.

highmem:
    Use this partition to use the high memory nodes with 128 GB. You will have to apply for access to this partition by sending us an email explaining why you need these high memory nodes.

To figure out the walltime limits for the various partitions, type::

  $ sinfo --format="%P %l"  # small L

As a service to users that needs to submit short jobs for testing and debugging, we have a service called devel.
These jobs have higher priority, with a maximum of 4 hrs of walltime and no option for prolonging runtime.

Jobs in using devel service will get higher priority than any other jobs
in the system and will thus have a shorter queue delay than regular
jobs. To prevent misuse the devel service has the following limitations:

*  Only one running job per user.
*  Maximum 4 hours walltime.
*  Only one job queued at any time, remark this is for the whole queue.

You submit to the devel-service by typing::

  #SBATCH --qos=devel

in your job script.


General job limitations
-----------------------

The following limits are the default per user in the batch system. Users
can ask for increased limits by sending a request to support@metacenter.no.

========================== ================
Limit                      Value
========================== ================
Max number of running jobs 1024
Maximum cpus per job       2048
Maximum walltime           28 days
Maximum memory per job     No limit [1]
========================== ================

[1] There is a practical limit of 128GB per compute node used.

**Remark:** Even if we impose a 28 day run time limit on Stallo we only give
a weeks warning on system maintenance. Jobs with more than 7 days walltime,
will be terminated and restarted if possible.

See :ref:`about_stallo` chapter of the documentation if you need more information on the system architecture.
