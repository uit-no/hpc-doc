===================================
First time you run a Gaussian job?
===================================

This page contains info aimed at first time 
users of Gaussian on Stallo, but may also be usefull to 
more experienced users. Please look carefully through the 
provided examples. Also note that the job-script example is rather richly 
commented to provide additional and relevant info.

If you want to run this testjob, copy the input example and the job script example shown below
into your test job folder (which I assume you have created in advance).

Gaussian input example:
------------------------

.. include:: caffeine.com
   :literal:

**NB: Pay special attention to the %mem defined in the beginning of the file. Also note that there are no mentioning of Linda and shared memory cores. This is adressed here:**

.. toctree::
   :maxdepth: 1

   gaussianonstallo.rst


Gaussian runscrip example:
--------------------------

.. include:: job_g09.sh
   :literal:


**NB: Note that we for Gaussian advice to specify both nodes and core/node. This is due to the special way Gaussian sets up parallel jobs!**

These files are also available on Stallo:
------------------------------------------

To find the jobscript example(s), type the following::

    module load notur
    cd $runex/Gaussian
    ls

Copy the contents of this folder to your home directory.

Then, submit the job by typing::

    sbatch job_g09.sh

Compare the energy of g09_caffeine.out with the correct energy of HF=-680.4153661 for this calculation. 
The energy should ideally be identical or close to identical. After that, you may alter the varia\
bles in the shell script as much as you like to adapt to your own jobs. Good luck.

