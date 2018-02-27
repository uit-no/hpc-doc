.. _ADFprog:

====================================
Amsterdam Density Functional program
====================================

Information regarding the quantum chemistry code ADF on Stallo

General Information
===================

Description
-----------

According to the vendor, ADF (Amsterdam Density Functional) is a DFT program particularly strong in understanding and predicting structure, reactivity, and spectra of molecules. It is a Fortran program for calculations on atoms and molecules (in gas phase or solution). It can be used for the study of such diverse fields as molecular spectroscopy, organic and inorganic chemistry, crystallography and pharmacochemistry.

The underlying theory is the Kohn-Sham approach to Density-Functional Theory (DFT).  The software is a DFT-only first-principles electronic structure calculations program system, and consists of a rich variety of packages.


Online documentation from vendor
--------------------------------

* Documentation: https://www.scm.com/doc/ADF


Usage
=====

The ADF/BAND suite of software is currently installed as precompiled binaries on Stallo. We install the intel-mpi version, since it has proven to collaborate the better with our mpi setup. We generally advise to run ADF on more than one node, unless you do know that your particular problem does not make the code scale well.


Use

.. code-block:: bash

    $ module avail ADF

to see which versions of ADF which are available. Use

.. code-block:: bash

 $ module load ADF/<version> # i.e adf2017.108

to get access to any given version of ADF.
