
top, time command, lsof, starce, valgrind cache profiler, Compiler
flags, IPM, Vtune

In general, in order to reach performances close to the theoretical
peak, it is necessary to write your algorithms in a form that allows the
use of scientific library routines, such as BLACS/LAPACK. See `General
software and libraries 
<http://docs.notur.no/uit/stallo_documentation/user_guide/faqsection_view?section=General%20software%20and%20libraries>`_
for available and recommended libraries.



Document Actions
''''''''''''''''

Performance tuning by Compiler flags.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Quick n'dirty.
--------------
Use ``ifort/icc -O3``.
We usually recommend that you use the ``ifort/icc`` compilers as
they give superior performance on Stallo. Using ``-O3`` is a quick
way to get reasonable performance for most applications.  Unfortunately,
sometimes the compiler break the code with ``-O3`` making it crash
or give incorrect results.  Try a lower optimization, ``-O2`` or
``-O1``, if this doesn't help, let us know and we will try to solve
this or report a compiler bug to INTEL.  If you need to use ``-O2``
or ``-O1`` instead of ``-O3`` please remember to add the
``-ftz`` too, this will flush small values to zero.  Doing this can
have a huge impact on the performance of your application.

Profile based optimization
------------------------------------
The intel compilers can do something called  profile based
optimization .  This uses information from the execution of the
application to create more effective code.  It is important that you run
the application with a typical input set or else the compiler will tune
the application for another usage profile than you are interested in. 
With a typical input set one means for instance a full spatial input
set, but using just a few iterations for the time stepping.

#. Compile with ``-prof _gen``.
#. Run the app (might take a long time as optimization is turned off in
    this stage).
#. Recompile with ``-prof _use``.
    The simplest case is to compile/run/recompile in the same catalog or
    else you need to use the ``-prof _dir`` flag, see the manual for
    details.

 

 

IPM: MPI performance profiling
------------------------------

 

IPM is a tool which gives rapidly an overview over the time spent in the
different MPI calls. It is very simple to use and can also give a html
output with graphical representation of the results.

 

In your script or on the command line just  write

::

    module load ipm

and run you application as usual.

You can stop ipm with ipm _stop, and restart it with ipm _start.

At the end of the run you will get an overview (standard output):

::

    ##IPMv0.982####################################################################
    # 
    # command : a.out  (completed)
    # host    : stallo-1/x86_64_Linux          mpi_tasks : 1 on 1 nodes
    # start   : 04/30/10/13:09:19              wallclock : 0.002069 sec
    # stop    : 04/30/10/13:09:19              %comm     : 0.02 
    # gbytes  : 8.27026e-02 total              gflop/sec : 0.00000e+00 total
    #
    ##############################################################################
    # region  :        [ntasks] =      1
    #
    #                           [total]         <avg>           min           max 
    # entries                          1             1             1             1
    # wallclock                 0.002069      0.002069      0.002069      0.002069
    # user                      0.011998      0.011998      0.011998      0.011998
    # system                    0.024996      0.024996      0.024996      0.024996
    # mpi                    3.96278e-07   3.96278e-07   3.96278e-07   3.96278e-07
    # %comm                                  0.0191531     0.0191531     0.0191531
    # gflop/sec                        0             0             0             0
    # gbytes                   0.0827026     0.0827026     0.0827026     0.0827026
    #
    #
    #                            [time]       [calls]        <%mpi>      <%wall>
    # MPI_Comm_size          2.31201e-07             1         58.34         0.01
    # MPI_Comm_rank          1.65077e-07             1         41.66         0.01
    ###############################################################################

This will also produce a file like.

::

     MyName.1272624855.201741.0

You can then run the command (on the front-end, stallo-1 or stallo-2,
not a compute-node):

::

    ipm_parse -html MyName.1272624855.201741.0

Which produce a new directory with html files that you can visualize in
your browser:

::

     firefox a.out_1_MyName.1272624855.201741.0_ipm_unknown/index.html

 

Note that the use of hardware performance counter are not implemeted yet
on Stallo. Therefore IPM cannot give information about floating point
operations, cache use etc.

 

For more details refer to:

`http://ipm-hpc.sourceforge.net/userguide.html <http://ipm-hpc.sourceforge.net/overview.html>`_

 

Vtune
-----
 

Basic use of vtune
~~~~~~~~~~~~~~~~~~

::

    module unload openmpi
    module unload intel-compiler
    module load intel-compiler/12.0.4
    module load intel-mpi
    module load intel-tools
    amplxe-gui

<new project>, <new analysis> (choose Hotspots for example), <get
command line> and edit it. For a parallel run you will have something
like:

::

    mpirun -np 32 amplxe-cl -collect hotspots -follow-child -mrte-mode=auto -target-duration-type=short -no-allow-multiple-runs -no-analyze-system -data-limit=100 -slow-frames-threshold=40 -fast-frames-threshold=100 -r res -- /My/Path/MyProg.x

 


Compilers, libraries and tools
------------------------------

HPCToolkit
~~~~~~~~~~~~~~~~~~~~

HPCToolkit is a measurement tool for profiling application using
statistical sampling of the system timer or hardware performance
counters.

HPCToolkit is installed on Stallo, see
`http://hpctoolkit.org/ <http://hpctoolkit.org/>`_

 

Example of basic use
~~~~~~~~~~~~~~~~~~~~

On the compute-node:

::

    module load hpctoolkit
    mpiexec hpcrun-flat Myprog.x 

This will produce files such as
"Myprog.x.hpcrun-flat.compute-24-5.local.3310.0x0" . Each process
produces a separate file.

 

::

    hpcstruct Myprog.x > Myprog.psxml
    hpcprof-flat -I '/MyPath/To/Source/Code/' -S Myprog.psxml Myprog.x.hpcrun-flat.compute-24-5.local.3310.0x

One or more file can be included in the profile.

 

The results can be looked at from the front-end (stallo-2) with:

::

    module load hpctoolkit
    hpcviewer experiment-db/experiment.xml

The profiling information is given down to line numbers.

 

PAPI (Performance Application Programming Interface)
----------------------------------------------------

HPCToolkit make uses of some performance hardware counters.

You can read directly the counters if you include some calls to PAPI
routines into your code.

See `http://icl.cs.utk.edu/papi/ <http://icl.cs.utk.edu/papi/>`_ for
details.

 

The PAPI Library is installed on the compute-nodes only.

Here is a simple fortran example to measure the number of FLOP/s using
one of the high level PAPI functions:

::

    program testpapi

    real4 :: rtime, ptime,  mflops
    integer8 ::flpops

      call PAPIF_flops(rtime, ptime, flpops, mflops,ierr)

      call my_calc

      call PAPIF_flops(rtime, ptime, flpops, mflops,ierr)

         write (,90) rtime, ptime, flpops, mflops

    90   format('           Real time (secs) :', f15.3, &
               /'            CPU time (secs) :', f15.3,&
               /'Floating point instructions :', i15,&
               /'                     MFLOPS :', f15.3)

    end program testpapi

    subroutine my_calc
    real :: x
    x=0.5
    do i=1,100000000
       x=xx-0.8
    enddo
    if(x==1000)write(,)x
    end subroutine my_calc

Compile with

::

    ifort -I/usr/include -L/usr/lib64  -lpapi papi.f90

 

 

 

Using google-perftools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Overview  
-----------------------------------------------------------------------------------------------

Perf Tools is a collection of a high-performance multi-threaded malloc()
implementation, plus some pretty nifty performance analysis tools.

For more information
visit   `http://code.google.com/p/google-perftools/wiki/GooglePerformanceTools <http://code.google.com/p/google-perftools/wiki/GooglePerformanceTools>`_

Example  
---------------------------------------------------------------------------------------------

Note: this is by no means complete documentation, but simply gives you
an idea of what the API is like.

No recompilation is necessary to use these tools.

TC Malloc:

::

    gcc [...] -ltcmalloc

Heap Checker:

::

    gcc [...] -o myprogram -ltcmallocHEAPCHECK=normal ./myprogram

Heap Profiler:

::

    gcc [...] -o myprogram -ltcmallocHEAPPROFILE=/tmp/netheap ./myprogram

Cpu Profiler:

::

    gcc [...] -o myprogram -lprofilerCPUPROFILE=/tmp/profile ./myprogram

.. vim:ft=rst
