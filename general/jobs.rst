.. _jobs:

========================
Jobs, scripts and queues
========================

.. index:: batch system, jobscripts, job management

Batch system
============

The Stallo system is a resource that is shared between a lot of users
so to ensure fair use everyone must do their computations by submitting jobs
through a
batch system that will execute the applications on the available
resources.

The batch system on Stallo is `SLURM <http://slurm.schedmd.com/>`_
(Simple Linux Utility for Resource Management.)

If you are already used to Torque/Maui (the previous queue system used on Stallo), but not SLURM, you might find this :ref:`torque_slurm_table` useful.


Create a job
============

To run a job on the system you need to create a job script. A job
script is a regular shell script (bash) with some directives
specifying number of cpus, memory etc. that will be interpreted by the
batch system upon submission.

For a quick feel for how to create and run batch jobs and for a more complete example see

.. toctree::
   :maxdepth: 1

   job-script-example.rst

	      
Manage a job
============

A job's lifecycle can be managed with as little as three different
commands

#. Submit the job with ``sbatch jobscript.sh``.
#. Check the job status with ``squeue``. (to limit the display to only
   your jobs use ``squeue -u <user_name>``.)
#. (optional) Delete the job with ``scancel <job_id>``.


List of useful commands
=======================

Managing jobs
-------------
See the man page for each command for details.

sbatch <file_name>
    Submit jobs. All job parameters can be specified on the command line or
    in the job script. Command line arguments take precedence over
    directives in the script.
scancel <job_id>
    Delete a job.
scontrol hold <job_id>
    Put a hold on the job. A job on hold will not start or block other jobs from starting until you release the hold.
scontrol release <job_id>
    Release the hold on a job.

Getting job info
----------------
For details run the command with the `-`-help option.

squeue
    List all jobs. This command can show you a lot of information, including expected start-time of a job.
squeue -u <username>
    List all current jobs for a user.
scontrol show jobid -dd <jobid>
    List detailed information for a job (useful for troubleshooting).
sacct -j <jobid> --format=JobID,JobName,MaxRSS,Elapsed
    To get statistics on completed jobs by jobID. Once your job has completed, you can get additional information that was not available during the run. This includes run time, memory used, etc.

Get queue and account info
--------------------------
sinfo
    List partitions. Somewhat similar to queues in Torque/ Maui. For more details, see partitions_.
sbank balance statement -u
    Information on available CPU-hours in your accounts.


Recommended job parameters
==========================

See the :ref:`jobscript` for a list of relevant parameters.


Walltime
--------

We recommend you to be as precise as you can when specifying the
parameters as they will inflict on how fast your jobs will start to run.
We generally have these rules for prioritizing jobs:

#. Large jobs, that is jobs with high cpucounts, are prioritized.
#. Short jobs take precedence over long jobs.
#. Use fairshare. This means that users with a lot of jobs running will get a
   decreased priority compared to other users.

   
Process count
-------------

We strongly advice all users to ask for a given set of cores when submitting multi-core jobs.
To make sure that you utilize full nodes, you should ask for sets that adds up to both
16 and 20 (80, 160 etc) due to the hardware specifics of Stallo i.e. submit the job with ``--ntasks=80``.

This will make the best use of the resources and give the most predictable
execution times. If your job require more than the default available memory pr core (32 GB/node gives
2 GB/core for 16 core nodes and 1.6GB/core for 20 core nodes) you should adjust this need with
the following command: ``#SBATCH --mem-per-cpu=4GB`` If doing this, the batch system will automatically
allocate 8 cores or less pr. node.

For single node jobs, just ask for less than 16 cores with less than 1.6GB of memory/core.


Scalability
-----------

You should run a few tests to see what is the best fit between
minimizing runtime and maximizing your allocated cpu-quota. That is you
should not ask for more cpus for a job than you really can utilize
efficiently. Try to run your job on 1,2,4,8,16 cpus and so on to see
when the runtime for your job starts tailing off. When you start to see
less than 30% improvement in runtime when doubling the cpu-counts you
should probably not go any further. Recommendations to a few of the
most used applications can be found in :ref:`sw_guides`.


Partitions and services
------------------------

SLURM differs slightly from Torque with respect to definitions of various parameters, and what was known
as queues in Torque may be covered by both ``--partition=...`` and ``--qos=...``.

We have the following partitions:

short:
    Used for testing your scripts. Up to 1 hour of walltime.
normal:
    The default partition. Multi nodes (i.e. more than 20 cores) and up to 48 hrs of walltime.

singlenode:
    If you ask for less resources than available on one single node, this will be the partition your job
    will be put in. We may remove the single-user policy on this partition in the future.

multinode:
    If you ask for more resources than you will find on one node and request walltime longer than 48 hrs,
    your job will land into this partition.


As a service to users that needs to submit short jobs for testing and debugging, we have a service called develop. 
These jobs have higher priority, with a maximum of 4 hrs of walltime and no option for prolonging runtime.

Jobs in using devel service will get higher priority than any other jobs
in the system and will thus have a shorter queue delay than regular
jobs. To prevent misuse the devel service has the following limitations:

*  Only one running job per user.
*  Maximum 4 hours walltime.
*  Only one job queued at any time, remark this is for the whole queue.

You submit to the devel-service by typing::

#SBATCH --qos=devel

in your jobscript.


General job limitations
-----------------------

The following limits are the default per user in the batch system. Users
can ask for increased limits by sending a request to
support-uit@notur.no.

============================== =================
Limit                           Value
============================== =================
Max number of running jobs      1024
Maximum cpus per job            2048
Maximum walltime                28 days
Maximum memory per job          No limit:sup:`1`
============================== =================

:sup:`1` There is a practical limit of 128GB per compute node used.


**Remark:** Even if we impose a 28 day run time limit on stallo we only give
a weeks warning on system maintenance. Jobs with more than 7 days walltime,
will be terminated and restarted if possible.

See :ref:`about_stallo` chapter of the documentation if you need more information on the system architecture.


Interactive job submission
==========================

You can run an interactive jobs by using the ``-I`` flag to srun (nb: Note order of commands)::

    srun -N 1 -t 1:0:0 --pty bash -I

The command prompt will appear as soon as the job start.

Interactive jobs has the same policies as normal batch jobs, there are
no extra restrictions.


Monitoring your jobs
====================

From our monitoring tool Ganglia, you can watch live status information
on Stallo:

*  `Load situation <http://stallo-adm.uit.no/ganglia/>`_
*  `Job queue <http://stallo-login1.uit.no/jobbrowser/showq>`_

.. _job_status:

Understanding your job status
-----------------------------

When you look at the job queue through your browser
`<http://stallo-login1.uit.no/jobbrowser/showq/>`_, or you use the ``squeue``
command, you will see that the queue is divided in 3 parts: Active jobs, Idle
jobs, and Blocked jobs.

Active jobs are the jobs that are running at the moment. Idle jobs are next in
line to start running, when the needed resources become available. Each user
can by default have only one job in the Idle Jobs queue.

Blocked jobs are all other jobs. Their state can be *Idle*, *Hold*, or
*Deferred*. *Idle* means that they are waiting to get to the Idle queue. They
will eventually start when the resources become available. The jobs with the
*Hold* state have been put on hold either by the system, or by the user. F.e.
if you have one job in the Idle queue, that is not very important to you, and
it is blocking other, more urgent, jobs from starting, you might want to put
that one job on hold. Jobs on hold will not start until the hold is released.
*Deferred* jobs will not start. In most cases, the job is deferred because it
is asking for a combination of resources that Stallo can not provide.

Please contact the support staff, if you don't understand why your job has a
hold or deferred state.
