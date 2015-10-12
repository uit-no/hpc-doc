.. _gaussian_input:

==============
Gaussian Input
==============

`Back to Gaussian 03 top page<g03>`_



Guidelines for GAUSSIAN 03 input files:
======================================== 

- Gaussian input files usually have the extension .inp.
- The input is case-INsensitive.
- For correct reading of the input, several blank lines are required (see below).
 

**A typical input file can be divided in different sections:**

Link 0 Commands: 
  Name/location of scratch directories, naming of checkpoint and read-write-files, memory specifications, run-type pattern specifications.
Route section: 
  Specification of method, basis set, job type and additional keywords.
Comment line:
  For commenting purposes.
Coordinate section: 
  Charge, multiplicity, coordinates.
Additional input section: 
 Modredundant information, Keywords for solvent calculations (eps, cavity model).   
 

Example Input:
---------------

::

 %chk=H2O                                                       Link 0 command section
 %mem=500mb        
 #p HF/3-21G  opt                                               Route section
                                                                Blank line!
 Hartree-Fock optimization of water.                            Comment line
                                                                Blank line!
 0 1                                                            Coordinate section
 O         0.000000    0.000000    0.047929
 H         0.000000   -0.813054    0.619662
 H         0.000000    0.813054    0.619662
                                                                Blank line!
----

Parallel calculations require additional keywords in the input file::

     %NProcshared=P    (P = number of processors per node, maximum 16 on stallo)

     %NProcLinda=N      (N = number of nodes, keyword only required if you run on >1 node) 

This is put on top of the file, in the Link 0 part. The file above would then look like this:

----
 
::

 %NProcshared=6                                                 Link 0 section
 %NProcLinda=2
 %chk=H2O                                                       
 %mem=500mb        
 #p HF/3-21G  opt                                               Route section
                                                                Blank line!
 Hartree-Fock optimization of water.                            Comment line
                                                                Blank line!
 0 1                                                            Coordinate section
 O         0.000000    0.000000    0.047929
 H         0.000000   -0.813054    0.619662
 H         0.000000    0.813054    0.619662
                                                                Blank line!

----

In case of nested runs, the NProcShared and NProcLinda keywords also have to be repeated in all Link 1 sections.

Comments:
..............  

**The Link 0 section:**
During gaussian execution, several scratch files are written, whose naming/location can be controlled from the Link 0 section. Checkpoint files (.chk) contain information on output, wavefunction, molecular orbitals, etc. They are required for restarts. To keep the .chk, specify a name: %chk=water   
Normally, give the same name as the input file – this ensures the .chk is submitted/retrieved along with the .inp and .out upon job start and -end.

Read-write-files (.rwf) are normally not kept. g03 versions before C.01 have a 2GB size limit on .rwf files. Explicit specification of (up to 8) .rwf files was thus often necessary: %rwf=rwf1,1999mb,rwf2,1999mb, etc. Later g03 versions allow a single 16GB .rwf file, and .rwf specification is not necessary. 

Memory specifications should also be done in the Link 0 section. For example, solvent calculations often need more than the default memory::

 %mem=800mb

Keywords for parallel calculations are also given in the Link 0 section. They include *%NprocShared*= (number of processors per node) and *%NprocLinda*= (number of nodes). See also general Gaussian 03 info page.

For further commands see: http://www.inc.bme.hu/common/g03_man/g_ur/m_link0.htm

**Route section:**
# is required at the beginning of the line and *p* relates to the amount of output printed. *opt* refers to an optimization. Other job types: *sp* (single point), *freq* (frequency). 
Additional typical keywords in this section (added on the same line) include *scf* (to control scf cycles), *scrf* (for solvent calculations), *guess* (for reading/manipulation of wavefunction guess). See links below for all keywords and available methods/ basis sets.

**Coordinate section:**
This section starts with a line giving the overall molecular charge and multiplicity, directly followed by the coordinates. Give charge and multiplicy separated by at least one space, e.g.: +1 1. If the multiplicity is >1, the calculation automatically runs unrestricted. Both cartesian and z-matrix type coordinates are accepted as coordinate input, and atoms can be written as symbols (H,C,O) or atomic numbers (1,6,8).

The coordinate section has to be followed by a blank line.
 

LINKS:
======

More information on inputfiles: http://www.inc.bme.hu/common/g03_man/g_ur/m_input.htm

Possible input keywords: http://www.inc.bme.hu/common/g03_man/g_ur/keywords.htm

Available basis sets: http://www.inc.bme.hu/common/g03_man/g_ur/m_basis_sets.htm

Available DFT functionals: http://www.inc.bme.hu/common/g03_man/g_ur/k_dft.htm
