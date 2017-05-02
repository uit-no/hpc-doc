
.. _new_sw:

New software and module scheme
===============================

**On the 9th-10th of May 2017 the default module setup will change.**

What this means: 
We have many new software packages installed, that are at the moment not visible by default, 
though they are already accessible. On the afore mentioned days we will make these packages visible by default. 
You will still be able to use the "old" software you used before, but some names will have changed.
The name changes are in using mixed case in stead of just small case, f.e. "python" is will become "Python".
If you are looking for a package, try::

  $ module avail <package_name>

This command is case insensitive, and will list you all possible modules you can load for this package 
(both from the new and the old installations).

Another important change is behaviour of potentially conflicting modules. In the "old setup" you are 
not able to have two conflicting modules - f.e. openmpi and impi - loaded at the same time. 
This is only partially true for the "new scheme" and you will need to pay more attention to this. 
With the new packages it is also more common that when you load one package it will automatically 
load several other packages that it needs to function. 
Check what you have currently loaded with::

  $ module load
  
or ``$ ml`` for short and uloaded conflicting modules or do::

  $ module purge

to remmove all loaded packages and start over.

**If you have already started using the new modules** by loading the  "notur" module and sourcing "mod_setup.sh", simply remove these 2 steps and continue working as normal.

If you have trouble or questions, please, check this manual and contact us.

For information about how to reach the "new" packages before we make this scheme default see in the software section, :ref:`new_scheme`.

