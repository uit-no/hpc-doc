.. _adf_troubleshoot:

================================
Troubleshooting ADF calculations
================================
by Kathrin Helen Hopmann — last modified Jun 30, 2010 03:09 PM


Collection of some error messages and possible solutions
 

Errors in .out file: 
Attempt to open nonexistent file TAPE__0
or

master does not have RSFILE. iexist=0
Solution: RESTART was specified in the .inp file, but name of TAPE21 file was not correct, or run script was unable to transport TAPE21 to the running directory. See here for details how to restart ADF calculations.

 

 EOF INPUT WHILE READING A BLOCK KEY
or

Error: Could not parse line in ATOMS key:
Solution: Check that all sections in the .inp file are terminated correctly with end.

 

Error: Could not find matching basis file for X
Solution: Basis set for atom X was not found. Check that atom labels are chemically correct.

 

If  you are running ADF 2008.01 and get an empty output-file, apart from the fragment calculations, you might have forgotten to specify the infiniband interconnects for the job.