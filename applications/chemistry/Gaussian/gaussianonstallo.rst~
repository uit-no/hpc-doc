=====================================
About the Gaussian install on Stallo
=====================================

This page contains info about special features related to 
the Gaussian install made on Stallo, but also generall issues
poorly documented elsewhere.

* We have taken care of the rsh/ssh setup for you in our installation, so you do not need a .tsnet.config file anymore.

* To run gaussian in parallel requires the additional keywords %LindaWorkers and %NProcshared in the Link 0 part of the input file. This is taken care of by a wrapper, and is commented in jobscrip\
te example.

About %mem and memory allocation for Gaussian and slurm:
---------------------------------------------------------
* In general, Gaussian takes care of memory allocation internally - so if the submitted job needs more memory per core than what is available per node, it will automaticall scale down the number o\
f cores to mirror the need. This means that you allways should ask for full nodes when submitting Gaussian 09 jobs!

You adress quite a few questions that are, in fact, not relevant to slurm but to gaussian and how this is installed  - both on Abel and on Stallo.

I will rewrite the whole documentation to adress those questions, since we have grown increasingly aware of the fact that how memory allocation actually works with G09 is poorly documented by gaus\
sian and relatedly poorly understood by users.

I will just give you the short version of answers

1; we do advice people to use up to 16 nodes, at least 12 full nodes, with the current install on Stallo. In contrast to Abel, we have the Linda version installed, and on top of that we have used \
a trick to utilize the infiniband network – causing G09 to scale proven beyond 16 nodes with 16 cores on each. Gaussian seems to have a thing with 16 cores/node  - this might have to do with our l\
icensed supported hardware – this we are currently working to get verfied. So, in essence: 16 nodes with 16 cores on each – makes 256. Enjoy.
2; with slurm, we want people to change from nodes + cores to tasks. That means that instead of asking for –N 16, -ncores-per-node=16, we want people to ask for –ntasks=256. Currently we only have\
 20 core nodes with slurm, so I would advise you to ask for 240.
3; Memory allocation in G09 means two things: (%mem)
-          In general it means memory/node – for share between nprocshared, and aditional to the memory allocated pr. process. This is also documented by Gaussian.
-          For the mother superior (mother process/node) it also represents the network buffer allocated by Linda. So basically G09 takes a part and linda takes a part the same size – thus you sho\
uld never ask for more than half of the physical memory on the nodes, unless they have swap space available. For the new (20cores) nodes on Stallo, there is no local disk, aka no swap space. Thus \
the general limit for %mem is 16000MB (note MB and not GB, since slurm has a different interpretation of GB and MB, it seems, than Torque).

Well, if this is the short answer – imagine the long one...
