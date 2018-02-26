.. _new_sw:

New software and module scheme
==============================

**On the 9th-10th of May 2017, the default module setup changed. It is likely that you will have problems loading modules and jobs waiting to start might crash. Jobs already running should not be affected.**

What this means:
We have many new software packages installed, that were not visible by default,
though they were already accessible. On the afore mentioned days we made these packages visible by default. There are several big changes that you will experience, and sadly this might break your job scripts and cause you error messages when trying to load modules. Jobs that are waiting to start might crash at start because they can not load modules, but already running jobs should run without problems. We apologize for these problems and we believe that this way of switching is still a better alternative than shutting Stallo down.


If you have trouble or questions, please, check this manual and contact us.

Here are the main changes you will experience:

Change of software module names
-------------------------------

You will still be able to use the "old" software you used before, but many names of sw packages will change.
The name changes are in using mixed case instead of just small case, f.e. "python" is will become "Python", "openmpi" becomes "OpenMPI", and so on. The version of the modules has also changed. In most modules the version now contains some basic information on what it was compiled with - f.e. intel/2016a or foss/2016a (Free Open Source Software, commonly referred to as GNU) - and in some cases also information on some dependency - f.e. Python/2.7.12. In the new installation, the name "intel" has a somewhat different meaning from the old installations: loading intel/13.0 will give you the intel module, and you will have icc and ifort available to you; loading intel/2016a will load several packages including icc, ifort, imkl and impi. More information on this coming soon.

If you are looking for a package, try::

  $ module avail <package_name>

This command is case insensitive, and lists you all modules, which you can load for this package
(both from the new and the old installations). If you get too many results because the name of your package is part of other names (f.e. "R", "intel", or "Python") add a "/" at the end of the name::

  $ module avail <package_name>/


Behavior of potentially conflicting modules
-------------------------------------------

Another important change is behavior of potentially conflicting modules. In the "old setup" you are
not able to have two conflicting modules - f.e. openmpi and impi - loaded at the same time.
This is only partially true for the "new scheme" and you will need to pay more attention to this.
With the new packages, it is also more common that when you load one package it will automatically
load several other packages that it needs to function.
Check what you have currently loaded with::

  $ module load

or ``ml`` for short, and unload conflicting modules, or do::

  $ module purge

to remove all loaded packages and start over.


StdEnv and StdMod
-----------------

By default, you will have StdEnv and StdMod loaded. StdEnv sets up the paths and other variables for you to have a working module environment. It has a "sticky" tag and will not be unloaded with a ``module purge`` or a ``module unload StdEnv``. We strongly recommend keeping it loaded.
StdMod loads the default system modules. You are welcome to unload it, if you wish, and both ``module unload StdMod`` or ``module purge`` will unload it.


Lmod warning "rebuild your saved collection"
--------------------------------------------
Lmod allows a user to save a bundle of modules as a collection using ``module save <collection_name>`` and ``module restore <collection_name>``. This enables you to quickly get the same list of modules loaded if you tend to use the same modules over and over.
With a new module scheme came a different system MODULEPATH. For this reason, if you have some module collections saved, you will experience the following warning: "Lmod Warning:  The system MODULEPATH has changed: please rebuild your saved collection."
To solve this you need to remove your old collections and create them again. We apologize for the inconvenience.

If you are already using "mod_setup.sh" or "/home/easybuild/"
-------------------------------------------------------------

If you have already started using the new modules by loading the "notur" module and sourcing "mod_setup.sh", simply remove these two steps and continue working as normal. The same goes for any references to /home/easybuild/. We kept these options working for now to reduce the number of potentially crashing jobs, but we plan to remove them in the near future, so we recommend removing those lines from any new jobs you launch. You do not need the module "varset" any more, StdEnv has taken over its functionality. If the only reason you were using the "notur" module was to access the newer installations, you do not need it either. If you were using the "notur" module to run ADF or other software, then you still need to continue using it.
