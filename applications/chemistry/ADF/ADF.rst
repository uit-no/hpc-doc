.. _ADF:

===========================================
Amsterdam Density Functional program system
===========================================

Information regarding the quantum chemistry and material science package ADF/BAND on Stallo

Related information:
====================

.. toctree::
 :maxdepth: 1

 Band.rst
 firstime_adf.rst

General Information:
====================

Description:
-------------

ADF (Amsterdam Density Functional) is a Fortran program for calculations on atoms and molecules (in gas phase or solution). It can be used for the study of such diverse fields as molecular spectroscopy, organic and inorganic chemistry, crystallography and pharmacochemistry. A separate program BAND is available for the study of periodic systems: crystals, surfaces, and polymers. The COSMO-RS program is used for calculating thermodynamic properties of (mixed) fluids.

The underlying theory is the Kohn-Sham approach to Density-Functional Theory (DFT).  The software is a DFT-only first-principles electronic structure calculations program system, and consists of a rich variety of packages.


Online info from vendor:
------------------------

* Homepage: http://www.scm.com
* Documentation: https://www.scm.com/doc/ADF/

The support people in NOTUR, do not provide trouble shooting guides anymore, due to a national agreement that it is better for the community as \
a whole to add to the community info/knowledge pool  where such is made available. For ADF/BAND we advise to search in general documentation, se\
nding emails to support(either notur or scm) or trying the ADF mailing list (see http://www.scm.com/Support for more info).


License and access policy:
---------------------------

The license of ADF/Band is commercial.

NOTUR holds a national license of the ADF program system, making usage of ADF/BAND available for all academic scient\
ists in Norway.

We have a national license for the following packages:

- ADF & ADFGUI
- BAND &BANDGUI
- CRS
- DFTB & DFTBGUI
- GUI
- REAXFF & REAXFFGUI
- NBO6 (on Stallo only, but machine license available for all users of Stallo).


`Please note that this is an academic type license; meaning that research institutes not being part of Norwegian Universities must provide their own l\
icense to be able to use and publish results obtained with this code on NOTUR installlations.`


Citation
--------
When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citat\
ion(s).


Usage
======

The ADF/BAND suite of software is currently installed as precompiled binaries on Stallo. We install the intel-mpi version, since it has proven to collaborate the better with our mpi setup. We generally advise to run ADF on more than one node, unless you do know that your particular problem does not make the code scale well.


Use

.. code-block:: bash

    $ module avail ADF

to see which versions of Gaussian are available. Use

.. code-block:: bash

 $ module load ADF/<version> # i.e 2016.106

to get access to any given version of ADF.  


The first time you run an ADF job?
----------------------------------

Get the information you need here:


.. toctree::
 :maxdepth: 1

 firstime_adf.rst


Here we hold information for how to run on Stallo for the first time, and for using SLURM for the first time. 






