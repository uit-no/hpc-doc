.. _first_time_molcas:

================================
First time you run a Molcas job?
================================

This page contains info aimed at first time
users of Molcas on Stallo. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.

If you want to run this testjob, copy the input example and the job script example shown below
into your test job folder (which I assume you have created in advance).


Molcas comes with one input file and one geometry file. For simplicity, we have tarred them together and you
may download them here: :download:`Ethane-input<../files/C2H6.tar.gz>`

Molcas runscrip example
-----------------------

.. include:: ../files/job_molcas.sh
   :literal:


**NB: Note that some of Molcas´s various modules are not mpi scalable. Consult the vendor-provided manual for scaling issues. Our example is based on a single-node all cores job.**

You can also download the runscript file here: :download:`Molcas run script<../files/job_molcas.sh>`



The runscript example and the input are also on Stallo
------------------------------------------------------

Type:

.. code-block:: bash

	module load Molcas/molcas82-intel-2015a
	cd <whereevertestfolderyouhave> # For instance testmolcas
	cp -R /global/hds/software/notur/apprunex/Molcas/* .


When you have all the necessary files in the correct folders, submit the job by typing:

.. code-block:: bash

	sbatch job_molcas.sh

To verify that nothing has gone wrong, check the status file. If it concludes "happy landing" you are on the safe side, most probably. Good luck.

