===========================================
Amsterdam Density Functional program system
===========================================

A description of the quantum chemistry and material science package ADF/BAND

General Information:
====================

The ADF software is a DFT-only first-principles electronic structure calculations program system, and consists of a rich variety of packages.

Online info from vendor:
------------------------

Homepage: http://www.scm.com
Documentation: http://www.scm.com/Doc

The support people in NOTUR, do not provide trouble shooting guides anymore, due to a national agreement that it is better for the community as \
a whole to add to the community info/knowledge pool  where such is made available. For ADF/BAND we advise to search in general documentation, se\
nding emails to support(either notur or scm) or trying the ADF mailing list (see http://www.scm.com/Support for more info).

Citation
--------
When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citat\
ion(s).

License information:
--------------------
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



is software for first-principles electronic structure calculations. The parallel version has been tested for scaling and most problems scale well up to 16 cpus, larger problems scale beyond 64 cpus. Over 100 cpus is normally not recommended due to limited scaling.

(link to general info about license policy notur?)


Usage
======

(Link to general info about scaling of software on notur systems; get feedback from users?)

We generally advise to run ADF on more than one node. The parallel version has been tested for scaling and most problems scale well up to  4 nodes. 

Use

.. code-block:: bash

    $ module avail adf 
 

to see which versions of ADF are available. Use

.. code-block:: bash

    $ module load adf

or 

.. code-block:: bash

 $ module load adf/<version> # i.e 2014.08

to get access to ADF.  Note that ADF contains its own MPI implementation, so there is no need to load any openmpi module to use ADF.


First run of ADF/BAND on Stallo:
--------------------------------

To get download the jobscript example(s), type the following:

.. code-block::bash

    module load notur
    cd $APPEX/adf 

Copy the contents of this folder to your home directory.

Then, submit the job by typing:

.. code-block::bash

    qsub job_adf_stallo.sh

Compare the energy of adf_example.out with the Bond Energy =  -156.77666698 eV in adf_example_correct_stallo.output. The energy should ideally be identical or close to identical. When this is the case, you may alter variables in the shell script as much as you like to adapt to your own jobs. Good luck.

- NB: ADF is on Stallo set up with intel mpi, if not using this script - remember to do module swap openmpi impi before loading the adf module.

- On Stallo, we holds the nbo6 plug in license that allows users of adf to produce files that can be read with the nb06 software.


