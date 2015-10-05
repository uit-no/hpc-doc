
Getting started
===============
.. index:: getting started, quickstart guide


The really quick and dirty startup guide for the pathologically impatient
-------------------------------------------------------------------------

First of all you need to have a :doc:`CPU-quota and a login account <./account>`, and then you can :doc:`log onto the system <./login>`.

Once you have passed the initial hurdles you can start computing, but before you start we would like you to read through the following basic points about our computing service.

#. You need to run batch jobs to get computing going.
#. You need to have some sense parallelism to get performance. (Stallo will not do this automatically for you)
#. Do NOT run long computations on the login nodes. With long we mean more than 15 minutes of runtime. We kill long running processes automatically.
#. Your home catalog is for things you write and cannot recompute (we take REALLY good care of that stuff), the project area is for things you want to share with others on stallo (we take good care of that too), the work area is for big data results coming from your computations (we do not take backup of these data).
#. Stallo do not have a GUI, or, at least not a good one.


Keep this guidelines in the back of your head and try to start running jobs on the system.  :doc:`Here <./firstjob>` is a quick run-through on how to get your first job running on the system.


Further reading
---------------

We have a wealth of documentation for you, here are some places with more information on how to use our system.

- :doc:`Batch system <./jobs>`.
- :ref:`application-development`
- :doc:`Use preinstalled applications <../applications/index>`.


**Happy hacking!**

The HPC-Team <support-uit@notur.no>

