---
toc: no
title: Parallelization
...

Parallel applications
~~~~~~~~~~~~~~~~~~~~~~

MPI, OpenMP and Hybrid codes

MPI based Fortran, C or C++ codes
-------------------------------------

The compilation of Fortran,  C or C++ codes parallelized with
MPI,  the form is quite similar:

::

    mpif90 [options] file1 [file2 ...]         - for Fortran when using OpenMPI
    mpicc [options] file1 [file2 ...]          - for C when using OpenMPI
    mpiCC [options] file1 [file2 ...]          - For C++ when using OpenMPI

  mpif90, mpicc and mpiCC are using the Intel compilers, they are
just wrappers that invokes all the necessary MPI stuff automatically
for you. Therefore, everything else is the same for compiling MPI
codes as for compiling plain Fortran/C/C++ codes. Please check also the
:doc:`section about MPI Libraries <../mpi-libraries>` for more
information about using MPI.

To see exactly what the wrappers do, you can use the "--showme" option,
for example:

::

    $ mpif90 --showme
    ifort -I/global/apps/openmpi/1.3.3/include -I/global/apps/openmpi/1.3.3/lib -L/opt/torque/lib64 -Wl,--rpath -Wl,/opt/torque/lib64 -L/global/apps/openmpi/1.3.3/lib -lmpi_f90 -lmpi_f77 -lmpi -lopen-rte -lopen-pal -lrdmacm -libverbs -ltorque -ldl -lnsl -lutil

 

To start the MPI application:

::

    mpirun MyApplication

 This will use all the CPUs available

 

OpenMP based codes
----------------------

You only have to select the necessary compiler options for OpenMP. For
intel compilers:

::

    ifort -openmp MyApplication.f90
    icc -openmp MyApplication.c

 

and for hybrid MPI/OpenMP:

::

    mpif90 -openmp MyApplication.f90
    mpicc -openmp MyApplication.c

 Launch hybrid MPI/OpenMP applications:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For example 12 MPI processes with 8 threads each (i.e. uses 96 cores):

::

    export OMP_NUM_THREADS=8
    mpirun -np 12 -npernode 1 MyHybridApplication

OMP _NUM _THREADS=8 is the default, so it would normally not be
necessary to specify it.

Note that you must ensure that you have reserved 12 nodes (96 cores) for
this application:

::

    $PBS -lnodes=12:ppn=8

 

Checkpoint and restart of applications
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In normal conditions your job will not be suspended and resumed on
Stallo. Once your job is started it will run until it is finished or the
walltime limit is reached.

In special cases (system/power/hardware failure or reached walltime
limit), jobs may be interrupted. It is the users responsibility to
ensure that the necessary data is stored and provide the necessary
environment if the job is supposed to be restarted. 

Notes on MPI
~~~~~~~~~~~~~~~~~~~~~~

RDMA capabilities using OpenMPI

This section will present notes about different tests performed to
investigate the possibilities of RDMA (Remote Direct Memory Access) and
one sided communication using MPI on Stallo.

 

OpenMPI

A lot of info can be found at
`http://www.open-mpi.org <http://www.open-mpi.org>`_ , but here we will
fokus on an end user point of view.

 

 

Test: send without that the receiver node is in a MPI statement (i.e.
eager send)

We have first tested how large chunks of data can be send eagerly with
MPI _Send (i.e. which in effect does not block), even if the receiver
process is busy (not within a MPI call).

In order to obtain meaningful results the code must include a successful
communication between the actual processes before the eager send. This
is necessary to initialize MPI for eager send.
Otherwise the send cannot be eager. It is also after this
initialization, that resources are reserved in memory (MPI _Init is not
sufficient). A barrier is not enough: for example assume rank
0,1,2,3,4,5,6,7 are on one node and rank 8,9,10,11,12,13,14,15 on
another node,  a call to MPI _barrier will initialize the connection
between rank 0 and 8, or between rank 1 and 9, but not between 0 and 9.

 

For send between infiniband nodes the default limit for eager send is 12
kb and is determined by the parameter mca btl _openib _eager _limit.
This value can be changed by the user, for example:

::

    mpirun --mca btl_openib_eager_limit 65000 -pernode a.out

btl _openib _eager _limit must be <= btl _openib _max _send _size (64kB
default). But this value can also be set differently, for example:

::

    mpirun --mca btl_openib_eager_limit 1000000 --mca btl_openib_max_send_size 1000000 -pernode a.out

 

For eager send within a node using MPI shared memory (sm), the default
limit is 4 kB, can be changed with for example:

::

    mpirun --mca btl_sm_eager_limit 1000000 -pernode a.out

 

For a send to itself, the default limit is 128kB, can be changed with
for example:

::

    mpirun --mca btl_self_eager_limit 2000000000  -np 2  a.out

 

 Important limitations
.........................

 OpenMPI will reserve about 600 times more memory than the value from
mca btl _openib _eager _limit. That means that for sending 10 MB eagerly
between nodes, about 6GB must be reserved exclusively for OpenMPI
buffers. (this doeshowever not seem to increase proportionnaly with the
number of nodes).

btl _openib _free _list _max must be large (>260) and this number times
mca btl _openib _eager _limit x 2 is reserved.

 

 

Non-blocking send
.........................

In the case of non-blocking send (MPI _Isend), the data will not
necessarily be sent before the next MPI call is reached in the caller
process. It will be sent properly betwen nodes, but not necessarily
within a node. The connection has also to be initialized (see above).

The limit of how much can be sent within a node with MPI _Isend is
determined by btl _sm _eager _limit. This parameter can be increased
without special memory penalty.

 

 

Conclusion
.........................

The best way to take advantage of RDMA is to use non-blocking send
(MPI _Isend) in conjunction with sufficiently high value of
btl _sm _eager _limit.

 

Intel MPI
.........................

The Intel MPI library has different rules. The default limit for eager
send is 64kB. This can be increased with an important limitation, see
below.
Syntax for increasing limits:

::

    module unload openmpi/1.4  
    module unload intel-compiler/11.1  
    module load intel-compiler/12.1.0      
    module load intel-mpi
    mpirun -np 16  -env I_MPI_EAGER_THRESHOLD 25600 -env I_MPI_INTRANODE_EAGER_THRESHOLD 2560 a.out

There are fundamental differences, compared to openMPI:

The "eager send" does not work as long as the receiving process is not
in a MPI call (not necessarily the corresponding receiving call). 

Increasing the threshold, does not have an important memory penalty as
in OpenMPI



MPI libraries
~~~~~~~~~~~~~~~~~~~~~~~

Information about the MPI libraries installed on Stallo.

 

OpenMPI
~~~~~~~

On stallo the default mpi-library is
`OpenMPI <http://www.open-mpi.org/>`_. You compile with mpicc/mpif90,
which will use the Intel compilers (`more
info <.#compilers-libraries-and-tools>`_

) for building the application. You can start your application with
mpirun like this

 

::

    mpirun your-mpi-application

No need for extra flags, mpirun will find out the right nodes to run on
directly from the queueing system, see the `example
runscript <job-script-example>`_

for a starting point.

 

More information about MPI

To find information and download various material, like courses, the
standard, program examples, and free implementations of MPICH for
Windows and most flavours of Unix, go to

-  `MPI on Netlib
    <http://www.netlib.org/mpi/>`_
-  `MPI Forum
    <http://www.mpi-forum.org/>`_
-  `Open MPI <http://www.open-mpi.org/>`_
-  `MPI on Wikipedia
    <http://en.wikipedia.org/wiki/Message_Passing_Interface>`_

.. vim:ft=rst
