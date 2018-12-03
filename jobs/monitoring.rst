.. _monitoring_jobs:

Monitoring your jobs
====================

To monitor your jobs, you can use of of those commands. For details run them
with the `-`-help option:

``scontrol show jobid -dd <jobid>`` lists detailed information for a job (useful for troubleshooting).

``sacct -j <jobid> --format=JobID,JobName,MaxRSS,Elapsed`` will give you
statistics on completed jobs by jobID. Once your job has
completed, you can get additional information that was not available during
the run. This includes run time, memory used, etc.

From our monitoring tool Ganglia, you can watch live status information
on Stallo:

*  `Load situation <http://stallo-adm.uit.no/ganglia/>`_
*  `Job queue <http://stallo-login2.uit.no/slurmbrowser/html/squeue.html>`_


CPU load and memory consumption of your job
-------------------------------------------

In order to find out the CPU load and memory consumption of your running jobs or jobs
which have finished less than 48 hours ago, please use the `job browser
<http://stallo-login2.uit.no/slurmbrowser/html/squeue.html>`_ (accessible from within the UNINETT
network).


Summary of used resources
-------------------------

Slurm will append a summary of used resources to the ``slurm-xxx.out`` file. The fields are:

- Task and CPU usage stats

  + ``AllocCPUS``: Number of allocated CPUs
  + ``NTasks``: Total number of tasks in a job or step.
  + ``MinCPU``: Minimum CPU time of all tasks in job (system + user).
  + ``MinCPUTask``: The task ID where the mincpu occurred.
  + ``AveCPU``: Average CPU time of all tasks in job (system + user)
  + ``Elapsed``: The jobs elapsed time in format [DD-[HH:]]MM:SS.
  + ``ExitCode``: The exit code returned by the job script. Following the colon is the signal that caused the process to terminate if it was terminated by a signal.

- Memory usage stats

  + ``MaxRSS``: Maximum resident set size of all tasks in job.
  + ``MaxRSSTask``: The task ID where the maxrss occurred.
  + ``AveRSS``: Average resident set size of all tasks in job.
  + ``MaxPages``: Maximum number of page faults of all tasks in job.
  + ``MaxPagesTask``: The task ID where the maxpages occurred.
  + ``AvePages``: Average number of page faults of all tasks in job.

- Disk usage stats

  + ``MaxDiskRead``: Maximum number of bytes read by all tasks in job.
  + ``MaxDiskReadTask``: The task ID where the maxdiskread occurred.
  + ``AveDiskRead``: Average number of bytes read by all tasks in job.
  + ``MaxDiskWrite``: Maximum number of bytes written by all tasks in job.
  + ``MaxDiskWriteTask``: The task ID where the maxdiskwrite occurred.
  + ``AveDiskWrite``: Average number of bytes written by all tasks in job.


.. _job_status:

Understanding your job status
-----------------------------

When you look at the job queue through the `job browser
<http://stallo-login2.uit.no/slurmbrowser/html/squeue.html>`_, or you use the
``squeue`` command, you will see that the queue is divided in 3 parts: Active
jobs, Idle jobs, and Blocked jobs.

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
