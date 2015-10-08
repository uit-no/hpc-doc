

Compilers
=========

The default development environment on Stallo is provided by Intel Cluster
Studio XE. In general users are advised to use the Intel compilers and
MKL performance libraries, since they usually give the best performance.


Fortran compilers
-----------------

The recommended Fortran compiler is the Intel Fortran Compiler: ifort.
The gfortran compiler is also installed, but we do not recommend it
for general usage.


Usage of the Intel ifort compiler
---------------------------------

For plain Fortran codes (all Fortran standards) the general form
for usage of the Intel ifort compiler is as follows::

  $ ifort [options] file1 [file2 ...]

where options represents zero or more compiler options, and fileN is a
Fortran source (.f .for .ftn .f90 .fpp .F .FOR .F90 .i .i90), assembly
(.s .S), object (.o), static library (.a), or an other linkable file.
Commonly used options may be placed in the ifort.cfg file.

The form above also applies for Fortran codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <http://en.wikipedia.org/wiki/Openmp>`_); you only have to
select the necessary compiler options for OpenMP.

For Fortran codes parallelized with MPI the general form is quite
similar::

  $ mpif90 [options] file1 [file2 ...]

The wrapper mpif90 is using the Intel ifort compiler and invokes all the
necessary MPI machinery automatically for you.  Therefore, everything else is
the same for compiling MPI codes as for compiling plain Fortran codes.


C and C++ compilers
-------------------

The recommended C and C++ compilers are the Intel Compilers; icc (C) and icpc
(C++). The gcc and g++ compilers are also installed, but we do not recommend
them for general usage due to performance issues.


Usage of the Intel C/C++ compilers
----------------------------------

For plain C/C++ codes the general form for usage of the Intel
icc/icpc  compilers are as follows::

  $ icc  [options] file1 [file2 ...]  # for C
  $ icpc [options] file1 [file2 ...]  # for C++

where options represents zero or more compiler options, fileN is a
C/C++ source (.C .c .cc .cpp .cxx .c++ .i .ii), assembly (.s .S), object
(.o), static library (.a), or other linkable file. Commonly used options
may be placed in the icc.cfg file (C) or the icpc.cfg (C++).

The form above also applies for C/C++ codes parallelized with OpenMP
(`www.openmp.org <http://www.openmp.org/>`_,
`Wikipedia <http://en.wikipedia.org/wiki/Openmp>`_); you only have to
select the necessary compiler options for OpenMP.

For C/C++ codes parallelized with MPI the general form is quite
similar::

  $ mpicc [options] file1 [file2 ...]  # for C when using OpenMPI
  $ mpiCC [options] file1 [file2 ...]  # For C++ when using OpenMPI

Both mpicc and mpiCC are using the Intel compilers, they are just
wrappers that invoke all the necessary MPI machinery automatically for
you. Therefore, everything else is the same for compiling MPI codes as
for compiling plain C/C++ codes.
