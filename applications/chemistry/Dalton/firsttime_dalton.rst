.. _first_time_dalton:

================================
First time you run a Dalton job?
================================

This page contains info aimed at first time
users of Dalton on Stallo. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.

If you want to run this testjob, copy the input example and the job script example shown below
into your test job folder (which I assume you have created in advance).

Dalton needs one molecule file and one input file. For simplicity, we have tarred them together and you
may download them here: :download:`Dalton files<../files/dalton_example_files.tar.gz>`

Molcas runscrip example
-----------------------

.. include:: ../files/job_dalton.sh
   :literal:


You can also download the runscript file here: :download:`Dalton run script<../files/job_dalton.sh>`


The runscript example and the input are also on Stallo
------------------------------------------------------

Type:

.. code-block:: bash

	cd <whatever_test_folder_you_have> # For instance testdalton
	cp -R /global/hds/software/notur/apprunex/dalton/* .

When you have all the necessary files in the correct folders, submit the job by typing:

.. code-block:: bash

	sbatch job_dalton.sh

Good luck.
