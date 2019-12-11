.. _monitoring_jobs:

Monitoring your jobs
====================

SLURM commands
--------------

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

Stallo has only limited resources and usually a high demand.
Therefore using the available resources as efficient as possible is paramount to have short queueing times
and getting most out of your quota.

Accessing slurmbrowser
++++++++++++++++++++++
In order to find out the CPU load and memory consumption of your running jobs or jobs
which have finished less than 48 hours ago, please use the `job browser
<http://stallo-login2.uit.no/slurmbrowser/html/squeue.html>`_ (accessible from within the UNINETT
network).

For users from outside of UNINETT, you have to setup a ssh tunnel to stallo with::
  
  ssh -L8080:localhost:80 stallo-login2.uit.no

After that you can access slurmbrowser at http://localhost:8080/slurmbrowser/html/squeue.html

Detecting inefficient jobs
++++++++++++++++++++++++++
You can filter for a slurm job ID, account name or user name with the search bar in the upper left corner.

For single- or multinode jobs the ``AvgNodeLoad`` is an important indicator if your jobs runs efficiently,
at least with respect to CPU usage. If you use the whole node, the average node load should be close to number
of CPU cores of that node (so 16 or 20 on Stallo).
In some cases it is totally acceptable to have a low load if you for instance need a lot of memory but in general 
either CPU or memory load should be high.
Otherwise you are wasting your quota and experience probably longer than necessary queuing times.

If you detect inefficient jobs you either look for ways to improve the resource usage of your job or ask for less
resources in your SLURM script.


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


