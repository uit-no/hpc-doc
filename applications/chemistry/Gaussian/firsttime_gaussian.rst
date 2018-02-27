.. _first_time_gaussian:

==================================
First time you run a Gaussian job?
==================================

This page contains info aimed at first time
users of Gaussian on Stallo, but may also be usefull to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.

If you want to run this testjob, copy the input example and the job script example shown below
into your test job folder (which I assume you have created in advance).

Gaussian input example
----------------------

.. include:: ../files/caffeine.com
   :literal:


**NB: Pay special attention to the %mem defined in the beginning of the file. Also note that there are no mentioning of Linda and shared memory cores. This is addressed here:** :ref:`gaussian_on_stallo`

You can also download the input file here: :download:`Caffeine-input<../files/caffeine.com>`


Gaussian runscrip example
-------------------------

.. include:: ../files/job_g09.sh
   :literal:


**NB: Note that we for Gaussian advice to specify both nodes and core/node. This is due to the special way Gaussian sets up parallel jobs!**

You can also download the runscript here: :download:`Gaussian run script<../files/job_g09.sh>`



The runscript example and the input file are also on Stallo
-----------------------------------------------------------

Type:

.. code-block:: bash

	module load Gaussian/9.d01
	cd <whereevertestfolderyouhave> # For instance testgau
	cp -R $RUNEX/* .


When you have all the necessary files in the correct folders, submit the job by typing:

.. code-block:: bash

	sbatch job_g09.sh

To verify that nothing has gone wrong, compare the energy of g09_caffeine.out with the correct energy of HF=-680.4153661 for this calculation.
The energy should ideally be identical or close to identical. After that, you may alter the varia\
bles in the shell script as much as you like to adapt to your own jobs. Good luck.

