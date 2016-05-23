Information for advanced users:
================================

Scaling behaviour:
-------------------

Since ADF is a very complex code, able to solve a vast range of chemistry problems - giving a unified advice regarding scaling is difficult. We will try to inspect scaling behaviour related to most used areas of application. For a standard geometry optimization, it seems to scale well in the region of 4-6 full nodes (60-100 cores) at least. For linear transit we would currently stay at no more than 4 full nodes or less currently.Unless having tests indicating otherwise, users who want to run large jobs should allocate no more than the prescribed numbers of processors. More information will come.

Memory allocation:
-------------------

On Stallo there are 32 GB and 128GB nodes. Pay close attention to memory usage of job on the nodes where you run, and if necessary redistribute the job so that it uses less than all cores on the node until the limit of 32 GB/core. More than that, you will need to ask for access to the highmem-queue. As long as you do not ask for more than 2 GB/core, using the pmem-flag for torque does in principle give no meaning.