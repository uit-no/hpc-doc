
.. _application-development:

Application development on stallo
=================================

A rich set of compilers, tools, debuggers and libraries are installed on
stallo. By default the Intel compiler suite is loaded upon login,
together with OpenMPI for parallel execution.

For a complete list of development software installed on stallo, consult the
`software directory <http://hpc.uit.no/software>`_. If you find some
important program or library missing, please contact support-uit@notur.no.

:doc:`Compilers <compilers>`
---------------------------

The default development environment on stallo is provided by Intel Cluster
Studio XE.  In general users are advised to use the `Intel compilers
<compilers#intel-compilers>`_ and `performance libraries
<libraries#intel-mkl>`_, since they usually give the best performance.

*For more information, see the :doc:`compiler page <compilers>`.*

:doc:`Debugging <debugging>`
---------------------------

TotalView is the primary debugger on stallo. It has a graphical interface,
and excellent capabilities for debugging parallel programs.

*For more information, see the :doc:`debugging page <debugging>`.*

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

:doc:`Useful tools and software <tools>`
----------------------------------------

To efficiently manage, build and develop software on stallo some excellent
tools and services are available. Source code management using ``git``,
including private hosting and project management tools, are available to
users. Building programs using ``CMake`` is easy and painless, and takes care
of all system dependencies.

*For more information, see the :doc:`tools page <tools>`.*

:doc:`Scripting <scripting>`
----------------------------

A rich set of scripting tools and languages are available on stallo, including
Python, Bash, Lua, R, Perl, Ruby.

*For more information, see the :doc:`scripting page <scripting>`.*
