.. _turbomole_example:

==========================
TURBOMOL runscript example
==========================

.. include:: ../files/job_turbo.sh
   :literal:


TURBOMOL example on Stallo
--------------------------

The above runscript can be found on Stallo along with the necessary input files
to perform a simple DFT calculation. To get access to the examples directory,
load the ``notur`` module

.. code-block:: bash

    $ module load notur
    $ cp -r /global/hds/software/notur/apprunex/TURBOMOLE .

From this directory you can submit the example script (you need to specify a
valid account in the script first)

.. code-block:: bash

    $ sbatch job_turbo.sh


The calculation should take less than 2 min, but may spend much more than this
in the queue. Verify that the output file ``dscf.out`` ends with

.. code-block:: bash

    **** dscf : all done ****

Please refer to the TURBOMOLE manual for how to setup different types of
calculations.
