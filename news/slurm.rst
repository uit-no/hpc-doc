
.. figure:: slurm.jpg

   Credit: Futurama (http://futurama.wikia.com/wiki/Slurms_MacKenzie)


.. _slurm:


We have migrated to the SLURM resource manager
==============================================

As of October 1st 2016 stallo.uit.no will have a new official queuing system,
named `SLURM <http://slurm.schedmd.com/>`_ (Simple Linux Utility for Resource
Management).

To get a soft start for all, the old queuing system will still be functional
and accept jobs as usual.  We will only start out with 152 nodes in the SLURM
part of the cluster, the rest will stay with the old torque.  Slowly we will
move more and more nodes from torque into SLURM, as nodes free up from running
jobs.

Since the cluster has 2 queuing systems you will have to check both queues to
get the full picture of the load on the system, this is of course unfortunate
but it has to stay this way until the transition is fully completed.

The highmem nodes will remain in torque for now.

Jobs already submitted to torque will stay within this queue, so if you would
like to move your jobs to SLURM you have to resubmit yourself.

If you use the `Abel
<http://www.uio.no/english/services/it/research/hpc/abel/>`_ cluster at UiO you
are already familiar with SLURM and should find it rather easy to switch.  The
new NOTUR supercomputers will also run SLURM.

The torque software has served us well for many years, however it is no longer
actively maintained.  We have encountered bugs in the system that diminish the
utilization of the cluster, as this is not acceptable we have chosen to switch
to SLURM.  By this we hope that you will find the user experience across
Norwegian HPC systems will be more uniform.
