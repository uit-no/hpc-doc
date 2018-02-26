.. _g09:

===========
Gaussian 09
===========

Gaussian 09 is the current major release of the Gaussian Program System
for computational chemistry. For online manual, see here:
http://www.gaussian.com/g_tech/g_ur/g09help.htm.

**Before you do start using Gaussian 09, we encourage you to take a look at these pages at the Gaussian web site:**

- Information on program limits for Gaussian 09: http://www.gaussian.com/g_tech/g_ur/b_proglimits.htm
- Information on efficiency considerations for Gaussian 09:http://www.gaussian.com/g_tech/g_ur/m_eff.htm

**Most of the features regarding running Gaussian are analogous for g09 and g03, with some rather important exceptions:**

- Headings in inputfiles for parallel runs.
- Content in the .tsnet.config file.
- Advised number of nodes and cpus in parallel runs.

Please do read these sections carefully.

**Information related to inputs and output:**

* For information about Gaussian input: :ref:`gaussian_input`
* For input-example to download: :ref:`gaussian_water_input`
* For information on Gaussview for Gaussian: :ref:`gaussview`


Gaussian 09 on Stallo
======================

To run Gaussian 09 on Stallo, the module containing all relevant environment settings for Gaussian has to be loaded::

  $ module load Gaussian

Currently, both the minor revision b.01 and c.01 are available on Stallo, the default version being loaded is c.01. The reason for this is basically better scaling behavior. To load  loading version b.01::

 $ module load Gaussian/09.b01

If you download a run script (see below), this will be taken care of by the script (though you have to change to your preferred flavor of the Gaussian 09 code). Two run scripts are available (for running in serial and parallel, respectively). Download one of the scripts to your home/$USER/bin and use it as described.

Scriptfile-examples
-------------------

- :ref:`gaussian_serial_run`
- :ref:`gaussian_para_run`

(These scripts are also available on Stallo under /global/apps/gaussian/usage).


Job submission guidelines
--------------------------

The following guidelines are for submitting jobs using one of the available wrappers-scripts. If doing elsewise, please extract the relevant information (choice of scratch dir, output printing scheme, resource allocation for jobs) and apply to your job submission setup.

For the serial script, the number of cores is set to 1, thus you only set name of input file and walltime on the command line::

 $ g09serial.pbs water 2:00

That means running the job water.inp on a single core for 2 hours and 00 minutes. Command line argument 1 ($1) is name of input file without its extension (which is expected to be *.inp*) and command line argument 2 ($2) is walltime on the form hours:minutes.

For parallel jobs you need to add the number of cpus, preferably on the form nodes and number of cores/node also on the command line, giving a total of four inputs from the command line to enter the script. Command line argument $1 is unchanged, but $2 will now be number of nodes and $3 will be number of cores/node, with $4 as walltime on the same form as for the serial script::

 $ g09parallel.pbs water 2 16 2:00

meaning job water.inp running on 2 nodes with 16 cores on each, a total of 32 cores, for 2 hours 00 minutes - having a total cpu-time count of 64 hours. See also http://www.gaussian.com/g_tech/g_ur/m_linda.htm for info on parallel running of Gaussian 09.

**NOTE:** Running Gaussian 09 jobs in parallel requires the additional
keywords *%LindaWorkers* and *%NProcshared* in the Link 0 part of the
input file. This is further discussed here: `gaussian_input`. If you
run Gaussian 09-jobs using the scripts discussed above, this is taken
care of automatically. If not, you need to put this information in your input file manually.

If you plan to run on >1 node (using %NProcLinda), make a new file in your $HOME directory::

    .tsnet.config

containing only the line::

    Tsnet.Node.lindarsharg:/global/apps/bin/pbsdshwrapper.py

**NOTE:** If you run >1 node (using %NProcLinda), you have to use >1 processor per node.

Best practice for running Gaussian 09 jobs
-------------------------------------------

- For geometry optimizations using DFT methods, we recommends using hybrid functionals. For pure functionals (no HF exchange) - unless you have tested it and know it works - we recommend to run Gaussian 09 only on not more than 3 nodes, using 14-16 cores/node. For hybrid functionals we have seen decent scaling up to 8 nodes using 16 cores/node for minor revision c.01. On old Stallo - we saw time gain up to 12 nodes, using 7 cores/node with c.01 and up to 8 nodes with b.01.
- If your molecule is >60 atoms, Gaussian uses FMM by default (which is not parallelized), so do not run parallel in this case, unless you turn off FMM (NoFMM keyword). FMM is enabled for non-symmetric molecules with 60 atoms or more. For molecules with high symmetry this limit is 240 atoms for hybrid DFT and 360 atoms for pure DFT. (The text below is copied from http://www.gaussian.com/g_tech/g_ur/m_linda.htm)::

HF, CIS=Direct, and DFT calculations on molecules are Linda parallel, including energies, optimizations and frequencies. TDDFT energies and gradients and MP2 energies and gradients are also Linda parallel. Portions of MP2 frequency and CCSD calculations are Linda parallel, but others are only SMP-parallel, so they see some speedup from using a few nodes but no further improvement from larger numbers of nodes.

Recommended run-environment setup
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- Run jobs with /global/work/$USER/$PBS_JOBID as the default temporary work dir.
- Have the primary result files (.out and .chk) written to $HOME upon job completion (and not during running).
- As a standard setup in the scripts, temporary directories are removed upon job completion. If jobs abort prematurely, temporary directories need to be removed manually.
- To submit a .chk file along with an .inp file and/or retrieve a .chk upon job completion, make sure the .chk has the same name as the input file (e.g. filenames waterdimer.inp and waterdimer.chk, with keyword added to $jobname.inp: %chk=waterdimer).

It is always best to use SMP-parallelism within nodes and Linda only between nodes. For example on a cluster of 4 nodes, each with a dual quad-core EM64T, one should use::

 %NProcShared=8
 %LindaWorkers=node1,node2,node3,node4

rather than using more than one Linda worker per node. (Do not run more than one thread/cpu. It works very poorly on Stallo!) For the SMP-parallel jobs, you are advised to typically fill or almost fill the node (for Stallo we would at the moment advise to utilize full node, meaning 16 cores/node, for gaussian jobs unless there the memory demands says differently).

Restart of jobs
^^^^^^^^^^^^^^^
Retrieve the .chk file from the temporary directory and add the restart command to the input (opt=restart or scf=restart, depending on job). Make sure that the *.chk* and and the *.inp* files have the same firstname. Submit as usual.

Restart from g03 checkpoint file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
To do this, you need to convert the g03 .chk file to g09 .chk file using a script called c8609 in the g09 folder. Using global reference, it would look like this on Stallo::

 $ /global/apps/gaussian/g09.b01/g09/c8609 water.chk.

Links
=====

General info on running Gaussian 09: http://www.gaussian.com/g_tech/g_ur/m_running.htm

What is new in Gaussian 09: http://www.gaussian.com/g_prod/g09new.htm

Information on program limits for Gaussian 09: http://www.gaussian.com/g_tech/g_ur/b_proglimits.htm

Information on efficiency considerations for Gaussian 09: http://www.gaussian.com/g_tech/g_ur/m_eff.htm
