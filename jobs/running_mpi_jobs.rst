

Running MPI jobs
================

There are two available MPI implementations on Stallo:

- OpenMPI provided by the ``foss`` module, e.g. ``module load foss/2016b``
- Intel MPI provided by the ``intel`` module, e.g. ``module load intel/2016b``

There are several ways of launching an MPI application within a SLURM
allocation, e.g. ``srun``, ``mpirun``, ``mpiexec`` and ``mpiexec.hydra``.
Unfortunately, the best way to launch your program depends on the MPI
implementation (and possibly your application), and choosing the wrong command
can severly affect the efficiency of your parallel run. Our recommendation is
the following:

Intel MPI
---------

With Intel MPI, we have found that ``mpirun`` can incorrectly distribute the
MPI ranks among the allocated nodes. We thus recommend using ``srun``::

    $ srun --mpi=pmi2 ./my_application

OpenMPI
-------

With OpenMPI, ``mpirun`` seems to be working correctly. Also, it seems that
``srun`` fails to launch your application in parallel, so here we recommend
using ``mpirun``::

    $ mpirun ./my_application

NOTE: If you're running on the ``multinode`` partition you automatically
get the ``--exclusive`` flag, e.i. you get allocated (and charged for) **full**
nodes, even if you explicitly ask for less resources per node. This is not the
case for the ``normal`` partition.
