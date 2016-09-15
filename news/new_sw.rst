
.. _news:

New software
============

We have some new software packages installed. For several reasons these installations are still considered experimental an can change without prior notice. In particular, the name of the packages and the behavior of lmod commands such as `module load`, `module avail`, `module spider`, etc. is likely to change. 

Beware: by default on Stallo, you are not able to have two conflicting modules - f.e. openmpi and impi - loaded at the same time. This is only partially true for these new packages. With the new packages it is also more common that when you load one package it will automatically load several other packages that it needs to function. We recommend doing `ml` after every load and unloading any conflicting packages.

If you would like to use these modules, execute the following 2 commands:

::

    ml notur
    source mod_setup.sh
    
Now work as normal. The module `varset` needs to be kept loaded for some variables to be set correctly and things to work. To see which modules you now have available do

::

    module avail

You should be able to see and load both the "old" software packages and the "new" ones. For example, you should be able to load both intel/13.0 and intel/2016a, but note the difference in the behavior of these 2 packages. 


Feedback
--------
Feedback is appreciated. If you would like to give us feedback or if you have questions, please send an email to our usual address support-uit@notur.no.


Tips
----
If you want to have your default settings back without logging out and back in, do:

::

    ml notur
    source undo_mod_setup.sh


If you want to have this setup as your default setup:

::

    ml notur
    source new_default.sh
These settings are then saved as your default and you will have them when you log in. The module `varset` needs to be kept loaded for some variables to be set correctly and things to work.


If you want to go back to your old defaults: 

::

    ml notur
    source undo_new_default.sh

