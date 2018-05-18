.. _TURBOMOLE:

============================
The TURBOMOLE program system
============================

Information regarding the quantum chemistry program system TURBOMOLE.

Related information
===================

.. toctree::
 :maxdepth: 1

 run_turbo.rst


General Information
===================

Description
-----------

TURBOMOLE is a quantum chemical program package, initially developed in the
group of Prof. Dr. Reinhart Ahlrichs at the University of Karlsruhe and at the
Forschungszentrum Karlsruhe. In 2007, the TURBOMOLE GmbH (Ltd) was founded by
the main developers of the program, and the company took over the responsibility
for the coordination of the scientific development of the program, to which it
holds all copy and intellectual property rights. 


Online info from vendor
-----------------------

* Homepage: http://www.turbomole-gmbh.com
* Documentation: http://www.turbomole-gmbh.com/turbomole-manuals.html


License information
-------------------

Sigma2 holds a national TURBOMOLE license covering all computing centers in Norway.


Citation
--------

When publishing results obtained with this software, please check with the
developers web page in order to find the correct citation(s).


TURBOMOLE on Stallo
===================

Usage
-----

To see which versions of TURBOMOLE are available

.. code-block:: bash

    $ module avail turbomole

Note that the latest (as of May 2018) version 7.2 comes in three different
parallelization variants

* TURBOMOLE/7.2
* TURBOMOLE/7.2.mpi
* TURBOMOLE/7.2.smp

where the latter two correspond to the old separation between distributed memory
(mpi) and shared memory (smp) implementations that some users may know from
previous versions of the program. We recommend, however, to use the new hybrid
parallelization scheme (new in v7.2) provided by the ``TURBOMOLE/7.2`` module.

In order to run efficiently in hybrid parallel the SLURM setup must be correct
by specifying CPUs rather than tasks per node

.. code-block:: bash

    #SBATCH --nodes=2
    #SBATCH --ntasks-per-node=1
    #SBATCH --cpus-per-task=20

i.e. do NOT specify ``--ntasks=40``. Also, some environment variables must be
set in the run script

.. code-block:: bash

    export TURBOTMPDIR=/global/work/${USER}/${SLURM_JOBID}
    export PARNODES=${SLURM_NTASKS}
    export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

See the TURBOMOLE example for more details.

NOTE: The new hybrid program (v7.2) will launch a separate server process in
addition to the requested parallel processes, so if you run e.g. on 20 cores
each on two nodes you will find one process consuming up to 2000% CPU on each
node plus a single process on the first node consuming very little CPU.

NOTE: We have found that the hybrid program (v7.2) runs efficiently only if
*full* nodes are used, e.i. you should always ask for ``--cpus-per-node=20``,
and scale the number of nodes by the size of the calculation.

