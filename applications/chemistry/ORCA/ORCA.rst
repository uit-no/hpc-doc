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

* Homepage: https://orcaforum.cec.mpg.de/

* Manual: https://orcaforum.cec.mpg.de/OrcaManual.pdf

* Download: https://cec.mpg.de/orcadownload/index.php


Installation
============

1) Go to the ORCA download page and accept the terms of use by filling in your credentials
2) Download the Linux x86-64 complete archive and place it somewhere in your home folder
3) Extract the tarball

.. code-block:: bash

    $ tar xjvf orca_4_0_0_2_linux_x86-64_openmpi202.tbz

4) The ``orca`` executable is located in the extracted archive and should work out of the box


Usage
=====

In order to run ORCA in parallel the OpenMPI module must be loaded, and it is
important to use the **full path** to the executable

.. code-block:: bash

    $ module load OpenMPI/2.0.2-GCC-6.3.0-2.27
    $ /full/path/to/orca orca.inp >orca.out

A very simple example input file is provided below. Please refer to the ORCA
manual for details on how to run the code for your application.


ORCA input example
------------------

.. include:: ../files/orca.inp
   :literal:
