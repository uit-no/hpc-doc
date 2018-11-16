
==========================
Frequently asked questions
==========================


Passwords
=========


I forgot my password - what now?
--------------------------------

You can reset it here: https://www.metacenter.no/user/


How do I change my password on Stallo?
--------------------------------------

The password can be changed on the
`password metacenter page <https://www.metacenter.no/user/password/>`_, log in using your
username on Stallo and the NOTUR domain.

The ``passwd`` command known from other Linuxes does not work.
The Stallo system is using a centralised database for user management.
This will override the password changes done locally on Stallo.

What is the ssh key fingerprint for stallo.uit.no?
-----------------------------------------------------

The SHA256 key fingerprint is: ``SHA256:YJpwZ91X5FNXTc/5SE1j9UR1UAAI4FFWVwNSoWoq6Hc``

The MD5 key fingerprint is: ``MD5:36:a8:c5:f3:21:24:bb:bc:07:6f:af:4a:fe:3e:cb:9a``

If you are more of a visual person, use ``ssh -o VisualHostKey=yes stallo.uit.no`` and compare it to this visual key::

  +---[RSA 1024]----+
  |      oo+ooo**BO^|
  |     . + ..+ o.BO|
  |  . . * . o . +.=|
  |   o * . . . . o.|
  |    o   S     . .|
  |   .   o         |
  |  . . .          |
  | .  ..E          |
  |  .. .           |
  +----[SHA256]-----+


.. COMMENT: use ``ssh -o VisualHostKey=yes stallo.uit.no`` to get both, the SHA256 string and visual key.


Installing software
===================

I need Python package X but the one on Stallo is too old or I cannot find it
----------------------------------------------------------------------------

You can choose different Python versions with the module system. See here: :doc:`/software/modules`

In cases where this still doesn't solve your problem or you would like to install a package yourself, please read the next section below about installing without sudo rights.

If we don't have it installed, and installing it yourself is not a good solution for you, please contact us and we will do our best to help you.


Can I install Python software as a normal user without sudo rights?
-------------------------------------------------------------------

Yes. The recommended way to achieve this is using
`virtual environments <https://docs.python.org/3/tutorial/venv.html>`_

As an example we install the Biopython package (and here we use
the `Python/3.6.4-intel-2018a` module as an example)::

  $ module load Python/3.6.4-intel-2018a
  $ virtualenv venv
  $ source venv/bin/activate
  $ pip install biopython

Next time you log into the machine you have to activate
the virtual environment::

  $ source venv/bin/activate

If you want to leave the virtual environment again, type::

  $ deactivate

And you do not have to call it "venv". It is no problem to have many
virtual environments in your home directory. Each will start as a clean
Python setup which you then can modify. This is also a great system to have
different versions of the same module installed side by side.

If you want to inherit system site packages into your virtual
environment, do this instead::

  $ virtualenv --system-site-packages venv
  $ source venv/bin/activate
  $ pip install biopython


Compute and storage quota
=========================

How can I check my disk quota and disk usage?
---------------------------------------------

To check how large your disk quota is, and how much of it you have used,
you can use the following command::

  $ quota -s

Only home and project partitions have quota.


How many CPU hours have I spent?
--------------------------------

For a simple summary, you can use the command ``cost``,
for more details, you can use::

  $ gstatement --hours --summarize -p PROSJEKT -s YYYY-MM-DD -e YYYY-MM-DD

For a detailed overview over usage you can use::

  $ gstatement --hours -p PROSJEKT -s YYYY-MM-DD -e YYYY-MM-DD

For more options see::

  $ gstatement --help



Connecting via ssh
==================


How can I export the display from a compute node to my desktop?
---------------------------------------------------------------

If you need to export the display from a compute node to your desktop you should

#. First login to Stallo with display forwarding.
#. Then you should reserve a node, with display forwarding, trough the
   queuing system.

Here is an example::

  $ ssh -Y stallo.uit.no                 # log in with port forwarding
  $ srun -N 1 -t 1:0:0 --pty bash -I     # reserve and log in on a compute node

This example assumes that you are running an X-server on your local
desktop, which should be available for most users running Linux, Unix
and Mac Os X. If you are using Windows you must install some X-server
on your local PC.


How can I access a compute node from the login node?
----------------------------------------------------

Log in to stallo.uit.no and type e.g.::

  $ ssh compute-1-3

or use the shorter version::

  $ ssh c1-3


My ssh connections are dying / freezing
---------------------------------------

How to prevent your ssh connections from dying / freezing.

If your ssh connections more or less randomly are dying / freezing, try
to add the following to your *local* ``~/.ssh/config`` file:

::

    ServerAliveCountMax 3
    ServerAliveInterval 10

(*local* means that you need to make these changes to your computer,
not on stallo)

The above config is for `OpenSSH <https://www.openssh.org>`_, if you're
using
`PUTTY <https://www.chiark.greenend.org.uk/~sgtatham/putty/docs.html>`_
you can take a look at this page explaining
`keepalives <https://the.earth.li/~sgtatham/putty/0.60/htmldoc/Chapter4.html#config-keepalive>`_
for a similar solution.


Jobs and queue system
=====================

I am not able to submit jobs longer than two days
-------------------------------------------------

Please read about :ref:`label_partitions`.


Where can I find an example of job script?
------------------------------------------

You can find job script examples in :ref:`job_script_examples`.

Relevant application specific examples (also for beginning users) for a few applications can be found in
:ref:`sw_guides`.


When will my job start?
-----------------------

How can I find out when my job will start?

To find out approximately when the job scheduler thinks your job will
start, use the command::

  squeue --start -j <job_id>

This command will give you information about how many CPUs your job requires,
for how long, as well as when approximately it will start and complete.  It
must be emphasized that this is just a best guess, queued jobs may start
earlier because of running jobs that finishes before they hit the walltime
limit and jobs may start later than projected because new jobs are submitted
that get higher priority.


How can I see the queing situation?
-----------------------------------

How can I see how my jobs are doing in the queue, if my jobs are idle, blocked,
running?

On the webpage http://stallo-login2.uit.no/slurmbrowser/html/squeue.html you
can find information about the current load on stallo, some information about
the nodes, and the information you would get from the showq command, which is
described below. You can also find information about your job and if you the
job is running, you can find graphs about its usage of the CPUs, memory and so
on.

If you prefer to use the command line, to see the job queue use::

  $ squeue


Why does my job not start or give me error feedback when submitting?
--------------------------------------------------------------------

Most often the reason a job is not starting is that Stallo is full at the moment and there are many jobs waiting in the queue. But sometimes there is an error in the job script and you are asking for a configuration that is not possible on Stallo. In such a case the job will not start.

To find out how to monitor your jobs and check their status see :ref:`monitoring_jobs`.

Below are a few cases of why jobs don't start or error messages you might get:


**Memory per core**

   "When I try to start a job with 2GB of memory pr. core, I get the following error:
   ``sbatch: error: Batch job submission failed: Requested node configuration is not available``
   With 1GB/core it works fine. What might be the cause to this?"

On Stallo we have two different configurations available; 16 core and 20 core nodes - with both a
total of 32 GB of memory/node. If you ask for full nodes by
specifying both number of nodes and cores/node together with 2 GB of memory/core, you will ask
for 20 cores/node and 40 GB of memory. This configuration does not exist on Stallo. If you ask
for 16 cores, still with 2GB/core, there is a sort of buffer within SLURM no allowing you
to consume absolutely all memory available (system needs some to work). 2000MB/core works
fine, but not 2 GB for 16 cores/node.

The solution we want to push in general is this::

   #SBATCH -ntasks=80 # (number of nodes * number of cores, i.e. 5*16 or 4*20 = 80)

If you then ask for 2000MB of memory/core, you will be given 16 cores/node and a total
of 16 nodes. 4000MB will give you 8 cores/node - everyone being happy. Just note the
info about PE :ref:`accounting`; mem-per-cpu 4000MB will cost you twice as much as
mem-per-cpu 2000MB.

You can find an example here: :ref:`first_time_gaussian`

Please also note that if you want to use the whole memory on a node, do not ask
for 32GB, but for 31GB or 31000MB as the node needs some memory for the system itself.
For an example, see here: :ref:`allocated_entire_memory`



**Step memory limit**

   "Why do I get ``slurmstepd: Exceeded step memory limit`` in my log/output?"

For slurm, the memory flag is a hard limit, meaning that when each core
tries to utilize more than the given amount of memory, it is killed by the slurm-deamon.
For example ``$SBATCH --mem-per-cpu=2GB`` means that you maximum can use 2 GB of memory per
core. With memory intensive applications like Comsol or VASP, your job will likely be
terminated. The solution to this problem is to specify the
number of tasks irrespectively of cores/node and ask for as much memory you will need.

For instance::

   #SBATCH --ntasks=20
   #SBATCH --time=0-24:05:00
   #SBATCH --mem-per-cpu=6000MB


**QOSMaxWallDurationPerJobLimit**

QOSMaxWallDurationPerJobLimit means that MaxWallDurationPerJobLimit has been exceeded. Basically, you have asked for more time than allowed for the given QOS/Partition. Please have a look at :doc:`/jobs/partitions`.


**Priority vs. Resources**

Priority means that resources are in principle available, but someone else has higher priority in the queue. Resources means the at the moment the requested resources are not available.


How can I customize emails that I get after a job has completed?
----------------------------------------------------------------

Use the mail command and you can customize it to your liking but make sure
that you send the email via the login node.

As an example, add and adapt the following line at the end of your script::

  echo "email content" | ssh stallo-1.local 'mail -s "Job finished: ${SLURM_JOBID}" firstname.lastname@uit.no'


How can I run many short tasks?
-------------------------------

The overhead in the job start and cleanup makes it unpractical to run
thousands of short tasks as individual jobs on Stallo.

The queueing setup on stallo, or rather, the accounting system generates
overhead in the start and finish of a job of about 1 second at each end
of the job. This overhead is insignificant when running large parallel
jobs, but creates scaling issues when running a massive amount of
shorter jobs. One can consider a collection of independent tasks as one
large parallel job and the aforementioned overhead becomes the serial or
unparallelizable part of the job. This is because the queuing system can
only start and account one job at a time. This scaling problem is
described by `Amdahls Law <https://en.wikipedia.org/wiki/Amdahl's_law>`_.

If the tasks are extremly short, you can use the example below. If you want to
spawn many jobs without polluting the queueing system, please have a look at
:ref:`job_arrays`.

By using some shell trickery one can spawn and load-balance multiple
independent task running in parallel within one node, just background
the tasks and poll to see when some task is finished until you spawn the
next:

.. literalinclude:: files/multiple.sh
   :language: bash

And here is the ``dowork.sh`` script:

.. literalinclude:: files/dowork.sh
   :language: bash
