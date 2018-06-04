.. _first_time_vasp:

==============================
First time you run a VASP job?
==============================

This page contains info aimed at first time
users of VASP on Stallo, but may also be usefull to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.



If you want to run this testjob, download the copies of the scripts and put them
into your test job folder (which I assume you have created in advance).

VASP input example
------------------

Download the tarred job :download:`CeO2job-files <../files/CeO2.tar.gz>`.

move this file to your test job folder on Stallo and type

.. code-block:: bash

   tar -zxf CeO2.tar.gz

Then; download the job-script as seen here:

.. include:: ../files/job_vasp.sh
   :literal:

Download it here :download:`job_vasp.sh <../files/job_vasp.sh>`.


These files are also available on Stallo
----------------------------------------

.. code-block:: bash

   module load VASP/5.4.1.plain-intel-2016a
   cd <to whatever you call your test folder> # for instance testvasp
   cp -R /global/hds/software/notur/apprunex/VASP/* .
   sbatch job_vasp.sh

and you are up running. Happy hunting.
