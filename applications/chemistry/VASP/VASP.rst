.. _VASP:

==========================================
VASP (Vienna Ab initio Simulation Package)
==========================================

Information regarding the Vienna Ab initio Simulation Package (VASP) installed on Stallo.

Related information
===================

.. toctree::
   :maxdepth: 1

   firsttime_vasp.rst
   vasp_on_stallo.rst


General information
===================

Description
-----------

VASP is a complex package for performing ab-initio quantum-mechanical molecular dynamics (MD) simulations using pseudopotentials or the projector-augmented wave method and a plane wave basis set. The approach implemented in VASP is based on the (finite-temperature) local-density approximation with the free energy as variational quantity and an exact evaluation of the instantaneous electronic ground state at each MD time step.

VASP uses efficient matrix diagonalisation schemes and an efficient Pulay/Broyden charge density mixing. These techniques avoid all problems possibly occurring in the original Car-Parrinello method, which is based on the simultaneous integration of electronic and ionic equations of motion.

The interaction between ions and electrons is described by ultra-soft Vanderbilt pseudopotentials (US-PP) or by the projector-augmented wave (PAW) method. US-PP (and the PAW method) allow for a considerable reduction of the number of plane-waves per atom for transition metals and first row elements. Forces and the full stress tensor can be calculated with VASP and used to relax atoms into their instantaneous ground-state.

There are various type plug ins and added functionality to VASP. On Stallo, we have added support for the Texas transition state tools (`vTST <http://theory.cm.utexas.edu/vtsttools/>`_), the `VASPsol <http://vaspsol.mse.ufl.edu>`_ implicit solvation model made by Hennig and Mathew from University of Florida and the `Bayesian Error Estimation Functionals <https://suncat.stanford.edu/about/facilities/software>`_ from the SUNCAT center, Standford.

Online information from vendor
------------------------------

* Homepage: https://www.vasp.at
* Documentation: https://cms.mpi.univie.ac.at/wiki/index.php/The_VASP_Manual


License and access policy
-------------------------

The VASP license is proprietary and commercial. It is based on group license policy, and for NOTUR systems VASP packages falls in the "bring your own license" category. See :ref:`About_licenses`.

The Vasp program is not distributed via site licences. However, HPC-staff in NOTUR have access to the VASP code to be able to support any research groups that have a valid VASP license.

VASP is a commercial software package that requires a license for all who wants use it. To run VASP:

#. Your group must have a valid licence. To acquire a licence, please consult this link: https://www.vasp.at/index.php/faqs/71-how-can-i-purchase-a-vasp-license.

#. We need to get a confirmation from a VASP representative to confirm that you have access to the license. Your group representative needs to contact Dr. Doris Vogtenhuber (doris.vogtenhuber@univie.ac.at) from the VASP team and ask her to send a confirmation email to us (support@metacenter.no) to confirm that you have a valid licence. Once we get a confirmation email we will grant you access to run VASP.

The support people in NOTUR, do not provide trouble shooting guides anymore, due to a national agreement that it is better for the community as a whole to add to the community info/knowledge pool where such is made available. Also, HPC staff from UiT does not provide any support to VASP 4 anymore, basically due to age of the code.

Citation
---------

When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citation(s).

Usage
=====

You load the application by typing:

.. code-block:: bash

    $ module load VASP

This command will give you the default version.

For more information on available versions, type:

.. code-block:: bash

    $ module avail VASP

Experiencewise, VASP is a rather memory intensive code. Users are advised to read up on the general job script example(s) for SLURM and Stallo, and also how to specify memory in `SLURM <https://slurm.schedmd.com>`_.


About the VASP version(s) installed on Stallo
---------------------------------------------

Since the installation we made on Stallo is rather taylor made, we have gathered information about this here: :doc:`vasp_on_stallo`.

Here we also adress compilation relevant information for those who would like to do it themselves.
