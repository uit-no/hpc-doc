

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

The passwd command does not seem to work. My password is reset back to
the old one after a while. Why is this happening?

The Stallo system is using a centralised database for user management.
This will override the password changes done locally on Stallo.

The password can be changed on the
`password metacenter page <https://www.metacenter.no/public/password/>`_, log in using your
username on Stallo and the NOTUR domain.


Installing software
===================

Can I install Python software as a normal user without sudo rights?
-------------------------------------------------------------------

Yes. The recommended way to achieve this is using
virtual environments: http://docs.python-guide.org/en/latest/dev/virtualenvs/

Example (as an example we install the Biopython package)::

  $ module load gcc/4.9.1
  $ virtualenv venv
  $ source venv/bin/activate
  $ pip install biopython

Next time you log into the machine you have to activate
the virtual environment::

  $ source venv/bin/activate

And you do not have to call it "venv". It is no problem to have many
virtual environments in your home directory.

If you want to inherit system site packages into your virtual
environment, do this instead::

  $ virtualenv --system-site-packages venv
  $ source venv/bin/activate
  $ pip install biopython


Running software
================

Why is a specific node so incredibly slow compared to others?
-------------------------------------------------------------

The node is probably swapping.


What does swapping mean and why should I care?
----------------------------------------------

If the jobs consume more memory than the node physically has, the node starts
to swap out memory to the disk.  This typically means a significant slowdown of
the calculation.  And this is why you need to care about swapping: your
calculation will slow down to a grinding halt.  You can also crash the node
which is bad for us.


How can I check whether my calculation is swapping?
---------------------------------------------------

Option 1 (inside the university network) is to check
http://stallo-login1.uit.no/jobbrowser/.  Click on "nodes" and then the node in
question.  On the right hand panel you see "Memory last hour". If memory is
above the red mark, the node will swap.

Option 2 is to log into the node and run "top". On the top you see how much
memory is consumed and whether the node is swapping.


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

If you needs to export the display from a compute node to your desktop
you should

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
to add the following to your **local** ``~/.ssh/config`` file:

::

    ServerAliveCountMax 3
    ServerAliveInterval 10

(**local** means that you need to make these changes to your computer,
not on stallo)

The above config is for `OpenSSH <http://www.openssh.org>`_, if you're
using
`PUTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/docs.html>`_
you can take a look at this page explaining
`keepalives <http://the.earth.li/~sgtatham/putty/0.60/htmldoc/Chapter4.html#config-keepalive>`_
for a similar solution.


Jobs and queue system
=====================

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

On the webpage http://stallo-login1.uit.no/jobbrowser/ you can find information
about the current load on stallo, some information about the nodes, and the
information you would get from the showq command, which is described below. You
can also find information about your job and if you the job is running, you can
find graphs about its usage of the CPUs, memory and so on.

If you prefer to use the command line, to see the job queue use::

  $ squeue


CPU v.s. core
-------------

In this documentation we are frequently using the term *CPU*, which in
most cases are equivalent to the more precise term *processor core* /
*core*\. The \ *multi core age*\  is here now \ *:-)*


Running many short tasks
========================

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


Running tasks in parallel within one job
----------------------------------------

By using some shell trickery one can spawn and load-balance multiple
independent task running in parallel within one node, just background
the tasks and poll to see when some task is finished until you spawn the
next:

.. literalinclude:: files/multiple.sh
   :language: bash
   :linenos:

And here is the ``dowork.sh`` script:

.. literalinclude:: files/dowork.sh
   :language: bash
   :linenos:


MPI
===

My MPI application runs out of memory
-------------------------------------

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

For more information about openmpi tunables see the
`open-mpi page <http://www.open-mpi.org/faq/?category=openfabrics#limiting-registered-memory-usage>`__.


My mpi job crashes with a retry limit exceeded error
----------------------------------------------------

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
:ref:`exclude-a-node-from-running-a-job` to find out how to run a
dummy job on a specific node.

If this does not help, send us a problem report.


Tuning OpenMPI performance - non default settings on Stallo
-----------------------------------------------------------

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


My MPI application hangs on startup
-----------------------------------

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
recompiling and in your job script::

  $ module unload openmpi
  $ module load openmpi/1.2.4
  $ module load intel-compiler

Please tell us if this helps for you application. We try to get an idea
of the extent of this problem. Send a report to support-uit@notur.no.
