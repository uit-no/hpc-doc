.. _vasp_on_stallo:

==================================
About the VASP install on Stallo
==================================

This page contains information related to the installation of VASP on Stallo. Some of this is relevant also for self-compilation of the code, for those who want to give this a try.


VASP on Stallo:
----------------

Note that the VASP installation on Stallo mainly follows the standard syntax introduced by the vASP team with their new installation scheme. Based on their system, we have added two binaries - as commented under.

If you do 

.. code-block::bash

        module avail VASP

on Stallo, you will notice that for version 5.4.1 and onwards, there is a dramatic increase in the available binaries. And this might appear confusing.


First; All versions of VASP is compiled with the support for maximally-localised Wannier functions and the Wannier90 program and also the MPI flag in FPP (-DMPI)

Second; Each  release of VASP is compiled in two different versions; "tooled" and "plain".

* VASP/x.y.z.tooled is a version where all necessary support for Texas transition state tools (vTST) and the explicit solvation model (VSPsol) and BEEF is added. 
* VASP/x.y.z.plain is the version without this support/ additions. (Relatively unmodified source).

The reason for this is that we are uncertain of effects on the tooles on calculated numbers, due to reproducibility, we have chosen to hold the different versions separate.

Then it starts getting interesting: For each version, there are 15 different binaries - consisting of 3 groups of 5.

* unmodified group; binaries without any additional name to them; vasp_std
* noshear: vasp_std_noshear
* abfix: vasp_std_abfix

The unmodified group is compiled on basis on the unmodified set of fortran files that comes with the code.
The noshear version is compiled with a modified version of the file constr_cell_relax.F file where shear forces are not calculated.
The abfix version is compiled with a modified version of the constr_cell_relax.F file where two lattice vectors are fixed.

There are 5 different binaries in each group, all compiled with the same FPP settings (mentioned below):

* vasp_std
* vasp_gam
* vasp_ncl

These are familiar from the standard build system that is provided with the code. In addtion to these, we have

* vasp_tbdyn
* vasp_gam_tbdyn
_
.. fpp_vasp_settings:

FPP settings for each binary:_
------------------------------

# vasp_std is compiled with the following additional FPP flag(s): -DNGZhalf

.. code-block::bash

ifeq ($(VERSION),std)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf
   else
      FPP+=-DNGXhalf
   endif
   EXE=vasp_std

# vasp_gam is compiled with the following additional FPP flag(s): -DNGZhalf -DwNGZhalf

.. code-block::bash

else ifeq ($(VERSION),gam)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf -DwNGZhalf
   else
      FPP+=-DNGXhalf -DwNGXhalf
   endif
   EXE=vasp_gam

# vasp_ncl is compiled with the following additional FPP flag(s): no modifcations in FPP settings

.. code-block::bash

else ifeq ($(VERSION),ncl)
   EXE=vasp_ncl

# vasp_tbdyn is compiled with the following additional FPP flag(s): -DNGZhalf -Dtbdyn

.. code-block::bash

else ifeq ($(VERSION),tbdyn)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf -Dtbdyn
   else
      FPP+=-DNGXhalf -Dtbdyn
   endif
   EXE=vasp_tbdyn

# vasp_gam_tbdyn is compiled with the following additional FPP flag(s): -DNGZhalf -DwNGZhalf -Dtbdyn

.. code-block::bash

else ifeq ($(VERSION),gam_tbdyn)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf -DwNGZhalf -Dtbdyn
   else
      FPP+=-DNGXhalf -DwNGXhalf -Dtbdyn
   endif
   EXE=vasp_gam_tbdyn

We would be happy to provide a copy of our build scripts (patches) upon request. 

About memory allocation for VASP:
----------------------------------

VASP is known to be potentially memory demanding. Quite often, you might experience to use less than the full number of cores on the node, but still all of the memory.

For core-count, node-count and amounts of memory on Stallo, see :ref: about_stallo_

There are two important considerations to make:

First: Make sure that you are using the SBATCH --exclusive flag in your run script.
Second: Read about how to allocate all the memory on the node, see :ref: all_mem_





