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

 

Compiler Options
~~~~~~~~~~~~~~~~

Below you will find a complete list of compiler options for the
Intel    compilers (the compiler options are essentially identical
for the ifort, icc or icpc compilers), but we have also made a list with
selected compiler options which we recommend for getting started, plus a
list with some options we consider as "nice to know".

* `List of compiler options ('ifort, icc or icpc -help')
    <../../files-uit/icc-9-x-documents/icc-9-x-compiler-options-list>`_
* `Options for getting
   started <../../files-uit/icc-9-x-documents/icc-icpc-9-x-recommended-compiler-options>`_
* `Options "nice to
   know" <../../files-uit/icc-9-x-documents/icc-icpc-9-x-nice-to-know-options>`_
* `Quick-Reference Guide to Optimization with Intel(R)
   Compilers. <../../files-uit/intel-qref-222300_222300.pdf>`_

Intel C/C++ Compiler Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In general we will recommend our users to approach the Intel C/C++
documentation in the following order:

#. Start out with the `'icc/icpc
    -help  ' <../../files-uit/icc-9-x-documents/icc-9-x-compiler-options-list/>`_
    information, where you will find all(  ?) the compiler options for
    the compilers in a compact and structured way (this information is
    identical for icc and icpc). Do not pay too much attention to the
    subjects that the options are sorted under, because it may well happen
    that you will find the option you are looking for under a different
    subject than you first expected.
#. If further / more detailed information is needed (or something is
    missing in 'icc/icpc -help'), check out the manual page for the
    icc/icpc compiler, '`man
    icc/icpc <../../files-uit/icc-9-x-documents/man-icc-9.x.htm/view>`_  ',
    where all options are described in detail (The manual pages are
    identical for icc and icpc).
#. If even further information is needed you should consult the rather
    huge `reference manuals for the
    icc/icpc  compilers <../manual/intel/c>`_. NB! Please notice
    that these manuals also contain information for all other supported
    OS's. For the most recent updated versions of the manuals, please check
    the following `Intel
    page <http://developer.intel.com/software/products/>`_ (Then go to:
    Compilers -->  Linux --> Intel C/C++ Compiler for Linux --> Support
    Resources).

.. vim:ft=rst
