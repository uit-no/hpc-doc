

Batch system
============

The Stallo system is a resource that is shared between many of users and to
ensure fair use everyone must do their computations by submitting jobs through
a batch system that will execute the applications on the available resources.

The batch system on Stallo is `SLURM <https://slurm.schedmd.com/>`_ (Simple
Linux Utility for Resource Management.)

If you are already used to Torque/Maui (the previous queue system used on
Stallo), but not SLURM, you might find this :ref:`torque_slurm_table` useful.


Creating a job script
---------------------

To run a job on the system you need to create a job script. A job script is a
regular shell script (bash) with some directives specifying the number of CPUs,
memory, etc., that will be interpreted by the batch system upon submission.

You can find job script examples in :ref:`job_script_examples`.

After you wrote your job script as shown in the examples, you can start it with::

   sbatch jobscript.sh


How to pass command-line parameters to the job script
-----------------------------------------------------

It is sometimes convenient if you do not have to edit the job script every time you want
to change the input file. Or perhaps you want to submit hundreds of jobs and
loop over a range of input files. For this it is handy to pass command-line
parameters to the job script.

In SLURM you can do this::

  $ sbatch myscript.sh myinput myoutput

And then you can pick the parameters up inside the job script::

  #!/bin/bash

  #SBATCH ...
  #SBATCH ...
  ...

  # argument 1 is myinput
  # argument 2 is myoutput
  mybinary.x < ${1} > ${2}


How to set the account in your job script
-----------------------------------------

You can set it like this::

  #SBATCH --account=nn1234k


Managing jobs
=============

The lifecycle of a job can be managed with as little as three different
commands:

#. Submit the job with ``sbatch <script_name>``.
#. Check the job status with ``squeue``. (to limit the display to only
   your jobs use ``squeue -u <user_name>``.)
#. (optional) Delete the job with ``scancel <job_id>``.

You can also hold the start of a job:

scontrol hold <job_id>
    Put a hold on the job. A job on hold will not start or block other jobs from starting until you release the hold.
scontrol release <job_id>
    Release the hold on a job.


Walltime
========

We recommend you to be as precise as you can when specifying the
parameters as they will inflict on how fast your jobs will start to run.
We generally have these rules for prioritizing jobs:

#. Large jobs, that is jobs with high CPUcounts, are prioritized.
#. Short jobs take precedence over long jobs.
#. Use fairshare. This means that users with many jobs running will get a
   decreased priority compared to other users.

To find out whether all users within one project share the same priority, run::

  $ sshare -a -A nnNNNNk

For a given account (project) consider the column "RawShares". If the RawShares
for the users is "parent", they all share the same fairshare priority. If it is
a number, they have individual priorities.


Job status descriptions in squeue
=================================

When you run ``squeue`` (probably limiting the output with ``squeue -u <user_name>``), you will get a list of all jobs currently running or waiting to start. Most of the columns should be self-explaining, but the *ST* and *NODELIST (REASON)* columns can be confusing.

*ST* stands for *state*. The most important states are listed below. For a more comprehensive list, check the `squeue help page section Job State Codes <https://slurm.schedmd.com/squeue.html#lbAG>`_.

R
  The job is running
PD
  The job is pending (i.e. waiting to run)
CG
  The job is completing, meaning that it will be finished soon

The column *NODELIST (REASON)* will show you a list of computing nodes the job is running on if the job is actually running. If the job is pending, the column will give you a reason why it still pending. The most important reasons are listed below. For a more comprehensive list, check the `squeue help page section Job Reason Codes <https://slurm.schedmd.com/squeue.html#lbAF>`_.

Priority
  There is another pending job with higher priority
Resources
  The job has the highest priority, but is waiting for some running job to finish.
QOS*Limit
  This should only happen if you run your job with ``--qos=devel``. In developer mode you may only have one single job in the queue.
launch failed requeued held
  Job launch failed for some reason. This is normally due to a faulty node. Please contact us via support-uit@notur.no stating the problem, your user name, and the jobid(s).
Dependency
  Job cannot start before some other job is finished. This should only happen if you started the job with ``--dependency=...``
DependencyNeverSatisfied
  Same as *Dependency*, but that other job failed. You must cancel the job with ``scancel JOBID``.
