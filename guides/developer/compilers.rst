---
toc: no
title: Compiler guide
...

Compiler and programming languages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Information about the Fortran, C and C++ compilers.

Fortran compiler
----------------

The recommended Fortran compiler is the Intel Fortran Compiler: ifort.
The gfortran compiler is also installed, but we do not recommend it
for general usage.

Usage of the Intel ifort compiler
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plain Fortran codes
For plain Fortran codes (all Fortran standards) the general form
for usage of the Intel ifort  compiler is as follows:

::

    ifort [options] file1 [file2 ...]         - Same for ALL Fortran standards

where options represents zero or more compiler options, and fileN is a
Fortran source (.f .for .ftn .f90 .fpp .F .FOR .F90 .i .i90), assembly
(.s .S), object (.o), static library (.a), or an other linkable file.
Commonly used options may be placed in the ifort.cfg file. 


OpenMP based Fortran codes
The form above also applies for Fortran codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <http://en.wikipedia.org/wiki/Openmp>`_); you only have to
select the necessary compiler options for OpenMP.

MPI based Fortran codes
For Fortran codes parallelized with MPI the general form is quite
similar:

::

    mpif90 [options] file1 [file2 ...]       

mpif90 is using the the Intel Ifort compiler, it is just a wrapper
that invokes all the necessary MPI stuff automatically for you.
Therefore, everything else is the same for compiling MPI codes as for
compiling plain Fortran codes. Please check the `section about MPI
Libraries <../../../../../../../uit/stallo_documentation/user_guide/mpi-libraries>`_
for more information about using MPI on Stallo.

Intel Fortran Compiler Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In general we will recommend our users to approach the Intel ifort
documentation in the following order:

-  `Intel® Fortran Compiler – Get
   Help <http://www.intel.com/cd/software/products/asmo-na/eng/279831.htm>`_
   (web page at Intel)
-  `Intel® Fortran Compiler –
   Documentation <http://www.intel.com/cd/software/products/asmo-na/eng/346152.htm>`_
   (web page at Intel)
-  `Intel® Fortran Compiler 10.1 for Linux  – Product Tips and
   Samples <http://www.intel.com/cd/software/products/asmo-na/eng/346126.htm>`_
   (web page at Intel)
-  see also the section :doc:`Compiler Options <#compiler-options>` below

C and C++ compilers
-------------------
The recommended C and C++ compilers are the Intel Compilers; icc  (C)
and  icpc (C++).
The gcc  compiler is also installed, but we do not recommend it for
general usage due to performance issues.

Usage of the Intel C/C++ compilers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plain C/C++ codes
For plain C/C++ codes the general form for usage of the Intel
icc/icpc  compilers are as follows:

::

    icc  [options] file1 [file2 ...]          (C)
    icpc [options] file1 [file2 ...]          (C++)

where options represents zero or more compiler options, fileN is a
C/C++ source (.C .c .cc .cpp .cxx .c++ .i .ii), assembly (.s .S), object
(.o), static library (.a), or other linkable file. Commonly used options
may be placed in the icc.cfg file (C) or the icpc.cfg (C++).

OpenMP based C/C++ codes
The form above also applies for C/C++ codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <http://en.wikipedia.org/wiki/Openmp>`_); you only have to
select the necessary compiler options for OpenMP.

MPI based C/C++ codes
For C/C++ codes parallelized with MPI  the general form is quite
similar:

::

    mpicc [options] file1 [file2 ...]          - for C when using OpenMPI
    mpiCC [options] file1 [file2 ...]          - For C++ when using OpenMPI

Both mpicc mpiCC are using the the Intel compilers, they are just
wrappers that invokes all the necessary MPI stuff automatically for
you. Therefore, everything else is the same for compiling MPI codes as
for compiling plain C/C++ codes. Please check the `section abut MPI
Libraries <mpi-libraries>`_ for more information about using MPI.
