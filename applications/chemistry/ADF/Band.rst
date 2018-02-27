.. _Band:

==========================
The periodic DFT code Band
==========================

Information regarding the periodic DFT code Band on Stallo. You may also be interested in this: :doc:`firsttime_band`.

General Information
===================

Description
-----------

BAND is an atomic-orbital based DFT program for periodic systems (crystals, slabs, chains and molecules).

The Amsterdam Density Functional Band-structure program - BAND - can be used for calculations on periodic systems, i.e. polymers, slabs and crystals, and is supplemental to the molecular ADF program for non-periodic systems. It employs density functional theory in the Kohn-Sham approach. BAND is very similar to ADF in the chosen algorithms, although important differences remain.

BAND makes use of atomic orbitals, it can handle elements throughout the periodic table, and has several analysis options available. BAND can use numerical atomic orbitals, so that the core is described very accurately. Because of the numerical orbitals BAND can calculate accurate total energies. Furthermore it can handle basis functions for arbitrary l-values.


Online info from vendor
-----------------------

* Documentation: https://www.scm.com/doc/BAND

Usage
=====

The ADF/BAND suite of software is currently installed as precompiled binaries on Stallo. We install the intel-mpi version, since it has proven to collaborate the better with our mpi setup. We generally advise to run Band on more than one node, unless you do know that your particular problem does not make the code scale well.


Use

.. code-block:: bash

    $ module avail ADF

to see which versions of Band which are available. Use

.. code-block:: bash

 $ module load ADF/<version> # i.e adf2017.108

to get access to any given version of Band.
