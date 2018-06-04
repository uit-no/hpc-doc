.. _first_time_adf:

==============================
First time you run an ADF job?
==============================

This page contains info aimed at first time
users of ADF on Stallo, but may also be usefull to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.

If you want to run this testjob, download the copies of the scripts and put them
into your test job folder (which I assume you have created in advance).

ADF input example
-----------------

.. include:: ../files/caffeine.adf
   :literal:

This file can also be downloaded here: :download:`Caffeine input for ADF <../files/caffeine.adf>`.

Place this file in a job folder of choice, say ADFFIRSTJOB in your home directory on Stallo.

then, copy the job-script as seen here:

.. include:: ../files/job_adf.sh
   :literal:

(Can also be downloaded from here: :download:`job_adf.sh <../files/job_adf.sh>`)

Place this script in the same folder and type:

.. code-block:: bash

   sbatch job_adf.sh

You may now have submitted your first adf job.


These files are also available on Stallo
----------------------------------------

.. code-block:: bash

   module load ADF/adf2017.108
   cd <to whatever you call your test folder> # for instance ADFFIRSTJOB
   cp -R /global/hds/software/notur/apprunex/ADF/* .

To verify that the jobs has worked fine, check the outputfile. If it says EXIT and print Bond Energies at the end of the file, you are likely on the safe side.

Check the Bond Energy in adf_caffeine.out. The value should ideally be close to -156.75317227 eV. When this is the case, you may alter variables in the shell script as much as you like to adapt to your own jobs.

**NB: ADF is installed as precompiled binaries, they come with their own mpi (intel MPI). So if you are not using the provided runscript example and/or loading the newer modules - please make sure that you load an intelmpi module and also preferably a rather recent intel compiler.**

Also note that, on Stallo, we hold the nbo6 plug in license that allows users of adf to produce files that can be read with the nb06 software.

Good luck with your chemistry!

