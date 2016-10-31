

Process count
=============

We strongly advice all users to ask for a given set of cores when submitting
multi-core jobs.  To make sure that you utilize full nodes, you should ask for
sets that adds up to both 16 and 20 (80, 160 etc) due to the hardware specifics
of Stallo i.e. submit the job with ``--ntasks=80`` **if** your application
scales to this number of tasks.

This will make the best use of the resources and give the most predictable
execution times. If your job requires more than the default available memory per
core (32 GB/node gives 2 GB/core for 16 core nodes and 1.6GB/core for 20 core
nodes) you should adjust this need with the following command: ``#SBATCH
--mem-per-cpu=4GB`` When doing this, the batch system will automatically allocate
8 cores or less per node.

For single node jobs, just ask for less than 16 cores with less than 1.6GB of
memory/core.


Scalability
-----------

You should run a few tests to see what is the best fit between minimizing
runtime and maximizing your allocated cpu-quota. That is you should not ask for
more cpus for a job than you really can utilize efficiently. Try to run your
job on 1, 2, 4, 8, 16, etc., cores to see when the runtime for your job starts
tailing off. When you start to see less than 30% improvement in runtime when
doubling the cpu-counts you should probably not go any further. Recommendations
to a few of the most used applications can be found in :ref:`sw_guides`.
