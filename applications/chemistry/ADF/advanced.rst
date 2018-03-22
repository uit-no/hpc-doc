.. _adf_advanced:

==============================
Information for advanced users
==============================

Scaling behaviour
-----------------

Since ADF is a very complex code, able to solve a vast range of chemistry problems - giving a unified advice regarding scaling is difficult. We will try to inspect scaling behaviour related to most used areas of application. For a standard geometry optimization, it seems to scale well in the region of 4-6 full nodes (60-100 cores) at least. For linear transit we would currently stay at no more than 4 full nodes or less currently.Unless having tests indicating otherwise, users who want to run large jobs should allocate no more than the prescribed numbers of processors. More information will come.


Memory allocation
-----------------

On Stallo there are 32 GB and 128GB nodes. Pay close attention to memory usage of job on the nodes where you run, and if necessary redistribute the job so that it uses less than all cores on the node until the limit of 32 GB/core. More than that, you will need to ask for access to the highmem-queue. As long as you do not ask for more than 2 GB/core, using the pmem-flag for torque does in principle give no meaning.


How to restart an ADF job
-------------------------

#. In the directory where you started your job, rename or copy the job-output t21 file into $SCM_TMPDIR/TAPE21.

#. In job.inp file, put RESTART TAPE21 just under the comment line.

#. Submit job.inp file as usual.

This might also be automized, we are working on a solution for restart after unexpected downtime.


How to run ADF using fragments
------------------------------

This is a brief introduction to how to create fragments necessary for among other things, BSSE calculations and proper broken symmetry calculations.

**Running with fragments:**

* Download and modify script for fragment create run, e.g. this template: Create.TZP.sh  (modify ACCOUNT, add desired atoms and change to desired basis and desired functional)
* Run the create job in the same folder as the one where you want to run your main job(s) (sbatch Create.TZP.sh).
* Put the line cp $init/t21.* .  in your ADF run script (in your $HOME/bin directory)
* In job.inp, specify correct file name in FRAGMENT section, e.g. “H   t21.H_tzp”. * Submit job.inp as usual.


Running with fragments is only necessary when you want to run a BSSE calculations or manipulate charge and/or atomic mass for a given atom (for instance modeling heavy isotope labelled samples for frequency calculations).
