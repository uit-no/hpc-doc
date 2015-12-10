===========================================
Schrödinger Product Suites
===========================================

A description of the Schrödinger product suites that are available for norwegian academic users

General Information:
====================

NOTUR is, together with the user community, funding a national license of Schrödinger´s Small Molecule Drug Discovery Suite and PyMol.

Online info from vendor:
------------------------

Homepage: http://www.schrodinger.com/
About the suites: 
*.Small Molecule Drug Discovery Suite: http://www.schrodinger.com/smdd/
*.PyMol: http://www.schrodinger.com/pymol/      	  	  

For documentation, you need to create an account (free) and log in. For 2015.4 and onwards also available on Stallo under $SCHRODINGER/../Documentation.

The support people in NOTUR, do not provide trouble shooting guides anymore, due to a national agreement that it is better for the community as \
a whole to add to the community info/knowledge pool where such is made available. For Schrödinger suites, we have a very good collaboration with the schrodinger company, which are giving us good support on a system level. Probelems related to running schrodinger on a NOTUR facility should be adressed to us. 

Citation
--------
When publishing results obtained with the referred software referred, please do check the developers web page in order to find the correct citat\
ion(s).

License information:
--------------------
The licenses of Schrödinger Product Suites are commercial. 

NOTUR is, together with the user community, funding a national license of Schrödinger´s Small Molecule Drug Discovery Suite and PyMol. The licenses are administered by a license server based on flexlm. The adress for this license setup is available upon request to support-uit(at)notur.no.

`Please note that this is an academic type license; meaning that research institutes not being part of Norwegian Universities must provide their own l\
icense to be able to use and publish results obtained with this code on NOTUR installlations.`

Usage
======

The most commot usage of schrodinger on Stallo is through the Maestro gui. Log in with x11-tunneling enabled, or through the web-interface http://stallo-gui.uit.no/.
Load the module of choice:

Use

.. code-block:: bash

    $ module avail schrodinger
 

to see which versions of Schrodinger are available. 

Use

.. code-block:: bash

    $ module load schrodinger

or 

.. code-block:: bash

 $ module load schrodinger/<version> # i.e 2015.4

to get access to Schrodinger.  The batch resource allocation system is integrated with the gui through a schrodinger.hosts file which is centrally administered. 

First run of schrodinger on Stallo:
--------------------------------

Log in to Stallo using either ssh -Y or through stallo-gui.uit.no.  To get download the jobscript example(s), type the following:

.. code-block::bash

 $ module load notur
 $ cd $APPEX/schrodinger 

Copy the contents of this folder to your home directory.

Note: This suite is quite extensive in its features, and we generally advice you to either join tutorial courses, talk to experts in your proximity or read the vendor-provided documentation if you have absolutely no knowledge about how to use this suite of software. Here we oly provide a couple of rough startup examples to get you up running.

Then;

**If you want to test the molecular dynamics package**

Do the following:

.. code-block::bash

   $ cd example_md
   $ maestro -NOSGL

and start a Molecular Dynamics task from the Tasks menu bar. Load model system from file, choose desmond_md_example.cms

Set all settings to your satisfaction.

Open the job settings; you should only be presented the following options

#. localhost (only for job-setups)
#. batch-short (2 hrs walltime)
#. batch-normal (50 hrs walltime)
#. batch-long (300 hrs walltime)
#. batch-longer (500 hrs walltime)

Make sure that only one option is highlighted (only one of the batch-XXX´s). Press the run button and supervise running.

(This test case is provided us by Vladimir Pomogaev.)

**If you want to test the docking package**

Do the following:

.. code-block::bash

   cd example_docking
   maestro -NOSGL

and start a Docking task from the Tasks menu bar.

Choose abl1-kinase-t316i_glide-grid.zip as grid

Use ligands from file; if you want to run a very short test - choose abl1-kinase-t316i_minimized.mae, for a longer test browse for SD and choose Asinex-50000-3D-minimized.sdf set of ligands. Set all settings to your satisfaction. For job settings, see example above.

(This test case is provided us by Bjorn Dalhus.)

**If you want to run vsw routines from the command line:**

The Schrodinger suite is shipped with scripts that connects the software installation with the system batch resource allocation setup, making it possible to submit glide jobs from the linux command line. 

Examples of valid command line submissions using the vsw-tool on Stallo:

.. code-block::bash
   
   vsw *.inp -DRIVERHOST batch-normal -host_glide batch-normal:100 -NJOBS 1 –adjust

If you are worried that you will not refind your files for emergency startup:

.. code-block::bash

   vsw *.inp -DRIVERHOST batch-normal -host_glide batch-normal:100 -NJOBS 1 -LOCAL

   vsw *.inp -DRIVERHOST batch-normal -host_glide batch-normal:100 -NJOBS 1 -SAVE


Note the following details:   

#. When the Schrodinger module is loaded on Stallo, the schrodinger folder is set in path, making $SCHRODINGER unecessary.
#. The Schrodinger setup on Stallo writes to the scratch file system by default, potentially making both the -LOCAL and the -SAVE flags uneccesary.
#. We do not recommend the -REMOTEDRIVER flag due to the risk of loosing jobs related to the admin process running out allocated time.

**Additonal information:**

If you want to know about avaible licenses; do the following

(after loading the schrodinger module)

.. code-block::bash

   $SCHRODINGER/licadmin STAT

This command will give you information about license status for the national schrodinger suite licenses.






