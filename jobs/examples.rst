.. _job_script_examples:

===================
Job script examples
===================


Basic examples
==============


General blueprint for a jobscript
---------------------------------

You can save the following example to a file (e.g. run.sh) on Stallo. Comment
the two ``cp`` commands that are just for illustratory purpose (lines 46 and 55)
and change the SBATCH directives where applicable. You can then run the script
by typing::

   $ sbatch run.sh

Please note that all values that you define with SBATCH directives are hard
values. When you, for example, ask for 6000 MB of memory (``--mem=6000MB``) and
your job uses more than that, the job will be automatically killed by the manager.


.. literalinclude:: files/slurm-blueprint.sh
   :language: bash


.. _job_arrays:

Running many sequential jobs in parallel using job arrays
---------------------------------------------------------

In this example we wish to run many similar sequential jobs in parallel using job arrays.
We take Python as an example but this does not matter for the job arrays:

.. literalinclude:: files/test.py
   :language: python

Save this to a file called "test.py" and try it out::

  $ python test.py

  start at 15:23:48
  sleep for 10 seconds ...
  stop at 15:23:58

Good. Now we would like to run this script 16 times at the same time.
For this we use the following script:

.. literalinclude:: files/slurm-job-array.sh
   :language: bash

Submit the script and after a short while you should see 16 output files
in your submit directory::

  $ ls -l output*.txt

  -rw------- 1 user user 60 Oct 14 14:44 output_1.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_10.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_11.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_12.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_13.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_14.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_15.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_16.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_2.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_3.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_4.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_5.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_6.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_7.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_8.txt
  -rw------- 1 user user 60 Oct 14 14:44 output_9.txt


Packaging smaller parallel jobs into one large parallel job
-----------------------------------------------------------

There are several ways to package smaller parallel jobs into one large parallel
job. The preferred way is to use Job Arrays. Browse the web for many examples
on how to do it. Here we want to present a more pedestrian alternative which
can give a lot of flexibility.

In this example we imagine that we wish to run 5 MPI jobs at the same time,
each using 4 tasks, thus totalling to 20 tasks.  Once they finish, we wish to
do a post-processing step and then resubmit another set of 5 jobs with 4 tasks
each:

.. literalinclude:: files/slurm-smaller-jobs.sh
   :language: bash


The ``wait`` commands are important here - the run script will only continue
once all commands started with ``&`` have completed.

.. _allocated_entire_memory:

Example on how to allocate entire memory on one node
----------------------------------------------------

.. literalinclude:: files/slurm-big-memory.sh
   :language: bash


How to recover files before a job times out
-------------------------------------------

Possibly you would like to clean up the work directory or recover
files for restart in case a job times out. In this example we ask Slurm
to send a signal to our script 120 seconds before it times out to give
us a chance to perform clean-up actions.

.. literalinclude:: files/slurm-timeout-cleanup.sh
   :language: bash



OpenMP and MPI
==============

You can download the examples given here to a file (e.g. run.sh) and start it with:

.. code-block:: bash

   $ sbatch run.sh


Example for an OpenMP job
-------------------------

.. literalinclude:: files/slurm-OMP.sh
   :language: bash


Example for a MPI job
---------------------

.. literalinclude:: files/slurm-MPI.sh
   :language: bash


Example for a hybrid MPI/OpenMP job
-----------------------------------

.. literalinclude:: files/slurm-MPI-OMP.sh
   :language: bash


If you want to start more than one MPI rank per node you can
use ``--ntasks-per-node`` in combination with ``--nodes``:

.. code-block:: bash

   #SBATCH --nodes=4 --ntasks-per-node=2 --cpus-per-task=8

This will start 2 MPI tasks each on 4 nodes, where each task can use up to 8 threads.
