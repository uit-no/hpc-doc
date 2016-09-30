.. _job_script_examples:

Job script examples
===================

Example for a single-node OpenMP job
------------------------------------

.. literalinclude:: files/slurm-OMP-singlenode.sh
   :language: bash
   :linenos:

Save it to a file (e.g. run.sh) and submit it with::

  $ sbatch run.sh


Example for a single-node MPI job
---------------------------------

.. literalinclude:: files/slurm-MPI-singlenode.sh
   :language: bash
   :linenos:


Example for a multi-node MPI job
--------------------------------

.. literalinclude:: files/slurm-MPI-multinode.sh
   :language: bash
   :linenos:
