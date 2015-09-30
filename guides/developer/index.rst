
.. _application-development:

Application development on stallo
=================================

A rich set of compilers, tools, debuggers and libraries are installed on
stallo. By default the Intel compiler suite is loaded upon login,
together with OpenMPI for parallel execution.

For a complete list of development software installed on stallo, consult the
`software directory <http://hpc.uit.no/software>`_. If you find some
important program or library missing, please contact support-uit@notur.no.

:doc:`Performance analysis and optimization <optimization>`.
--------------------------------------------------------
A large number of tools for analyzing both single- and multi-core, as well as
MPI parallel performance are available.

*For more information, see the :doc:`optimization page <optimization>`.*

:doc:`Libraries <libraries>`
-----------------------------

The :doc:`Intel Math Kernel Library <libraries#intel-mkl>` (MKL) contains a large
collection of highly optimized math routines for high-performance computing.
It has both single- and multi-threaded versions of most routines, and users
are encouraged to use MKL for optimal performance on stallo.

*For more information, see the :doc:`libraries page <libraries>`.*

:doc:`Parallel programming <parallel>`
--------------------------------------

To leverage the computing power of stallo programs must be run in
parallel. The compute nodes on stallo are equipped with fast system buses,
and are interconnected with an Infiniband network. This makes it feasible to
run efficiently in parallel, even when substantial amounts of communication is
required.

*For more information, see the :doc:`parallel programming page <parallel>`.*
