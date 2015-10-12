===========================================
Amsterdam Density Functional program system
===========================================

A description of the quantum chemistry and material science package ADF/BAND

General Information:
====================
The Amsterdam Density Functional (ADF) software is used for electronic structure calculations. As the name implies, only DFT calculations can be run. In ADF, basis sets are of Slater-type (instead of Gaussian-type), giving improved performance and good convergence results for especially metal compounds. Note that also naming of basis sets is somewhat different from standard gaussian type basis sets, which makes basis set comparison less trivial. All-electron basis sets are available for the entire periodic table. See: http://www.scm.com/Products/Overview/ADFinfo.html.

Functionality
-------------

* Single Point calculation, Geometry Optimization and Transition States
* Frequencies and thermodynamic properties
* Tracing a Reaction Path
* Computation of any electronic configuration
* Excitation energies, oscillator strengths, transition dipole moments, (hyper)polarizabilities, Van der Waals dispersion coefficients, CD spectra, ORD, using Time-Dependent Density Functional Theory (TDDFT)
* ESR (EPR) g-tensors, A-tensors, NQCCs
* NMR chemical shifts and spin-spin coupling constants and Various other molecular properties
* Treatment of large systems and environment by the QM/MM (Quantum Mechanics / Molecular Mechanics) hybrid approach.
* Implementation of the Noodleman spin-flip method. See the online manual for more information: `http://www.scm.com/Doc/Doc2009.01/ADF/ADFUsersGuide/page85.html#keyscheme%20SPINFLIP <http://www.scm.com/Doc/Doc2009.01/ADF/ADFUsersGuide/page85.html#keyscheme%20SPINFLIP>`_


ADF on Stallo:
==============

You load the application by typing:

.. code-block:: bash

    $ module load adf

This command will give you the default version.

For more information on available versions, type:

.. code-block:: bash

    $ module avail adf

If you want to run other versions of ADF, change the <module load> parameter in the script file to the version you want to run, for instance:

.. code-block:: bash

 $ module load adf/2013.01

will load the version adf2013.01. For more information on ADF/BAND, see: http://www.scm.com/

JOB SUBMISSION GUIDELINES
=========================

* Download the run script adf2012.run and move the file to your $HOME/bin directory (if necessary create directory first).
* Submit job (s) from any directory:

.. code-block::

 $ adf2012.run input 2 8 20:30 

Job-name is here input.inp, number of nodes is 2 with 8 processors per node and 20 hrs 30 minutes run time (walltime). If you want to look at a typical input file for geometry optimizations with ADF, look at inputfile for ADF geometry optimization.

Note
----
* Generated output and TAPE21 files are named based on input file. 
  Example: input.inp gives input-a12.out and input-a12.t21 outputs if 
  using the adf2012.run script. 
* ADF jobs are run in /global/work/$LOGNAME/$PBS_JOBID (one 'kid' 
  directory per requested node). This is a measure to ease support 
  efforts from our side. Temporary directories are removed upon job 
  completion. If job aborted prematurely, temporary directories need 
  to be removed manually. Remember to move the TAPE21 file before 
  deleting the temporary kid0 folder.
* The output file is continuously updated to the $HOME directory (from 
  where the job was submitted).
* Since ADF is a very complex code, able to solve a vast range of 
  chemistry problems - giving unified advice regarding scaling is 
  difficult. For a standard geometry optimization, it seems to scale 
  well in the region of 4-6 full nodes (64-96 cores) at least. For 
  linear transit we would currently stay at no more than 4 full nodes 
  or less. Unless having tests indicating otherwise, users who want 
  to run large jobs should allocate no more than the prescribed numbers 
  of processors.
 
Further information:
====================

.. toctree::
   :maxdepth: 2

   adf_restart 
   adf_fragments
   adf_troubleshoot


ADF 2009.01 run script: adf2009.run

ADF 2010.01 run script: adf2010.run

LINKS
=====
General: http://www.scm.com/

Online Manual: http://www.scm.com/Doc/Doc2008.01/ADF/ADFUsersGuide/page1.html

Utilities: http://www.scm.com/Doc/Doc2009.01/ADF/Utilities/page1.html

Email Technical Support: support@scm.com (only for ADF specific questions)
