===========================================
The GAUSSIAN program system
===========================================

A description of the quantum chemistry program system Gaussian

.. toctree::
 :maxdepth: 1
 
 GaussView.rst


General Information:
====================

Gaussian is a computational chemistry software program system initially released in 1970. Gaussian has a rather low user threshold and a tidy user setup, which, together with a broad range of possibilities and a graphical user interface (gaussview), might explain its popularity in academic institutions.

Online info from vendor:
------------------------

Homepage: http://www.gaussian.com
Documentation: http://www.gaussian.com/g_tech/g_ur/g09help.htm

The support people in NOTUR, do not provide trouble shooting guides anymore, due to a national agreement that it is better for the community as \
a whole to add to the community info/knowledge pool  where such is made available. This is a pronounced challenge for the GAUSSIAN program system. 

Citation
--------
When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citat\
ion(s).

License information:
--------------------

The license of GAUSSIAN is commercial/proprietary.

The license of Gaussian contitutes of 4 site licenses for the 4 current host institutions of NOTUR installations; NTNU, UiB, UiO, UiT. In principle, only person from one of these instituions have access to the Gaussian Software system installed on Stallo and Abel. To get access to the code, you need to be in the gaussian group of users.

Usage
======

Since Gaussian is a rather large and versatile program system with a range of different binaries, we would in general advice users to check whether their jobs are parallelized or not before submitting jobs. In case both yes and no to that question, we also plead you to consider splitting complex jobs smaller scallable and non-scalable parts/jobs so that the overall utilization of the hardware installation is improved. 

If in doubt; go to $apphome/gaussian/009.d01 and see if there is a *.exel version of the executable you will be using. If so, your job will generally work ok in parallell up to approx 300 cores. 

We generally wants users to run as many nodes as possible to limit the walltime length of running jobs. 

Use

.. code-block:: bash

    $ module avail gaussian

to see which versions of Gaussian are available. Use

.. code-block:: bash

    $ module load gaussian

or 

.. code-block:: bash

 $ module load gaussian/<version> # i.e 09.c01 (default)

to get access to Gaussian.  


First run of Gaussian:
--------------------------------

To get download the jobscript example(s), type the following:

.. code-block::bash

    module load notur
    cd $APPEX/gaussian 

Copy the contents of this folder to your home directory.

Then, submit the job by typing:

.. code-block::bash

    sbatch job_g09.sh

Compare the energy of g09_caffeine.out with the correct energy of HF=-680.4153661 for this calculation. The energy should ideally be identical or close to identical. After that, you may alter the variables in the shell script as much as you like to adapt to your own jobs. Good luck.

Additional comments:
----------------------
* We have taken care of the rsh/ssh setup for you in our installation, so you do not need a .tsnet.config file anymore.

* To run gaussian in parallel requires the additional keywords %LindaWorkers and %NProcshared in the Link 0 part of the input file. This is taken care of by a wrapper. Please do inspect the job_g09.sh script on how to do this correct.

* In general, Gaussian takes care of memory allocation internally - so if the submitted job needs more memory per core than what is available per node, it will automaticall scale down the number of cores to mirror the need. This means that you allways should ask for full nodes when submitting Gaussian 09 jobs!

Gaussian input example:
--------------------

.. include:: g09.inputex
   :literal:

Gaussian runscrip example:
------------------------

.. include:: g09.jobscriptex
   :literal:

