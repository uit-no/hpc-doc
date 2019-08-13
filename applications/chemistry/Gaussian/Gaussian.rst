
===========================
The GAUSSIAN program system
===========================

Information regarding the quantum chemistry program system Gaussian

Related information
===================

.. toctree::
 :maxdepth: 1

 firsttime_gaussian.rst
 GaussView.rst
 gaussian_on_stallo.rst


General Information
===================

Description
-----------

Gaussian is a computational chemistry software program system initially
released in 1970. Gaussian has a rather low user threshold and a tidy user
setup, which, together with a broad range of possibilities and a graphical user
interface (gaussview), might explain its popularity in academic institutions.

Online info from vendor
-----------------------

* Homepage: http://www.gaussian.com
* Documentation: http://gaussian.com/man


License information
-------------------

The license of GAUSSIAN is commercial/proprietary.

The license of Gaussian constitutes of 4 site licenses for the 4 current host
institutions of NOTUR installations; NTNU, UiB, UiO, UiT. In principle, only
person from one of these institutions have access to the Gaussian Software
system installed on Stallo. Note that users that do not come from one of the
above mentioned institutions still may be granted access, but they need to
document access to a valid license for the version in question first.

* To get access to the code, you need to be in the gaussian group of users.
* To be in the gaussian group of users, you need be qualified for it - see above.


Citation
--------

When publishing results obtained with the referred software referred, please do
check the developers web page in order to find the correct citation(s).


Additional online info about Gaussian on Stallo
===============================================

Usage
-----

Since Gaussian is a rather large and versatile program system with a range of
different binaries, we would in general advice users to check whether their
jobs are parallelized or not before submitting jobs. It would in general,
unless every step is entirely well parallelized, always be more efficient to
split a complex many-step job into smaller parallel and serial parts/jobs so
that also the overall utilization of hardware is improved. I you are in doubt
whether or not your job will scale outside one node (=shared memory), go to the
Gaussian application home folder and check if there is an \*.exel version of
the executable(s) you will be using. If yes, your job will generally work ok in
parallel up to approx 300 cores (this is for the more advanced users).

We generally wants users to run as many nodes as possible to limit the walltime length of running jobs.

Use

.. code-block:: bash

    $ module avail Gaussian/

to see which versions of Gaussian are available. Use

.. code-block:: bash

 $ module load Gaussian/<version> # i.e g16_B.01

to load the version of Gaussian of your desire.


About the Gaussian version(s) installed on Stallo
-------------------------------------------------

Since the installs we have made on Stallo are somewhat different from
installs of Gaussian elsewhere, we have gathered some information about
this here :doc:`gaussian_on_stallo`.

Here we also address issues related to running Gaussian in parallel, number of cores to use,
memory allocation and special issues taken care of at install.
