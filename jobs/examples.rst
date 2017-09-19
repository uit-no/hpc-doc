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

Save it to a file (e.g. run.sh) and submit it with::

  $ sbatch run.sh


Example for a MPI job
---------------------

.. literalinclude:: files/slurm-MPI.sh
   :language: bash

Save it to a file (e.g. run.sh) and submit it with::

  $ sbatch run.sh


Example for a hybrid MPI OpenMP job
----------------------------------

.. literalinclude:: files/slurm-MPI-OMP.sh
   :language: bash

Save it to a file (e.g. run.sh) and submit it with::

  $ sbatch run.sh

If you want to start more than one MPI rank per node you can
use ``--ntasks-per-node`` in combination with ``--nodes``::

#SBATCH --nodes=4 --ntasks-per-node=2 --cpus-per-task=8

will start 2 MPI tasks each on 4 nodes, where each task can use up
to 8 threads.


Running many sequential jobs in parallel using job arrays
---------------------------------------------------------

In this example we wish to run many similar
sequential jobs in parallel using job arrays.
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

.. code-block:: bash

  #!/bin/bash

  #SBATCH --job-name=example
  #SBATCH --ntasks=20
  #SBATCH --time=0-00:05:00
  #SBATCH --partition short
  #SBATCH --mem-per-cpu=500MB

  cd ${SLURM_SUBMIT_DIR}

  # first set of parallel runs
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &

  wait

  # here a post-processing step
  # ...

  # another set of parallel runs
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &
  mpirun -n 4 ./my-binary &

  wait

  exit 0

The ``wait`` commands are important here - the run script will only continue
once all commands started with ``&`` have completed.


Example on how to allocate entire memory on one node
----------------------------------------------------

.. literalinclude:: files/slurm-big-memory.sh
   :language: bash
