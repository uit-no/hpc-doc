.. _gaussian_water_input:

===============================
Example input file for Gaussian
===============================

::

 %chk=H2O                                    
 %mem=500mb        
 #p HF/3-21G  opt                            
                                             
 Hartree-Fock optimization of water.         
                                             
 0 1                                         
 O         0.000000    0.000000    0.047929
 H         0.000000   -0.813054    0.619662
 H         0.000000    0.813054    0.619662   


If you want to run in parallel, you need to add the tags *%NProcShared* and *%NProcLinda* in this fashion::

 %NProcShared=3
 %NProcLinda=4
 %chk=H2O                                    
 %mem=500mb        
 #p HF/3-21G  opt 

If you use the provided wrapperscripts, this is automatically taken care of.


Link to download this file: `water.inp<water.inp>`_ (this file is also found in /global/apps/gaussian/usage)

.. :vim:ft=rst
