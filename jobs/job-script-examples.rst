.. _job_script_examples:

Job script examples
===================


Help! I don't know what OpenMP or MPI means!
--------------------------------------------

OpenMP and MPI are parallelization frameworks. If you want to run many similar
jobs that each use one core at a time, scroll down to job arrays.


Example for an OpenMP job
-------------------------

.. literalinclude:: files/slurm-OMP.sh
   :language: bash
   :linenos:

Save it to a file (e.g. run.sh) and submit it with::

  $ sbatch run.sh


Example for a MPI job
---------------------

.. literalinclude:: files/slurm-MPI.sh
   :language: bash
   :linenos:

Save it to a file (e.g. run.sh) and submit it with::

  $ sbatch run.sh


Running many sequential jobs in parallel using job arrays
---------------------------------------------------------

In this example we wish to run many similar
sequential jobs in parallel using job arrays.
We take Python as an example but this does not matter for the job arrays:

.. literalinclude:: files/test.py
   :language: python
   :linenos:

Save this to a file called "test.py" and try it out::

  $ python test.py

  start at 15:23:48
  sleep for 10 seconds ...
  stop at 15:23:58

Good. Now we would like to run this script 16 times at the same time.
For this we use the following script:

.. literalinclude:: files/slurm-job-array.sh
   :language: bash
   :linenos:

Sumbit the script and after a short while you should see 16 output files
in your submit directory::

  $ ls -l output*txt

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

Observe that they all started (approximately) at the same time::

  $ grep start *txt

  output_1.txt:start at 14:43:58
  output_10.txt:start at 14:44:00
  output_11.txt:start at 14:43:59
  output_12.txt:start at 14:43:59
  output_13.txt:start at 14:44:00
  output_14.txt:start at 14:43:59
  output_15.txt:start at 14:43:59
  output_16.txt:start at 14:43:59
  output_2.txt:start at 14:44:00
  output_3.txt:start at 14:43:59
  output_4.txt:start at 14:43:59
  output_5.txt:start at 14:43:58
  output_6.txt:start at 14:43:59
  output_7.txt:start at 14:43:58
  output_8.txt:start at 14:44:00
  output_9.txt:start at 14:43:59


Example on how to allocate entire memory on one node
----------------------------------------------------

.. literalinclude:: files/slurm-big-memory.sh
   :language: bash
   :linenos:
