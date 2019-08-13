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


**NB: Pay special attention to the %mem defined in the beginning of the file.
Also note that there are no mentioning of Linda and shared memory cores. This
is addressed here:** :ref:`gaussian_on_stallo`

You can also download the input file here: :download:`Caffeine-input<../files/caffeine.com>`


Gaussian runscrip example
-------------------------

.. include:: ../files/job_gaussian.sh
   :literal:


**NB: Note that there has been a change in how the local IB adaption wrapper has been set up. Read the comments in the run script example!**

You can also download the runscript here: :download:`Gaussian run script<../files/job_gaussian.sh>`


The runscript example and the input file are also on Stallo
-----------------------------------------------------------

Type:

.. code-block:: bash

	module load Gaussian/g16_B.01
	cd <whereevertestfolderyouhave> # For instance testgau
	cp -R /global/hds/software/notur/apprunex/Gaussian/* .


When you have all the necessary files in the correct folders, submit the job by typing:

.. code-block:: bash

	sbatch job_gaussian.sh

To verify that nothing has gone wrong, check the output of the calculations. In
Gaussian output, you allways get an entertaining quote at the end. Good luck.
