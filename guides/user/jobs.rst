
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

The batch system on Stallo consists of a resource manager,
`Torque <http://www.clusterresources.com/products/torque>`_, and a
scheduler, `Maui <http://www.clusterresources.com/products/maui>`_.
Torque keeps track of the state of the system while Maui decides when
and where to run the jobs.

Batch job submission
====================


Create a job 
============

To run a job on the system one needs to create a job script. A job
script is a regular shell script (bash or csh) with some directives
specifying number of cpus, memory etc. that will be interpreted by the
batch system upon submission. See the :doc:`firstjob example <./firstjob>` to get 
a quick feel for how to create and run batch jobs.  A more complete example 
can be found :doc:`here <./job-script-example>`.

Manage a job 
============

A job's lifecycle can be managed with as little as three different
commands

#. Submit the job with ``qsub jobscript.sh``.
#. Check the job status with ``showq``. (to limit the display to only
   your jobs use ``showq -u username``.)
#. (optional) Delete the job with ``qdel jobid``.

List of useful commands
=======================

Managing jobs
-------------

See the man page for each command for details.

qsub:
    Submit jobs. All job parameters can be specified on the command line or
    in the job script. Command line arguments take precedence over
    directives in the script.
qdel:
    Delete a job. Use ``qdel all`` to terminate all your jobs immediately.

Getting job info 
----------------

For details run the command with the -h option.

qstat:
    Show jobs in the queue. Jobs will be sorted by submit order.
showq:
    List jobs in the queue. Jobs will be sorted by time to completion. To
    only see jobs for a specific user use ``showq -u username``.
checkjob:
    Show details about a specific job.

Useful job script parameters 
============================

See the :doc:`jobscript example <./job-script-example>` for a list of relevant parameters.


Recommended job parameters
==========================

Walltime
--------

We recommend you to be as precise as you can when specifying the
parameters as they will inflict on how fast your jobs will start to run
we generally have these two rules for prioritizing jobs:

#. Large jobs, that is jobs with high cpucounts, are prioritized.
#. Short jobs take precedence over long jobs.

Cpucount
--------

We strongly advice all users to ask for all cpus on a node when running 
multinode
jobs, that is, submit the job with ``-lnodes=X:ppn=16``.  This will make the 
best use
of the resources and give the most predictable execution times. For single node 
jobs,
 e.g. jobs that ask for less than 16 cpus, we recommend to use 
``-lnodes=1:ppn={1,2,4,8 or 16}``, this will make it possible for the batch 
system scheduler to fill up the compute nodes completely.
A warning will be issued if these recommendations are not followed.

Scalability
-----------

You should run a few tests to see what is the best fit between
minimizing runtime and maximizing your allocated cpu-quota. That is you
should not ask for more cpus for a job than you really can utilize
efficiently. Try to run your job on 1,2,4,8,16 cpus and so on to see
when the runtime for your job starts tailing off. When you start to see
less than 30% improvement in runtime when doubling the cpu-counts you
should probably not go any further. We have started to make some
recommendations on the most used applications
:doc:`here </application-support>`.



Queues
======

In general it is not neccessary to specify a specific queue for your
job, the batch system will route your job to the right queue
automatically based on your job parameters. There are two exceptions to
this, the express and the highmem queue

express:
    Jobs will get higher priority than jobs in other queues. Submit with
    qsub -q express .... **Limits:** Max walltime is 8 hours, no other resource
    limits, but there are very strict limits on the number of jobs running
    etc. (:doc:`Details <./expressqueue>`)
highmem:
    Jobs will get access to the nodes with large memory (32GB). Submit with
    ``qsub -q highmem ....`` 
    **Limits:** Restricted access, send a request to
    :doc:`support <mailto:support-uit@uit.no>` to get access to this queue. Jobs will be restricted to the 32 nodes with 128GB memory.

Other queues

default:
    The default queue. Routes jobs to the queues below.
short:
    Jobs in this queue is allowed to run on any nodes, also the highmem
    nodes. **Limits:** walltime < 48 hours.
singlenode:
    Jobs that will run within one compute node will end up in this queue.
multinode:
    Contains jobs that span multiple nodes.

Again, it is not neccessary to ask for any specific queue unless you
want to use ``express`` or ``highmem``.

Use of large memory nodes
=========================

Large memory nodes
---------------------

Stallo has 32 compute nodes with 128GB memory each (the 272 others have
32GB memory).

To use the large memory nodes you should ask for access to the
``highmem`` queue, just send a mail to support-uit@notur.no. After being
granted access to the ``highmem`` queue you can submit directly to the
queue:

::

    qsub -q highmem .........

Remark: You only need to apply for access to the large memory nodes
if you want to run jobs that have more than 48 hours walltime limit on
these nodes.

Short jobs requiring less than 48 hours runtime can get assigned to the
highmem nodes without running in the ``highmem`` queue. This can happen
if you submit requiring more than 2gb memory per process:

::

    qsub -lnodes=2:ppn=16,pmem=4gb,walltime=12:00:00 .........

Interactive job submission
==========================

You can run an interactive jobs by using the ``-I`` flag to qsub:

::

    qsub -I .......

The command prompt will appear as soon as the job start. If you also
want to run a graphical application you must also use ``-X`` flag.
Interactive jobs has the same policies as normal batch jobs, there are
no extra restrictions.

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
Maximum walltime                No limit
Maximum memory per job          No limit:sup:`1`
============================== =================

:sup:`1` There is a practical limit of 128GB per compute node used.


**Remark:** Even if we do not impose any limit on the length of the jobs
on stallo we only give a weeks warning on system maintenance. Jobs with
more than 7 days walltime, will be terminated and restarted if possible.

Scheduling policy on the machine
================================

Priority
--------

The scheduler is set up to

#. prioritize large jobs, that is, jobs that request large amount of
   cpus.
#. prioritize short jobs. The priority is calculated as proportional to
   the expansion factor: (queuetime+walltime)/walltime.
#. use fairshare, so a users with a lot of jobs running will get a
   decreased priority compared to other users.

Resource Limits
---------------

No user will be allowed to have more than 168 000 cpu-hours allocated
for running jobs at any time. This means that a user at most can
allocate 1000 cpus for a week for concurrently running jobs (or 500 cpus
for two weeks or 2000 cpus for half a week).

No single user will be allowed to use more than 500 jobs at any time.
(you can well submit more, but you cannot have more than 500 running at
the same time)

Users can apply for exceptions to these rules by contacting
support-uit@notur.no.



The stallo archictecture
------------------------

Before we dive into the details we need to say a few things about the
stallo architecture.

-  The Stallo cluster has 304 compute nodes with 16 cpu-cores each
   totalling 4864 cpu-cores (hereafter denoted as cpus).
-  The Stallo cluster has two different memory configurations, 272 nodes
   have 32GB memory and 32 nodes have 128GB memory.
-  The Stallo cluster has all nodes connected with a high speed network_ which 
gives very high throughput and low latency.  The network is split into *islands* 
with 128 nodes/2048 cpus each and jobs will run within one single island. This 
is done automatically by the scheduler.


.. _network: http://en.wikipedia.org/wiki/InfiniBand


.. FIXME

See :doc:`here <./key-numbers-about-stallo/>` for more details.

Job to node mapping
-------------------

The basic philosophy for the job to node mapping is to run the job on the nodes best
suited for the task.

-  Short jobs are allowed to run anywhere. Short jobs are defined as
   jobs with walltime < 48 hours.
-  Large memory jobs with walltime > 48 should run in the highmem queue.
   This queue is restricted access so the user will need to notify the
   support team if access to these nodes are needed. Memory usage in
   this queue will be monitored to prevent misuse.


Examples.
---------

Short jobs:

::

    qsub -lnodes=1:ppn=16,walltime=48:00:00 ........

Will be allowed to run anywhere.

Long jobs:

::

    qsub -lnodes=8:ppn=16,walltime=240:00:00 .........

Will run within one island, but not on the highmem nodes.


Highmem jobs:

::

    qsub -q highmem -lnodes=1:ppn=16,pmem=8gb,walltime=240:00:00 ........

This job will run on the highmem nodes if the user is granted access by
the administrators. Otherwise it will never start. **pmem** is memory per 
process.





Express queue for testing job scripts and interactive jobs.
===========================================================


By submitting a job to the express queue you can get higher throughput
for testing and shorter start up time for interactive jobs. Just use the
``-q express`` flag to submit to this queue:

::

    qsub -q express jobscript.sh

or for an interactive job:

::

    qsub -q express -I

This will give you a faster access if you have special needs during
development, testing of job script logic or interactive use.

Priority and limitations
========================

Jobs in the express queue will get higher priority than any other jobs
in the system and will thus have a shorter queue delay than regular
jobs. To prevent misuse the express queue has the following limitations:

*  Only one running job per user.
*  Maximum 8 hours walltime.
*  Maximum 8 nodes per job. This allows for jobs requesting up to 64
   cpus to run in the queue, ``-lnodes=8:ppn=8``. Remark:
   ``-lnodes=64`` will NOT work, the nodes number must be less than or
   equal 8.
*  Only one job queued at any time, remark this is for the whole queue.
   This is to prevent express jobs delaying large regular jobs.

So, it is more or less pointless to try to use the express queue to
sneak regular production jobs passed the other regular jobs. Submitting
a large amount of jobs to the express queue will most probably decrease
the overall throughput of your jobs. Also remark that large jobs get
prioritized anyway so they will most probably not benefit anything from
using the express queue.




.. vim:ft=rst
