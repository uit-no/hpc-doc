.. _module_scheme:

Software Module Scheme
=======================

Since a HPC cluster is shared among many users, and also holds a significant size in contrast to most desktop compute machinery around, the amount of installed software spans many applications in many different versions and quite a few of them are installed typically non-standard places for easier maintenance (for admin crew), practical and security reasons. It is not possible (nor
desirable) to use them all at the same time, since different versions of the
same application may conflict with each other. Therefore, it is practical to provide the production environment for a given application outside of the application itself. This is done using a set of instructions and variable settings that are specific for the given application called an application module. This also simplifies control of which application versions are available in a specific session.

We are also using the Easybuild system for installing software on Stallo (see https://easybuilders.github.io/easybuild/).


The main command for using this system is the *module* command. You can find a
list of all its options by typing::

  module --help

We use the lmod module system; for more info see https://lmod.readthedocs.io/en/latest/ on Stallo. Below we listed the most commonly used options, but also feel free to ivestigate options in this toolset more thoroughly on developers site.


Which modules are currently loaded?
-----------------------------------

To see the modules currently active in your session, use the
command::

  module list

 
Which modules are available?
----------------------------

In order to see a complete list of available modules, issue the
command::

  module avail

The resulting list will contain module names conforming to the following
pattern:

*  name of the module
*  /
*  version
*  (default) if default version


How to load a module
--------------------

In order to make, for instance, the NetCDF library available issue the command::

  module load netCDF

This will load the default NetCDF version. To load a specific version,
just include the version after a slash::

  module load netCDF/4.3.3.1-intel-2016a

 

How to unload a module
----------------------

Keeping with the above example, use the following command to unload the
NetCDF module again::

  module unload netcdf


Which version of a module is the default?
-----------------------------------------

In order to see, for instance, which version of NetCDF is loaded by the
module, use::

  module show netcdf

This will show the version and path of the module.
 

How do I switch to a different version of a module?
---------------------------------------------------

Switching to another version is similar to loading a specific version.  As an
example, if you want to switch from the default (current) Intel compilers
version to version 2016b (aka 2016.3), type::

  module switch intel intel/2016b


**Beware: by default on Stallo, you are not able to have two conflicting modules - f.e. openmpi and impi \ - loaded at the same time.** This is only partially true for these new packages. With the new packages it \ is also more common that when you load one package it will automatically load several other packages that \ it needs to function. We recommend doing ml after every load and unloading any conflicting packages.
