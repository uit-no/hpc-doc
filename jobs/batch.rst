

Batch system
============

The Stallo system is a resource that is shared between many of users and to
ensure fair use everyone must do their computations by submitting jobs through
a batch system that will execute the applications on the available resources.

The batch system on Stallo is `SLURM <http://slurm.schedmd.com/>`_ (Simple
Linux Utility for Resource Management.)

If you are already used to Torque/Maui (the previous queue system used on
Stallo), but not SLURM, you might find this :ref:`torque_slurm_table` useful.


Creating a job script
---------------------

To run a job on the system you need to create a job script. A job script is a
regular shell script (bash) with some directives specifying the number of CPUs,
memory, etc., that will be interpreted by the batch system upon submission.

You can find job script examples in :ref:`job_script_examples`.


How to pass command-line parameters to the job script
-----------------------------------------------------

It is sometimes convenient if you do not have to edit the job script every time you want
to change the input file. Or perhaps you want to submit hundreds of jobs and
loop over a range of input files. For this it is handy to pass command-line
parameters to the job script.

In SLURM you can do this::

  $ sbatch myscript.sh myinput myoutput

And then you can pick the parameters up inside the job script::

  #!/bin/bash

  #SBATCH ...
  #SBATCH ...
  ...

  # argument 1 is the input file
  # argument 2 is the output file
  mybinary.x < ${1} > ${2}
