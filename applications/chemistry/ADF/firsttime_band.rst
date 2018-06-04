.. _first_time_band:

==============================
First time you run a Band job?
==============================

This page contains info aimed at first time
users of Band on Stallo, but may also be usefull to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.

If you want to run this testjob, download the copies of the scripts and put them
into your test job folder (which I assume you have created in advance).

Band input example
------------------

.. include:: ../files/silicone.adf
   :literal:

This file can also be downloaded here: :download:`Silicone input for Band <../files/silicone.adf>`.

Place this file in a job folder of choice, say BANDFIRSTJOB in your home directory on Stallo.

then, copy the job-script as seen here:

.. include:: ../files/job_band.sh
   :literal:

(Can also be downloaded from here: :download:`job_band.sh <../files/job_band.sh>`)

Place this script in the same folder and type:

.. code-block:: bash

   sbatch job_band.sh

You may now have submitted your first adf job.


These files are also available on Stallo
----------------------------------------

.. code-block:: bash

   module load ADF/adf2017.108
   cd <to whatever you call your test folder> # for instance BANDFIRSTJOB
   cp -R /global/hds/software/notur/apprunex/ADF/* .

To verify that the jobs has worked fine, check the outputfile. If it says EXIT and print Energy of Formation at the end of the file, you are likely on the safe side.

#Check the ENERGY OF FORMATION in band_silicone.out. The value should ideally be close to -4.2467 eV. When this is the case, you may alter variables in the shell script as much as you like to adapt to your own jobs.

**NB: The ADF modeling suite is installed as precompiled binaries, they come with their own mpi (intel MPI). So if you are not using the provided runscript example and/or loading the newer modules - please make sure that you load an intelmpi module and also preferably a rather recent intel compiler.**

Good luck with your chemistry!

