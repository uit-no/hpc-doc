.. _vasp:

==========================================
VASP (Vienna Ab initio Simulation Package)
==========================================

VASP is a package for performing ab-initio quantum-mechanical molecular dynamics (MD) using pseudopotentials and a plane wave basis set.

To use VASP you need to be a member of the vasp group, contact the HPC staff to get access.
Vasp is a commercial software that requires a license for all who wants to run on Stallo, to get access you would need to prove that the group you are a member of holds a valid licence.


You load the application by typing:

.. code-block:: bash

    $ module load VASP

This command will give you the default version, which is currently 5.3.2

For more information on available versions, type:

.. code-block:: bash

    $ module avail vasp

For more information, see: http://www.vasp.at

We have made the following installs and updates of 5.4.1 on Stallo:

..code-block::bash

	module avail VASP

will show you a dramatic increase in the available VASP binaries for release 5.4.1.

There is two main categories: 

tooled; compiled with the texas transtition state tools ()and the VASPsol (http://vaspsol.mse.ufl.edu) solvation.F file.
plain; compiled with out any addtional tools or add-ons.

The reason for this is that we are uncertain of effects on the tooles on calculated numbers, due to reproducibility, we have chosen to hold the different version separate.

For each group of binaries, you will find a total of 15 binaries, split into three different groups.

unmodified group; binaries without any additional name to them; vasp_std
noshear: vasp_std_noshear
abfix: vasp_std_abfix

The unmodified group is compiled on basis on the unmodified set of fortran files that comes with the code.
The noshear version is compiled with
The abfix version is compiled with 

For the vasp_std in each category is compiled wtith the following cmake flags: 
      FPP+=-DNGZhalf
   EXE=vasp_std
      FPP+=-DNGZhalf -DwNGZhalf
   EXE=vasp_gam

No modification in FPP settings: 
else ifeq ($(VERSION),ncl)
   EXE=vasp_ncl


vasp_gam
vasp_gam_tbdyn
vasp_ncl
vasp_tbdyn

This is in correspondance with the default scheme from VASP.



ifndef VERSION
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf
   else
      FPP+=-DNGXhalf
   endif
   EXE=vasp_std
else
ifeq ($(VERSION),std)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf
   else
      FPP+=-DNGXhalf
   endif
   EXE=vasp_std
else ifeq ($(VERSION),gam)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf -DwNGZhalf
   else
      FPP+=-DNGXhalf -DwNGXhalf
   endif
   EXE=vasp_gam
else ifeq ($(VERSION),tbdyn)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf -Dtbdyn
   else
      FPP+=-DNGXhalf -Dtbdyn
   endif
   EXE=vasp_tbdyn
else ifeq ($(VERSION),gam_tbdyn)
   ifeq ($(DMPI),DMPI)
      FPP+=-DNGZhalf -DwNGZhalf -Dtbdyn
   else
      FPP+=-DNGXhalf -DwNGXhalf -Dtbdyn
   endif
   EXE=vasp_gam_tbdyn
else ifeq ($(VERSION),ncl)
   EXE=vasp_ncl
else
