.. _first_time_comsol:

=================================
First time you run an COMSOL job?
=================================

This page contains info aimed at first time
users of COMSOL on Stallo, but may also be usefull to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.

If you want to run this testjob, download the copies of the scripts and put them
into your test job folder (which I assume you have created in advance).

COMSOL input example
--------------------

The file used in this example can also downloaded here: :download:`Small test for COMSOL <../files/comsol_smalltest.mph>`.

Place this file in a job folder of choice, say COMSOLFIRSTJOB in your home directory on Stallo.

then, copy the job-script as seen here:

.. include:: ../files/run_comsol.sh
   :literal:

(Can also be downloaded from here: :download:`run_comsol.sh <../files/run_comsol.sh>`)

Before you can submit a job, you need to know what "type" of study you want to perform (please read more about that on the vendor support page). For example purpose, I have chosed study 4 - named std04; and this is the second variable argument to the run script (see comments in script).

Place this script in the same folder and type:

.. code-block:: bash

   sbatch run_comsol.sh comsol_smalltest std04

You may now have submitted your first COMSOL job.

Good luck with your (MULTI)physics!

