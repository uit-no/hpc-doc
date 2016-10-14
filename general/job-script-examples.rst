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

.. literalinclude:: files/slurm-job-array.sh
   :language: bash
   :linenos:
