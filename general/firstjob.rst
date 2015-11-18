.. _first_job:

Example: First jobscript.
=========================
.. index:: first jobscript

.. FIXME: inline job script example

A job script is just a regular shell-script with some comments that are directives telling the batch system which resources this script needs when running.  

::

   #!/bin/bash
   #PBS -lnodes=2:ppn=16
   #PBS -lwalltime=2:00:00
   #PBS -lpmem=1gb
   
   workdir=/global/work/$USER/$PBS_JOBID
   mkdir -p $workdir
   cd $workdir
   
   cp /global/apps/examples/firstjob/mpitest.x mpitest.x
   mpirun ./mpitest.x

You can find this example on Stallo at ``/global/apps/examples/firstjob/firstjob.sh``.  You can copy to your own home catalog and run it as a batch job

::

   $ mkdir myfirstjob
   $ cd myfirstjob
   $ cp /global/apps/examples/firstjob/firstjob.sh firstjob.sh
   $ qsub firstjob.sh
   1234566.stallo-adm.uit.no
   $ showq -u $USER

Here you see that your job is submitted with the queue with the job identity ``1234566.stallo-adm.uit.no`` (the number in front will be different).  You can query the status of your jobs with the commands ``showq`` or ``qstat``. Once the job has completed you can view the result.

::

   $ ls 

   $ cat firstjob.sh.o1234566


Further reading.
----------------

* :ref:`jobs`.


