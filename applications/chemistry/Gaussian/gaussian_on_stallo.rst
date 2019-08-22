.. _gaussian_on_stallo:

==========================
Memory and number of cores
==========================

This page contains info about special features related to
the Gaussian install made on Stallo, but also general issues
related to Gaussian only vaguely documented elsewhere.


Choosing the right version
--------------------------

To see which versions of Gaussien are available, use::

  $ module avail Gaussian/

To load a specific version of Gaussian, use for instance::

  $ module load Gaussian/g16_B.01


Gaussian over Infiniband
------------------------

First note that the Gaussian installation on Stallo is the Linda parallel
version, so it scales somewhat initially. On top of this, Gaussian is installed
with a little trick, where the loading of the executable is intercepted before
launched, and an alternative socket library is loaded. This enables the
running Gaussian natively on the Infiniband network giving us
two advantages:

* The parallel fraction of the code scales to more cores.
* The shared memory performance is significantly enhanced (small scale performance).

But since we do this trick, we are greatly depending on altering the specific
node address into the input file: To run gaussian in parallel requires the
additional keywords ``%LindaWorkers`` and ``%NProcshared`` in the ``Link 0`` part of the
input file. This is taken care of by a wrapper script around the
original binary in each individual version folder. This
is also commented in the job script example. Please use
our example when when submitting jobs.

We have also taken care of the rsh/ssh setup in our installation procedure, to
avoid .tsnet.config dependency for users.


Parallel scaling
----------------

Gaussian is a rather large program system with a range of different binaries,
and users need to verify whether the functionality they use is parallelized and
how it scales.

Due to the preload Infiniband trick, we have a somewhat more generous policy
when it comes to allocating cores/nodes to Gaussian jobs but before computing a
table of different functionals and molecules, we strongly advice users to first
study the scaling of the code for a representative system.

Please do not reuse scripts inherited from others without studying the
performance and scaling of your job. If you need assistance with this, please
contact the user support.

We do advice people to use up to 256 cores (``--tasks``). We have observed
acceptable scaling of the current Gaussian install beyond 16 nodes for the jobs
that do scale outside of one node (i.e. the binaries in the $gXXroot/linda-exe
folder).  Linda networking overhead seems to hit hard around this amount of
cores, causing us to be somewhat reluctant to advice going beyond 256 cores.

Since we have two different architectures with two different core counts on
Stallo, the ``--exclusive`` flag is important to ensure that the distribution
of jobs across the whole system are done in a rather flexible and painless way.


Memory allocation
-----------------

Gaussian takes care of memory allocation internally.

That means that if the submitted job needs more memory per core than what is in
average available on the node, it will automatically scale down the number of
cores to mirror the need. This also means that you always should ask for full
nodes when submitting Gaussian jobs on Stallo! This is taken care of by the
``--exclusive`` flag and commented in the job script example.

The ``%mem`` allocation of memory in the Gaussian input file means two things:

* In general it means memory/node – for share between ``nprocshared``, and
  additional to the memory allocated per process. This is also documented by
  Gaussian.
* For the main process/node it also represents the network
  buffer allocated by Linda since the main Gaussian process takes a part
  and Linda communication process takes a part equally sized – thus you should
  never ask for more than half of the physical memory on the nodes, unless they
  have swap space available - which you never should assume.
  The general ``%mem`` limit will always be half of the physical memory
  pool given in MB instead of GB - 16000MB instead of 16GB since this leaves a
  small part for the system. That is why we would actually advise to use 15GB as
  maximum ``%mem`` size.


Large temporary outputs on Stallo
---------------------------------

As commented here :doc:`/storage/storage` there is an issue related to very
large temporary files on Stallo. Please read up on it at act accordingly. This
issue is also commented in the job script example.
