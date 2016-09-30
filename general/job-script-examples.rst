.. _job_script_examples:


Example for a multi-node MPI job
================================

.. literalinclude:: files/slurm-MPI-multinode.sh
   :language: bash
   :linenos:

Save it to a file (e.g. run.sh) and submit it with::

  $ sbatch run.sh
