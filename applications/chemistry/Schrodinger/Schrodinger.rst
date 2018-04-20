.. _Schrodinger:

==========================
Schrödinger Product Suites
==========================

A description of the Schrödinger product suites that are available for norwegian academic users

Related information
-------------------

.. toctree:: :maxdepth: 1
   :titlesonly:

   run_schrod
   install_schrod

General Information
===================

NOTUR is, together with the user community, funding a national license of Schrödinger´s Small Molecule Drug Discovery Suite and PyMol. This implies that users are allowed to download and install their own copies of the software, and using the license server for providing license tokens. More about that in another document: :ref:`install_schrodinger`.

Online info from vendor
-----------------------

* Homepage: https://www.schrodinger.com/


About the suites:

* Small Molecule Drug Discovery Suite: https://www.schrodinger.com/suites/small-molecule-drug-discovery-suite
* PyMol: https://www.schrodinger.com/pymol

For documentation, you need to create an account (free) and log in. Documentation is also available in the software home folder:

.. code-block:: bash

	$ module load Schrodinger/{version}
	$ cd $SCRODINGER/docs

Remeber to point a pdf-reader or html reader to the documentation if you plan to read it on Stallo.

Support people in NOTUR do not provide trouble shooting guides anymore. For Schrödinger suites, the vendor company is giving good support \
on a system level. Problems related to running schrodinger on a NOTUR facility should be adressed to us.

Citation
--------

When publishing results obtained with the referred software, please do check the developers web page in order to find the correct citation(s).

License and access policy
-------------------------

The licenses of Schrödinger Product Suites are commercial.

NOTUR is, together with the user community, funding a national license of Schrödinger´s Small Molecule Drug Discovery Suite and PyMol. The licenses are administered by a license server based on flexlm. The adress for this license setup is available upon request to support@metacenter.no.

The outtake of license tokens is monitored on regular basis, and we try to catch those who seems to use the suite for regular scientific production and ask them to contribute financially to the overall deal. So far, this policy have worked fairly well.

All members of the co-funding research groups have unlimited access to the Schrödinger´s Small Molecule Drug Discovery Suite and PyMol license tokens.

`Please note that this is an academic type license; meaning that research institutes not being part of Norwegian Universities must provide their own license to be able to use and publish results obtained with this code on NOTUR installlations.`

Usage
=====

The most commot usage of schrodinger on Stallo is through the Maestro gui. Log in with x11-tunneling enabled, or through the web-interface http://stallo-gui.uit.no/.
Load the module of choice:

Use

.. code-block:: bash

    $ module avail Schrodinger


to see which versions of Schrodinger are available.

Use

.. code-block:: bash

 $ module load Schrodinger/<version> # i.e 2017-2-intel-2016a

to get access to Schrodinger.  The batch resource allocation system is integrated with the gui through a schrodinger.hosts file which is centrally administered.

Please do not hold a local copy!

For examples on how to submit Schrodinger jobs on Stallo, look here :ref:`run_schrodinger`.


Finding available licenses
==========================

This should in principle be obsolete for users, since we are promised unlimited licenses in the national system. But still, for the curious souls:

If you want to know about avaible licenses; do the following

(after loading the schrodinger module)

.. code-block:: bash

   $ licadmin STAT

This command will give you information about license status for the national Schrodinger suite licenses.

Access to PyMOL
===============

For users that wants/needs access to PyMOL, please fill out the following form: https://skjema.uio.no/pymol-access.

**Please not that this strategy replaces old habits of sending personal emails in this regard.**




