.. _run_schrodinger:

Running Schrodinger jobs on Stallo
==================================

This page contains info about how to submit Schrodinger jobs on Stallo, based
on two sets of examples - one for docking and one for molecular dynamics -
provided to us by users.

Pay enhanced attention to the `ssh -Y c1-2` in examples below; this represents the adviced behaviour on how to run jobs on Stallo for your benefit solely!

A more thorough explanation to this, is that maestro starts a distribution and surveilance process that creates the jobs that enters the shared resources allocation (aka batch) system. If this process dies, the underlying jobs dies disregarding their computational status. This could have been solved by just running this on the login node, but imagine how it would have been with 1000 simultanious users sharing two login nodes and 50 of those ran 20-40 simultaneous perl and python processes each on the login nodes. So, please do as told.

Submitting jobs through the maestro interface
---------------------------------------------

Log in to Stallo with either x11-tunnelling enabled or through stallo-gui.uit.no.

To get download the jobscript example(s), type the following:Direct log in via ssh:

.. code-block:: bash

 	$ module load Schrodinger/2017-2-intel-2016a
 	$ cp -r /global/hds/software/notur/apprunex/Schrodinger/* ~
	# Be sure this do not overwrite any folder or info you may want to keep in your home.

Note: This suite is quite extensive in features, and we generally advice you to either join tutorial courses, talk to experts in your proximity or read the vendor-provided documentation if you have absolutely no knowledge about how to use this suite of software. Here we only provide a couple of rough startup examples to get you up running.

Then;

**If you want to test the molecular dynamics package**

Do the following:

.. code-block:: bash

   $ ssh -Y c1-2
   $ module load Schrodinger/2017-2-intel-2016a
   $ cd example_md
   $ maestro -SGL

and start a Molecular Dynamics task from the Tasks menu bar. Load model system from file, choose desmond_md_example.cms

Set all settings to your satisfaction.

Open the job settings; you should only be presented the following options

#. localhost (only for job-setups)
#. batch-normal (2 days (=48hrs) of walltime/1000 cpus)
#. batch-long (21 days (504 hrs) of walltime/1000cpus)

Make sure that only one option is highlighted (only one of the batch-XXX´s). Press the run button and supervise running.

(This test case is provided us by Vladimir Pomogaev.)

**If you want to test the docking package**

Do the following:

.. code-block:: bash

   $ ssh -Y c1-2
   $ module load Schrodinger/2017-2-intel-2016a
   $ cd example_docking
   $ maestro -SGL

and start a Docking task from the Tasks menu bar.

Choose abl1-kinase-t316i_glide-grid.zip as grid

Use ligands from file; if you want to run a very short test - choose abl1-kinase-t316i_minimized.mae, for a longer test browse for SD and choose Asinex-50000-3D-minimized.sdf set of ligands. Set all settings to your satisfaction. For job settings, see example above.

(This test case is provided us by Bjorn Dalhus.)



If you want to run vsw routines from the command line
-----------------------------------------------------

The Schrodinger suite is shipped with scripts that connects the software installation with the system batch resource allocation setup, making it possible to submit glide jobs from the linux command line.

Examples of valid command line submissions using the vsw-tool on Stallo:

.. code-block:: bash

   vsw *.inp -DRIVERHOST batch-normal -host_glide batch-normal:100 -NJOBS 1 –adjust

If you are worried that you will not refind your files for emergency startup:

.. code-block::bash

   vsw *.inp -DRIVERHOST batch-normal -host_glide batch-normal:100 -NJOBS 1 -LOCAL

   vsw *.inp -DRIVERHOST batch-normal -host_glide batch-normal:100 -NJOBS 1 -SAVE


**Note the following details:**

#. When the Schrodinger module is loaded on Stallo, the Schrodinger software folder is set in path, making $SCHRODINGER unecessary.
#. The Schrodinger setup on Stallo writes to the scratch file system by default, potentially making both the -LOCAL and the -SAVE flags uneccesary.
#. We do not recommend the -REMOTEDRIVER flag due to the risk of loosing jobs related to the admin process running out allocated time.
