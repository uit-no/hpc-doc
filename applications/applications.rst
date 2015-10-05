.. _applications:

============
Applications
============

Software installed on Stallo
============================

For a complete list of applications see the :doc:`software page <software>`.

Missing / new SW?
-----------------

If there is any SW missing on this list that you would like to have
installed on Stallo, or you need help to install your own SW, please
feel free to contact the support personal about this:
:doc:`support-uit@notur.no <support-uit@notur.no>`

Changes in application software
-------------------------------

New and updated software will be announced on `UiT
News <http://docs.notur.no/uit/uit-news>`_.
Headlines from the above news page will also be displayed on the login
screen.
The easiest way to check which software and versions available is to use
the  ``module`` command.
List all software available::

    module avail
List all version of a specific software::

    module avail software-name

Modules
=======

Software installations on the clusters span many applications, and many
different version numbers of the same application. It is not possible
(nor desirable) to use them all at the same time, since different
versions of the same application may conflict with each other. In order
to simplify the control of which application versions are available in a
specific session, there is a system for loading and unloading 'modules'
which activate and deactivate the relevant parts of your user session.

The main command for using this system is the *module* command. You can find a list of all its options by typing

::

    module --help

Below we listed the most commonly used options.


Which modules are currently loaded?
-----------------------------------

To see the modules currently active in your session, use the
command  

::

    module list

 
Which modules are available?
----------------------------

In order to see a complete list of available modules, issue the
command 

::

    module avail

The resulting list will contain module names conforming to the following
pattern:

*  name of the module
*  /
*  version
*  (default) if default version


How to load a module
--------------------

In order to make, for instance, the NetCDF library available issue the command  

::

    module load netcdf

 

This will load the default NetCDF version. To load a specific version,
just include the version after a slash:

::

    module load netcdf/3.6.2

 

How to unload a module
----------------------

Keeping with the above example, use the following command to unload the
NetCDF module again:  

::

    module unload netcdf


Which version of a module is the default?
-----------------------------------------

In order to see, for instance, which version of netcdf is loaded by the
module, use:

::

    module show netcdf

This will show the version and path of the module.

 

How do I switch to a different version of a module?
---------------------------------------------------

Switching to another version is similar to loading a specific version.
As an example, if you want to switch from the default (current) Intel
compilers version to version 14.0, type

::

    module switch intel intel/14.0


.. :vim:ft=rst
