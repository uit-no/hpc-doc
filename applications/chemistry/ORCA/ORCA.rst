.. _ORCA:

====
ORCA
====

Some users have requested an installation of the ORCA quantum chemistry program
on Stallo. Unfortunately, ORCA does not come with a computer center license,
which basically means that we cannot easily install it globally on Stallo.
However, the code is free of charge and available for single users or at
research group level, provided compliance with the *ORCA End User License
Agreement*. This means that interested users can download the precompiled
executables from the ORCA web page themselves, and run the code on Stallo.

* Homepage: https://orcaforum.kofo.mpg.de


Installation
============

The following has been tested for version 4.2.1 on Stallo:

1) Go to the ORCA forum page and register as user
2) Wait for activation e-mail (beware of spam filters...)
3) Log in and click on **Downloads** in the top menu
4) Download the Linux x86-64 complete archive and place it somewhere in your home folder
5) Extract the tarball: ``$ tar xf orca_4_2_1_linux_x86-64_openmpi314.tar.xz``
6) The ``orca`` executable is located in the extracted archive and should work out of the box


Usage
=====

In order to run ORCA in parallel the OpenMPI module must be loaded, and it is
important to use the **full path** to the executable

.. code-block:: bash

    $ module load OpenMPI/3.1.3-GCC-8.2.0-2.31.1
    $ /full/path/to/orca orca.inp >orca.out

Note that the calculation should not be launched by ``mpirun``, but you should use
the input keyword ``nprocs``. A very simple example input file is provided below.
Please refer to the ORCA manual (can be downloaded from the same download page
on the ORCA forum) for details on how to run the code for your application.


ORCA input example
------------------

.. include:: ../files/orca.inp
   :literal:
