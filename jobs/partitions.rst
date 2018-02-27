.. _label_partitions:

Partitions (queues) and services
================================

SLURM differs slightly from the previous Torque system with respect to
definitions of various parameters, and what was known as queues in Torque may
be covered by both ``--partition=...`` and ``--qos=...``.

We have the following partitions:

short:
    For testing and debugging. Up to 1 hour of walltime.

normal:
    The default partition. Up to 48 hours of walltime.

singlenode:
    If you ask for less resources than available on one single node, this will be the partition your job
    will be put in. We may remove the single-user policy on this partition in the future.
    This partition is also for single-node jobs that run for longer than 48 hours.

multinode:
    Request this partition if you ask for more resources than you will find on
    one node and request walltime longer than 48 hrs.

To figure out the walltime limits for the various partitions, type::

  $ sinfo --format="%P %l"

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
can ask for increased limits by sending a request to
support-uit@notur.no.

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
