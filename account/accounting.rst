.. _accounting:

=============================
CPU-hour quota and accounting
=============================

CPU quota
=========

To use the batch system you have to have a cpu quota, either local or
national. For every job you submit we check that you have sufficient
quota to run it and you will get a warning if you do not have sufficient
cpu-hours to run the job. The job will be submitted to queue, but will
not start until you have enough cpu-hours to run it.


Resource charging
=================

We charge for used resources, both cpu and memory.
The accounting system charges for used processor equivalents (PE)
times used walltime, so if you ask for more than (total memory pr. node)/(total cores pr. node)
- in the example below 32GB/20cores = 1.6 GB.

The concept of PE defines a processor equivalent as the resource unit 1 core and 1 unit of memory.
For a node with 2 GB og memory pr core, i.e. 32 GB of memory and 16 cores - 1 PE equals to 1 core and
2GB of memory. Currently there is no common definition on the memory unit, other than the one specified
above.

The best way to explain the concept of PE is by example:
Assume that you have a node with 20 cpu-cores and 32 GB memory::

    if you ask for less than 1.6GB memory per core then PE will equal the cpu count.

    if you ask for 3.2GB memory per core then PE will be twice the cpu-count.

    if you ask for 32 GB memory then PE=20 as you only can run one cpu per compute node.

The available memory and core settings for Stallo are explained here: :ref:`about_stallo`


Inspecting your quota
=====================

You can use the cost command to check how much cpu-hours are left on
your allocation:

::

    [user@stallo-1 ~]$ cost
    Id  Name    Amount    Reserved Balance  CreditLimit Deposited Available Percentage
    --- ------- --------- -------- -------- ----------- --------- --------- ----------
    272 nnXXXXk 168836.65 96272.00 72564.65        0.00 290000.00  72564.65 58.22
    10  nnYYYYk   4246.04     0.00  4246.04        0.00 150000.00   4246.04 2.83

The column meaning is

Amount:
    The number of hours available for new jobs.
Reserved:
    The number of hours reserved for currently running jobs.
Balance:
    Amount - Reserved.
CreditLimit:
    Allocated low-pri quota.
Deposited:
    Allocated normal quota


Inspecting historic use
-----------------------

You can view the accounting history of your projects using::

    gstatement --hours --summarize -s YYYY-MM-DD -e YYYY-MM-DD -p nnXXXXk

for more detail see::

    gstatement --man
