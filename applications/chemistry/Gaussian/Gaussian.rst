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

The license of Gaussian contitutes of 4 site licenses for the 4 current host institutions of NOTUR installations; NTNU, UiB, UiO, UiT. In principle, only person from one of these instituions have access to the Gaussian Software system installed on Stallo and Abel. 

* To get access to the code, you need to be in the gaussian group of users.
* To be in the gaussian group of users, you need either to be a member of the abovementioned
  institutions or provide proof of holding a license on your own.

Usage
======

Since Gaussian is a rather large and versatile program system with a range of different binaries, we would in general advice users to check whether their jobs are parallelized or not before submitting jobs. In case both yes and no to that question, we also plead you to consider splitting complex jobs smaller scallable and non-scalable parts/jobs so that the overall utilization of the hardware installation is improved. 

If in doubt; go to the application folder of Gaussian and see if there is a *.exel version of the executable you will be using. If so, your job will generally work ok in parallell up to approx 300 cores. 

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


The first time you run a Gaussian job?
--------------------------------------

Then copy the input example and the job script example shown below
into your test job folder (which I assume you have created in advance).

Gaussian input example:
------------------------

.. include:: caffeine.com
   :literal:


**NB: Pay special attention to the %mem defined in the beginning of the file. Also note
      that there are no mentioning of Linda and shared memory cores. This will be adressed later.**


Gaussian runscrip example:
--------------------------

.. include:: job_g09.sh
   :literal:

**These files are also available on Stallo:**

To get download the jobscript example(s), type the following:

.. code-block::bash

    module load notur
    cd $runex/Gaussian 
    ls 

Copy the contents of this folder to your home directory.

Then, submit the job by typing:

.. code-block::bash

    sbatch job_g09.sh

Compare the energy of g09_caffeine.out with the correct energy of HF=-680.4153661 for this calculation. The energy should ideally be identical or close to identical. After that, you may alter the variables in the shell script as much as you like to adapt to your own jobs. Good luck.

About running Gaussian in paralell:
------------------------------------
* We have taken care of the rsh/ssh setup for you in our installation, so you do not need a .tsnet.config file anymore.

* To run gaussian in parallel requires the additional keywords %LindaWorkers and %NProcshared in the Link 0 part of the input file. This is taken care of by a wrapper. Please do inspect the job_g09.sh script on how to do this correct.


About %mem and memory allocation for Gaussian and slurm:
---------------------------------------------------------
* In general, Gaussian takes care of memory allocation internally - so if the submitted job needs more memory per core than what is available per node, it will automaticall scale down the number of cores to mirror the need. This means that you allways should ask for full nodes when submitting Gaussian 09 jobs!


You adress quite a few questions that are, in fact, not relevant to slurm but to gaussian and how this is installed  - both on Abel and on Stallo.
 
I will rewrite the whole documentation to adress those questions, since we have grown increasingly aware of the fact that how memory allocation actually works with G09 is poorly documented by gaussian and relatedly poorly understood by users.
 
I will just give you the short version of answers
 
1; we do advice people to use up to 16 nodes, at least 12 full nodes, with the current install on Stallo. In contrast to Abel, we have the Linda version installed, and on top of that we have used a trick to utilize the infiniband network – causing G09 to scale proven beyond 16 nodes with 16 cores on each. Gaussian seems to have a thing with 16 cores/node  - this might have to do with our licensed supported hardware – this we are currently working to get verfied. So, in essence: 16 nodes with 16 cores on each – makes 256. Enjoy.
2; with slurm, we want people to change from nodes + cores to tasks. That means that instead of asking for –N 16, -ncores-per-node=16, we want people to ask for –ntasks=256. Currently we only have 20 core nodes with slurm, so I would advise you to ask for 240.
3; Memory allocation in G09 means two things: (%mem)
-          In general it means memory/node – for share between nprocshared, and aditional to the memory allocated pr. process. This is also documented by Gaussian.
-          For the mother superior (mother process/node) it also represents the network buffer allocated by Linda. So basically G09 takes a part and linda takes a part the same size – thus you should never ask for more than half of the physical memory on the nodes, unless they have swap space available. For the new (20cores) nodes on Stallo, there is no local disk, aka no swap space. Thus the general limit for %mem is 16000MB (note MB and not GB, since slurm has a different interpretation of GB and MB, it seems, than Torque).
 
Well, if this is the short answer – imagine the long one...
 
Gaussian input example:
--------------------

.. include:: g09.inputex
   :literal:

Gaussian runscrip example:
------------------------

.. include:: g09.jobscriptex
   :literal:

