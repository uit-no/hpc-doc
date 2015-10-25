===========================================
Amsterdam Density Functional program system
===========================================

A description of the quantum chemistry and material science package ADF/BAND

General Information:
====================

The ADF software is a DFT-only program package used for electronic structure calculations, and consists of a rich variety of packages. See http://www.scm.com for more information.

The support people in NOTUR, do not provide trouble shooting guides anymore, due to a national agreement that it is better for the community as a whole to add to the community info/knowledge pool  where such is made available. For ADF/BAND we advise to search in general documentation, sending emails to support(either notur or scm) or trying the ADF mailing list (see http://www.scm.com/Support for more info).

Citation
--------
When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citation(s).

License information:
--------------------
NOTUR holds a national license of the ADF program system, making usage of ADF/BAND available for all academic scientists in Norway. 


We have a national license for the following packages:

ADF, ADFGUI, BAND, BANDGUI, CRS, DFTB, DFTBGUI, GUI, REAXFF, REAXFFGUI, NBO6 (on Stallo only, but machine license available for all users of Stallo).

Please note that this is an academic license; meaning that research institutes not being part of Norwegian Universities must provide their own license to be able to use and publish results obtained with this code on NOTUR installlations.

Information about versions:
---------------------------

You load the application by typing:

.. code-block:: bash

    $ module load adf

This command will give you the default version.

For more information on available versions, type:

.. code-block:: bash

    $ module avail adf

If you want to run other versions of ADF, change the <module load> parameter in the script file to the version you want to run, for instance:

.. code-block:: bash

 $ module load adf/2014.08

First run of ADF/BAND on Stallo:
================================

To get download the jobscript example(s), type the following:

.. code-block::bash

    module load notur
    cd $APPEX/adf 

Copy the contents of this folder to your home directory.

Then, submit the job by typing:

`qsub job_adf_stallo.sh`

Compare the energy of adf_example.out with the Bond Energy =  -156.77666698 eV in adf_example_correct_stallo.output. The energy should ideally be identical or close to identical. When this is the case, you may alter variables in the shell script as much as you like to adapt to your own jobs. Good luck.

> NB: ADF is on Stallo set up with intel mpi, if not using this script - remember to do module swap openmpi impi before loading the adf module.

> On Stallo, we holds the nbo6 plug in license that allows users of adf to produce files that can be read with the nb06 software.


