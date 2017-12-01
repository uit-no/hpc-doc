
.. figure:: slurm.jpg

   Credit: Futurama (http://futurama.wikia.com/wiki/Slurms_MacKenzie)


.. _slurm:


We have fully migrated to the SLURM resource manager
=====================================================

The current and only working resource manager system on Stallo is now `SLURM <http://slurm.schedmd.com/>`_ (Simple Linux Utility for Resource
Management).

To access highmem nodes; you still need to be member of the highmem group of users. 

Also, you would need to submit to the highmem partition::

$ #SBATCH --partition=highmem

By this migration we hope that you will find the user experience across
Norwegian HPC systems will be more uniform.
