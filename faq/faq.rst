.. _faq:

=================================
FAQs (Frequently asked questions)
=================================


General
=======

CPU v.s. core / processor core.
-------------------------------

How should I interpret the term CPU in this documentation?

In  this documentation we are frequently using the term *CPU*, which in
most cases are equivalent to the more precise term *processor core* /
*core*\. The \ *multi core age*\  is here now \ *:-)*


I am getting hundreds of e-mails in a few minutes, what do I do?
----------------------------------------------------------------

Help - I am getting the same e-mail every 30 seconds. Already received
more that 100 of them!!!

If you are receiving a lot of e-mails looking someting like this:

PBS Job Id: 52237.stallo.uit.no
Job Name:   Ni\_II\_PP\_PPhMe2\_C2\_S00
job deleted
Job deleted at request of maui@stallo.uit.no
MOAB\_INFO:  job exceeded wallclock limit

You can stop the job by running the command:

::

    qsig -s NULL <job_id>


Account usage and login in
==========================

How can I check my disk quota and disk usage?
---------------------------------------------

How large is my disk quota, and how much of it have I used?

To check how large your disk quota is, and how much of it you have used,
you can use the following command:

::

    quota -s

Its only the *$HOME* and *$PROJECT* disks that have quota.



How can I get information about my account?
-------------------------------------------

How can I get information on how many CPU hours are used and left on my
account?

For a simple summary, you can use the command '*cost*\ '.

For more details, you can use the command '*gstatement*\ ' :

::

    gstatement --hours --summarize -p PROSJEKT -s YYYY-MM-DD -e YYYY-MM-DD

For a detailed overview over usage you can use:

::

    gstatement --hours -p PROSJEKT -s YYYY-MM-DD -e YYYY-MM-DD

For more options see

::

    gstatement --help


How do I change my password on stallo?
--------------------------------------

The passwd command does not seem to work. My password is reset back to
the old one after a while. Why is this happening?

The stallo system is using a centralised database for user management.
This will override the password changes done locally on stallo.

The password can be changed
`here <https://www.metacenter.no/public/password/>`_, log in using your
username on stallo and the NOTUR domain.


Exporting the display from a compute node to my desktop?
--------------------------------------------------------

How can I export the display from a compute node to my desktop?

If you needs to export the display from a compute node to your desktop
you should

#. first login to Stallo with display forwarding,
#. then you should reserve a node, with display forwarding, trough the
   queuing system

Below is an example on how you can do this:

::

    ssh -Y stallo.uit.no                       1) Long in on Stallo with display forwarding.qsub -lnodes=1,walltime=1:0:0 -I -X        2) Reserve and log in on a compute node with display forwarding.

This example assumes that you are running an X-server on your local
desktop, which should be available for most users running Linux, Unix
and Mac Os X. If you are using Windows you must install some X-server
on your local PC.

How can I access a compute node from the login node?
----------------------------------------------------

How can I access a compute node in the cluster from the login node?

Log in to *stallo.uit.no* and type e.g.:

::

    ssh compute-1-3

or us the shorter version:

::

    ssh c1-3


My ssh connections are dying / freezing.
----------------------------------------

How to prevent your ssh connections from dying / freezing.

If your ssh connections more or less randomly are dying / freezing, try
to add the following to your **local** ``~/.ssh/config`` file:

::

    ServerAliveCountMax 3
    ServerAliveInterval 10

(**local** means that you need to make these changes to your computer,
not on stallo)

The above config is for `OpenSSH <http://www.openssh.org>`_, if you're
using
`PUTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/docs.html>`_
you can take a look
`here <http://the.earth.li/~sgtatham/putty/0.60/htmldoc/Chapter4.html#config-keepalive>`_
for a similar solution.


Queue system and running jobs
=============================

Where can I find an example of job script?
------------------------------------------

You can find an example with comments in
:ref:`jobscript`

Relevant application specific examples (also for beginning users) for a few applications can be found in
:ref:`sw_guides`.


When will my job start?
-----------------------

How can I find out when my job will start?

To find out approximately when the job scheduler thinks your job will
start, use the command::

  showstart <job_id>

This command will give you information about how many CPUs your job
requires, for how long, as well as when approximately it will start and
complete.
It must be emphasized that this is just a best guess, queued jobs may
start earlier because of running jobs that finishes before they hit the
walltime limit and jobs may start later than projected because new jobs
are submitted that get higher priority.


How can I see the queing situation?
-----------------------------------

How can I see how my jobs are doing in the queue, if my jobs are idle,
blocked, running?

On the webpage
http://stallo-login1.uit.no/jobbrowser/
you can find information about the current load on stallo, some information about the nodes, and the information you would get from the showq command, which is described below. You can also find information about your job and if you the job is running, you can find graphs about its usage of the CPUs, memory and so on.

If you prefer to use the command line, to see the jobqueue use the command 'showq':

::

    showq

This command gives you a list of running jobs, idle jobs and blocked
jobs. Each line in the list gives you the jobid, which user is running
the job, number of cpus it\`s using, time remaining and start time of
the job. The list is sorted by remaining time for the jobs.

To get more information about the command:

::

    showq -h

You can also use the command

::

    qstat

which gives you a list of jobs on Stallo, sorted by jobid. This
command also has man-pages:

::

    man qstat

Example of the 'qstat' output:

+---------------+-----+---------------+-----+----------+-----+--------------+-----+-------+-----+------------+
| *Job id*      |     | *Name*        |     | *User*   |     | *Time Use*   |     | *S*   |     | *Queue*    |
+---------------+-----+---------------+-----+----------+-----+--------------+-----+-------+-----+------------+
| ------        |     | ------        |     | ----     |     | -------      |     | -     |     | -----      |
+---------------+-----+---------------+-----+----------+-----+--------------+-----+-------+-----+------------+
| *58.mangas*   |     | *rc5des.sh*   |     | *royd*   |     | *00:07:46*   |     | *R*   |     | *normal*   |
+---------------+-----+---------------+-----+----------+-----+--------------+-----+-------+-----+------------+
| *59.mangas*   |     | *rc5des.sh*   |     | *royd*   |     | *00:07:46*   |     | *R*   |     | *normal*   |
+---------------+-----+---------------+-----+----------+-----+--------------+-----+-------+-----+------------+

where:

-  **Job id** - The name of the job in the queueing system
-  **Name** - The name of the script you give to qsub
-  **User** - The job owner
-  **Time Use** - The walltime of the job
-  **S** - The state of the job, R - running, Q - waiting, S - suspended
-  **Queue** - The queue where the job is running


How can I view the output of my job?
------------------------------------

Use the \`\`qpeek\`\` command.

The \`\`qpeek\`\` command can list your job output while it is running.
It behaves much like the \`\`tail\`\` command so using \`\`-f\`\` will
display the output as it is written::
 $qpeek -f <job_id>
 1.0
 2.0
 3.0
 4.0
See \`\`qpeek -h\`\` for more info.
You can also submit your job with the \`\`-k oe\`\` flag, then the
standard error and standard output of your job will be put in your home
directory, see \`\`man qsub\`\` for more details.


What is the maximum memory limit for a job?
-------------------------------------------

What is the absolute maximum memory I can set for a job on Stallo?

Stallo have 50 nodes with 32 GB memory each, while the rest have 16 GB.

So 32 GB is the maximum memory limit you can ask for in a job running on
a single node.

(You can of course have a job running on multiple nodes, using up to 32
GB of memory on each node.)

For instance, if you want to use 4 CPUs with 4 GB of memory:

::

    -lnodes=1:ppn=4,pmem=4gb

If you want to use only one CPU, you can ask for all it\`s memory this
way:

::

    -lnodes=1:ppn=1,pmem=16gb


How much memory have I reserved, and how much am I using?
---------------------------------------------------------

How can I see how much memory my jobs have reserved, and how much they
are using?

You can check the memory of your job with the command '*checkjob
your\_jobnumber*\ '. Then you will get ut something like this:

::

    [torj@stallo-2 ~]$ checkjob 24614

    checking job 24614
    State: Running

    Creds: user:torj group:torj account:uit-staff-000 class:default qos:default
    WallTime: 23:42:21 of 17:02:00:00
    SubmitTime: Wed Sep 6 10:16:31 (Time Queued Total: 00:16:42 Eligible: 00:16:42)

    StartTime: Wed Sep 6 10:33:13
    Total Tasks: 4

    Req[0] TaskCount: 4 Partition: DEFAULT
    Network: [NONE] Memory >= 1000M Disk >= 0 Swap >= 0
    Opsys: [NONE] Arch: [NONE] Features: [NONE]
    Dedicated Resources Per Task: PROCS: 1
    MEM: 1000M
    Allocated Nodes: [compute-3-3.local:4]

    IWD: [NONE] Executable: [NONE]
    Bypass: 10 StartCount: 1
    PartitionMask: [ALL]
    Flags: BACKFILL RESTARTABLE

    Reservation '24614' (-23:42:32 -> 16:02:17:28 Duration: 17:02:00:00)
    PE: 4.00 StartPriority: 384946

**MEM: 1000M** shows that the job has reserved 1000MB of memory per
"task".

**[compute-3-3.local:4]** means that the job runs on compute-3-3 and is
using 4 CPUs. You can then log in to this node (with the command '*ssh
-Y c3-3'*), and see how much memory this job is using. Use the command
'*top*\ ', the column RES shows use of memory.


How can I get more information about my job?
--------------------------------------------

How can I see when my queued job will start, when it will finish, why it
is blocked and so on?

On the webpage
http://stallo-login1.uit.no/jobbrowser/showq
you can find a list of running jobs, idle jobs and blocked jobs (the same information you would get from the *showq* command). Each line in the list gives you the jobid, which user is running the job, number of cpus it`s using, time remaining and start time of the job. The list is sorted by remaining time for the jobs. If you find your job there and click on the id number, you can also find more information about your job. And if you the job is running, you can find graphs about its usage of the CPUs, memory and so on.

If you prefer the command line, you should use this command:

::

    checkjob <job_id>

You can also get more info about your job parameters using this command:

::

    qstat -f <job_id>


How can I kill my job?
----------------------

How can I delete my job from the queueing system?

To terminate one of your jobs use *qdel*, for instance:

::

    qdel 58

This will delete job number 58 in the queueing list that you get when
using the command *showq*.


How can I kill **all** my jobs?
-------------------------------

I want to get rid of all my jobs in a hurry.

Use a little shell trickery:

::

    qselect -u $USER | xargs qdel

``qselect`` prints out a job list based on specific criteria,
``xargs`` takes multi line input and run the command you give to it
repeatedly until it has consumed the input list.

Delete all your running jobs:

::

    qselect -u $USER -s R | xargs qdel

Delete all your queued jobs:

::

    qselect -u $USER -s Q | xargs qdel

(``xargs`` is your friend when you want to do the same thing to a lot of
items.)


I am not able to kill my job!!!
-------------------------------

I am not able to kill my job!!!

If you want to kill a job, and the normal way of doing it, *qdel
<job_id>*, does not work you should try the following command:

::

    qsig -sNULL <job_id>

This should always work. However if it doesn't work you have to contact
the support personal: support-uit@notur.no


Which nodes are busy, and which are idle?
-----------------------------------------

In order to get information about the status of the nodes in the
cluster, use the following command:

::

    diagnose -n

However, the list is rather long... :-)

You can also have a look at
http://stallo-login1.uit.no/jobbrowser/nodes


How can I run a job on specific nodes
-------------------------------------

If you want to run a job on specific nodes you can queue for only these
nodes.

Example; to apply for  nodes c2-1 and c2-2:

::

    qsub -lnodes=c2-1:ppn=8+c2-2:ppn=8


How do I exclude a node from running a job?
-------------------------------------------

Sometimes one need to be able to exclude a node from running a job.

Sometimes it is useful to exclude a specific node from running your
jobs. This can be due to hardware or software problems on that node. For
instance the node seems to have problems with the interconnect.

The simplest way to do this is to submit a dummy job to this node:

::

    echo sleep 600 | qsub -lnodes=cX-Y:ppn=8,walltime=1000

Then this job will be running a sleep job for 600 seconds and you can
submit your real job afterwards that will run on other nodes. This will
cost you some cpu hours off your quota, but let us know and we will
refund this to you later.

Please let us know if you think some nodes have problems.


How can I run in parallel without using MPI
-------------------------------------------

If you have many independent jobs which you wish to run simultaneously,
you can use pbsdsh

You can run many independent jobscripts in parallel by submitting one
single job script to the queue, using pbsdsh.

Here is a simple concrete example of how to use one parallel job to
launch 4 sequential jobs (job0, job1, job2, job3).
The "Masterjob" launches "SingleJobCaller" which runs "jobN".

Masterjob:

::

    #!/bin/bash#PBS -lnodes=4#PBS -lwalltime=01:00:00pbsdsh $HOME/test/SingleJobCaller

SingleJobCaller ($PBS\_VNODENUM is an environment variable which returns
the rank of the job):

::

    #!/bin/bash$HOME/test/job$PBS_VNODENUM

job0 (and similar for job1, job2 job3):

::

    #!/bin/bashecho I am job 0

The output of Masterjob would be like:

::

    I am job 0I am job 1I am job 3I am job 2

The four jobs have been run in parallel (simultaneously)


How can I see the processes belonging to my job?
------------------------------------------------

Use the \`\`qps\`\` command.

The ``qps`` command can give you the process list belonging to your job:

::

    $qps 12345
    *** 12345 user procs=5 name=dalpar.pbs
    compute-9-1 08:12:17 RLl  dalpar.x-4(mpi:28845@compute-9-9.local)
    compute-9-5 08:16:39 RLl  dalpar.x-2(mpi:28845@compute-9-9.local)
    compute-9-5 08:14:08 RLl  dalpar.x-3(mpi:28845@compute-9-9.local)
    compute-9-7 08:14:12 RLl  dalpar.x-1(mpi:28845@compute-9-9.local)
    compute-9-9 07:45:55 RLl  dalpar.x-0(mpi:28845@compute-9-9.local)

See ``qps -h`` for more info.

*Remark*: The ``qps`` command assume you got only one job per node so if
you have multiple jobs a node it will show all of the processes
belonging to you on that node.


Faster access for testing and debugging
---------------------------------------

A trick that may give you faster access when performing small test runs
in the queuing system.

Removing the parameter *"ib"* (if present) from the following line in
you job script

::

    #PBS -lnodes=2:ppn=8:ib                  (Remove ":ib")

will most probably make your test jobs start immediately, since it is
most likely that some of the "non Infiniband nodes" are available. If
your program has a demanding communication pattern, this will of course
slow down your program.

The *"ib"* option above tells the system that this job needs to use the
Infiniband interconnect. If *":ib"* is omitted, the job may either run
on the Infiniband interconnect or the Gigabit Ethernet, but you don't
know in advance. If your application doesn't need Infiniband you should
omit this option, to avoid being stuck in the queuing system waiting for
Infiniband powered nodes becoming available.


Creating dependencies between jobs
----------------------------------

See the description of the ``-Wdepend`` option in the qsub manpage.


How do I run many tasks within a single job?
--------------------------------------------

By using some shell trickery one can spawn and load-balance multiple
independent task running in parallel within one node, just background
the tasks and poll to see when some task is finished until you spawn the
next:

::

    for t in $tasks; do
      ./dowork.sh $t &
      activetasks=$(jobs | wc -l)
      while [ $activetasks -ge $maxpartasks ]; do
        sleep 1
        activetasks=$(jobs | wc -l)
      done
    done
    wait


How can I submit many jobs in one command?
------------------------------------------

use job arrays:

::

    qsub -t 1-16 Myjob

will send Myjob 16 times into the queue. They can be distinguished by
the value of the environmental variable 

::

    $PBS_ARRAYID


Running many short tasks.
=========================

Recommendations on how to run a lot of short tasks on the system. The
overhead in the job start and cleanup makes it unpractical to run
thousands of short tasks as individual jobs on Stallo.


Background
----------

The queueing setup on stallo, or rather, the accounting system generates
overhead in the start and finish of a job of about 1 second at each end
of the job. This overhead is insignificant when running large parallel
jobs, but creates scaling issues when running a massive amount of
shorter jobs. One can consider a collection of independent tasks as one
large parallel job and the aforementioned overhead becomes the serial or
unparallelizable part of the job. This is because the queuing system can
only start and account one job at a time. This scaling problem is
described by `Amdahls <http://en.wikipedia.org/wiki/Amdahl's_law>`_ Law.

Without going into any more details, let's look at the solution.


Running tasks in parallel within one job.
-----------------------------------------

By using some shell trickery one can spawn and load-balance multiple
independent task running in parallel within one node, just background
the tasks and poll to see when some task is finished until you spawn the
next:

::

    for t in $tasks; do
      ./dowork.sh $t &
      activetasks=$(jobs | wc -l)
      while [ $activetasks -ge $maxpartasks ]; do
        sleep 1
        activetasks=$(jobs | wc -l)
      done
    done
    wait



MPI
===

My MPI application runs out of memory.
--------------------------------------

The OpenMPI library sometimes consumes a lot of memory for its
communication buffers. This seems to happen when an application does a
lot of small send and receives. How to limit this?

You can limit the communication buffer counts and sizes using the mca
parameters, this has helped for some applications that have experienced
this problem.

For instance to limit the number of buffers used to 1000 you set this on
the command line:

::

    mpirun --mca btl_openib_free_list_max 1000 mpi-application.x

It is recommended to experiment with this to obtain optimal values, as
setting it too low will decrease performance.

For more information about openmpi tunables see
`here <http://www.open-mpi.org/faq/?category=openfabrics#limiting-registered-memory-usage>`__.


My mpi job crashes with a retry limit exceeded error.
-----------------------------------------------------

Sometimes a mpi job will fail saying that its retry limit is exceeded.

If you get something like this from an mpi job:

::

    [0,1,132][btl_openib_component.c:1328:btl_openib_component_progress] from c12-3 to: c13-3 error polling
    HP CQ with status RETRY EXCEEDED ERROR status number 12 for wr_id   57073528 opcode 42

This means that you have hit a problem with the communication over the
infiniband fabric between two nodes. This may or may not be related to
problems with the infiniband network.

To work around this problem you can try to avoid the problematic
node(s), in the error message above it seems to be the receiver, c13-3,
that is causing the problem so in this case I would run a dummy job on
that node and try to resubmit the failing job. See
:doc:`here <./how-do-i-exclude-a-node-from-running-a-job>` how to run a
dummy job on a specific node.

If this does not help, send us a problem report.


Tuning OpenMPI performance - non default settings on Stallo.
------------------------------------------------------------

We have changed one setting on stallo to limit the memory consumption of
the OpenMPI library. The following is set as global default:

::

    btl_openib_free_list_max = 1000

This setting can be changed on the ``mpirun`` command-line:

::

    mpirun --mca btl_openib_free_list_max 1000 ..........

or by setting it in the users personal config file,
``$HOME/.openmpi/mca-params.conf``. See
``/opt/openmpi/1.2.4/etc/openmpi-mca-params.conf`` for the syntax.

The value of 1000 might be too low for some apps, you can try to set it
to -1 to remove this limit if your application gets into problems.
Please let us know if this influences your application.


My MPI application hangs on startup.
------------------------------------

We have discovered that some applications doesn't work well with the
default OpenMPI version, 1.3.2. Reverting back to v1.2.4 might solve the
problem.

Symptoms:

If your application has both of the following symptoms:

#. It works on a low number of nodes, but hangs on startup on higher node
   counts
#. It works with ethernet (by setting ``--mca btl ^openib`` on the mpirun
   command), but not with infiniband

Then try to revert back to OpenMPI 1.2.4 by setting this before
recompiling and in your job script:

::

    module unload openmpi
    module load openmpi/1.2.4
    module load intel-compiler

Please tell us if this helps for you application. We try to get an idea
of the extent of this problem. Send a report to support-uit@notur.no .

.. :vim:ft=rst
