
Getting started
===============
.. index:: getting started, quickstart guide


The really quick and dirty startup guide for the pathologically impatient
-------------------------------------------------------------------------

First of all you need to have a :doc:`CPU-quota and a login account <./account>`, and then you can :doc:`log onto the system <./login>`.

Once you have passed the initial hurdles you can start computing, but before you start we would like you to read through the following basic points about our computing service.

#. You need to run batch jobs to get computing going.
#. You need to have some sense of parallelism to get performance. (Stallo will not do this automatically for you.)
#. Do NOT run long or very memory-consuming computations on the login nodes. With long we mean more than 15 minutes of runtime. We kill long running processes automatically.
#. Your home catalog is for things you write and cannot recompute (we take REALLY good care of that stuff), the project area is for things you want to share with others on stallo (we take good care of that too), the work area is for big data results coming from your computations (we do not take backup of these data).

Keep this guidelines in the back of your head and try to start running jobs on the system.  :doc:`Here <./firstjob>` is a quick run-through on how to get your first job running on the system.
