.. _job_script_examples:

Job script examples
===================


Help! I don't know what OpenMP or MPI means!
--------------------------------------------

OpenMP and MPI are parallelization frameworks. If your calculation
is sequential (running on one core only) or you plan to run many sequential
calculations in one job script, then take the "single-node OpenMP job" script
and remove the line that contains "export OMP_NUM_THREADS=$SLURM_TASKS_PER_NODE".


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
