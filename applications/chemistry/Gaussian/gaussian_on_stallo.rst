.. _gaussian_on_stallo:

====================================
About the Gaussian install on Stallo
====================================

This page contains info about special features related to
the Gaussian install made on Stallo, but also general issues
related to Gaussian only vaguely documented elsewhere.

Gaussian on Stallo
------------------

First note that the Gaussian install on Stallo is the Linda parallel version, so it
scales somewhat initially. On top of this, Gaussian on Stallo is installed with a little trick, where the executables are intercepted before launched, and an
alternative socket library is loaded. This enables the possibility of running Gaussian natively on the infiniband
network giving us two advantages:

* The parallel faction of gaussian executables scales a lot "longer" (to more cores).
* The shared memory performance is significantly enhanced (small scale performance).

But since we do this trick, we are greatly depending on altering the specific
node address into the input file: To run gaussian in parallel requires the
additional keywords %LindaWorkers and %NProcshared in the Link 0 part of the
input file. This is taken care of by a wrapper we have chosen to put around the
original g<VER> binary (g09, g16 etc) in each individual version folder. This
is also commented in the job script example for first-time runs.  Please do use
this script or similar when submitting jobs; it will benefit all of us.

We have also taken care of the rsh/ssh setup in our installation procedure, to avoid .tsnet.config dependency for users.

About memory allocation for Gaussian
------------------------------------

* In general, Gaussian takes care of memory allocation internally.

That means that if the submitted job needs more memory per core than what is in
average available on the node, it will automatically scale down the number o\ f
cores to mirror the need. This also means that you always should ask for full
nodes when submitting Gaussian jobs on Stallo! This is taken care of by the
exclusive flag and commented in the job script example.

The %mem allocation of memory in the Gaussian input file means two things:

* In general it means memory/node – for share between nprocshared, and additional to the memory allocated pr. process. This is also documented by Gaussian.
* For the mother superior (mother process/node) it also represents the network
  buffer allocated by Linda. So basically the main Gaussian process takes a part
  and Linda communication process takes a part equally sized – thus you should
  never ask for more than half of the physical memory on the nodes, unless they
  have swap space available - which you never should assume. Basically, the general %mem limit will always be half of the physical memory
  pool given in MB instead of GB - 16000MB instead of 16GB since this leaves a
  small part for the system. (That is why we would actually advise to use 15GB as
  maximum %mem size.

For core-count, node-count and amounts of memory on Stallo, see :doc:`/stallo/stallo`

Scalability and parallel performance of Gaussian on Stallo
----------------------------------------------------------

Due to the nifty trick mentioned above, we have a somewhat more generous policy when it comes to
allocating cores/nodes to Gaussian jobs:

#. We do advice people to use up to 256 cores (slurm syntax tasks). We have proved acceptable scaling of the current
   Gaussian install beyond 16 nodes for the jobs that do scale outside of one node (i.e. the binaries in the $gXXroot/linda-exe folder). So in essence; enjoy!
#. Linda networking overhead seems to hit hard around this amount of cores;
   causing us to be somewhat reluctant to advice going to more than this. Meddling
   with this requires a bit more insight, which we are happy to help out with but
   reluctant to advise beginners do at an early stage. Though; this will give a
   potential of up to 320 cores in parallel on Stallo, which is more than most
   other places anyway.
#. Since we have two different architectures with two different core counts on
   Stallo, the ----exclusive flag mentioned	above is also important to
   ensure that the distribution of jobs across the whole system are done in a
   rather flexible (and painless) way.


Large temporary outputs on Stallo
----------------------------------

As commented here :doc:`/storage/storage` there is an issue related to very
large temporary files on Stallo. Please read up on it at act accordingly. This
issue is also commented in the job script example.
