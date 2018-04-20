.. _Molcas:

======
Molcas
======

Related information
===================

.. toctree::
 :maxdepth: 1

 firsttime_molcas.rst


General information
===================

Description
-----------

Molcas is an ab initio quantum chemistry software package developed by scientists to be used by scientists. The basic philosophy is is to be able to treat general electronic structures for molecules consisting of atoms from most of the periodic table. As such, the primary focus of the package is on multiconfigurational methods with applications typically connected to the treatment of highly degenerate states.

Key aspects of Molcas:

* SCF/DFT, CASSCF/RASSCF, CASPT2/RASPT2
* Fast, accurate, and robust code


Online information from vendor
------------------------------

* Homepage: http://molcas.org/
* Documentation: http://molcas.org/documentation/manual/
* For download: http://molcas.org/download.html


License and access policy
-------------------------

Molcas comes with a non-free computer center license, though it is free for academic employees from the Nordic region.
The HPC group @ UiT have an agreement with Molcas as a part of the old application management project, that we do make a central
install of the code - but users who wants access needs to document that they have made an agreement with Molcas. This proof of agreement should
then be mailed (e or non-e) to support@metacenter.no to be granted membership of the molcas group on Stallo.

For the future, we are considering establishing the same policy as for :ref:`ORCA`, especially since the vendor has done a substantial job at decomplicating
the install procedure using CMake.


Citation
--------

When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citation(s).


Usage
=====

You load the application by typing:

.. code-block:: bash

	module load Molcas/molcas82-intel-2015a

For more information on available versions of Molcas, type:

.. code-block:: bash

	module avail Molcas
