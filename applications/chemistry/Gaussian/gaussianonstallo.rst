.. _gaussian_on_stallo:

=====================================
About the Gaussian install on Stallo
=====================================

This page contains info about special features related to 
the Gaussian install made on Stallo, but also generall issues
vaguely documented elsewhere.

Gaussian on Stallo:
-------------------

First note is that the Gaussian install on Stallo is the Linda parallel version, so it 
scales somewhat initially. On top of this, Gaussian on Stallo is installed with a little trick, where the executables are intercepted before launced, and an 
alternative socket library is loaded. This enables the possibility of running Gaussian natively on the infiniband 
network giving us two advantages:

* The parallel faction of gaussian executables scales a lot "longer" (to more cores).
* The shared memory performance is significantly enhanced (small scale performance). 

But since we do this trick, we are greatly depending on altering the specific nodal adress into the 
input file: To run gaussian in parallel requires the additional keywords %LindaWorkers and %NProcshared 
in the Link 0 part of the input file. This is taken care of by a wrapper, and is commented in jobscript example file. 
Please do use this script or similar when submitting jobs; it will benefit all of us.

We have also taken care of the rsh/ssh setup in our installation procedure, to avoid .tsnet.config dependency for users.

About memory allocation for Gaussian:
--------------------------------------

* In general, Gaussian takes care of memory allocation internally.

That means that if the submitted job needs more memory per core than what is in average available on the node, it will automaticall scale down the number o\
f cores to mirror the need. This also means that you allways should ask for full nodes when submitting Gaussian 09 jobs!

The %mem allocation of memory in the Gaussian input file means two things:

* In general it means memory/node – for share between nprocshared, and aditional to the memory allocated pr. process. This is also documented by Gaussian.
* For the mother superior (mother process/node) it also represents the network buffer allocated by Linda. So basically G09 takes a part and Linda takes a part the same 
  size – thus you should never ask for more than half of the physical memory on the nodes, unless they have swap space available - which you never should assume. 
  Basically, the general %mem limit will allways be half of the physical memory pool given in MB instead of GB - 16000MB instead of 16GB since this leaves a small part for the system. 

For core-count, node-count and amounts of memory on Stallo, see :ref:`about_stallo´. 


Scalability and parallel performance of Gaussian on Stallo:
------------------------------------------------------------

Due to the nifty trick mentioned above, we have a somewhat more generous policy when it comes to 
allocating cores/nodes to Gaussian jobs:

#. We do advice people to use up to 16 nodes, at least 12 full nodes, with the current install on Stallo. We have proved acceptale scaling of the current
   Gaussian install beyond 16 nodes with 16 cores on each. So in essence; at least up to 16 nodes. Enjoy.
#. Linda networking overhead seems to hit hard around this amount of cores; causing us to be somewhat reluctant to advice going to more than this. On the 
   other hand, this will give you a maximum of 320 cores with the most recent hardware available on Stallo. 

We have been looking into issues related to this, and expect this situation to change when the new Gaussian Major release comes out late 2016/ early 2017.
