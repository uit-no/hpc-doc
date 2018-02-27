.. _COMSOL:

======================================
The COMSOL Multiphysics software suite
======================================

Information regarding the computational physics program system COMSOL


Related information
-------------------

.. toctree::
   :maxdepth: 1
   :titlesonly:

   firsttime_comsol.rst


General Information
===================

Description
-----------

COMSOL Multiphysics® is a general-purpose software platform, based on advanced numerical methods, for modeling and simulating physics-based problems. It is highly visual, based on graphical interfaces - so users are adviced to use either the client installation on their client machine or the remote graphics solution on Stallo.

Online info from vendor
-----------------------

* Homepage: https://www.comsol.com
* Documentation/support: https://www.comsol.com/support


License information
-------------------

The license of COMSOL is commercial/proprietary.

The installation of COMSOL on Stallo is for UiT users only. If you need/want access to COMSOL, you need to contact UiT support.


Citation
--------

When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citat\
ion(s).


Additional online info about COMSOL on Stallo:
==============================================

Usage
-----


COMSOL is a rather memory intensive code, so we would generally advice users to either run their jobs on the highmem-nodes (with 8GB/core of memory) or less than full nodes on the slim nodes.

Use

.. code-block:: bash

    $ module avail COMSOL

to see which versions of COMSOL are available. Use

.. code-block:: bash

 $ module load COMSOL/<version> # i.e 5.3-intel-2016a

to get access to any given version of COMSOL.

The license of comsol is installed as a floating network license type, meaning that there is a server checking out license tokens upon request.
If you want to know whether there are available license tokens or not, load the module as above. Then type

.. code-block:: bash

    $ lmstat -c $LMCOMSOL_LICENSE_FILE -a

Happy calculations!
