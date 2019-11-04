.. _job_management:

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


Job status descriptions in squeue
---------------------------------

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
  Job launch failed for some reason. This is normally due to a faulty node. Please contact us via support@metacenter.no stating the problem, your user name, and the jobid(s).
Dependency
  Job cannot start before some other job is finished. This should only happen if you started the job with ``--dependency=...``
DependencyNeverSatisfied
  Same as *Dependency*, but that other job failed. You must cancel the job with ``scancel JOBID``.
