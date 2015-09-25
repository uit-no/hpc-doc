---
title: VASP Vienna Ab initio Simulation Package
...


A description of the material science package VASP
You load the application by typing:

.. code-block:: bash

    $ module load vasp

This command will give you the default version, which is currently 5.3.2

For more information on available versions, type:

.. code-block:: bash

    $ module avail vasp

For more information, see: http://www.vasp.at

VASP is a package for performing ab-initio quantum-mechanical molecular dynamics (MD) using pseudopotentials and a plane wave basis set.

To use VASP you need to be a member of the vasp group, contact the HPC staff to get access.
Vasp i a commercial software that requires a license for all who wants to run on Stallo, to get access you would need to prove that the group you are a member of holds a valid licence.

To start VASP you simply load the vasp module:

$ module load vasp
the binaries available are:

vasp.serial - built with no special flags
vasp.NGXhalf - built with -DNGXhalf
vasp.gamma.NGXhalf - built with -DwNGXhalf -DNGXhalf
vasp.mpi - built with no special flags for mpi
vasp.mpi.NGZhalf - built with -DNGZhalf for mpi
vasp.mpi.gamma.NGZhalf - built with -DwNGZhalf -DNGZhalf for mpi
The staff can provide other compiles om request.

more info can be found on the vasp web page.

http://www.vasp.at

