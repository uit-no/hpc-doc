---
title: How to run ADF using fragments
...

This is a brief introduction to how to create fragments necessary for among other things, BSSE calculations and proper broken symmetry calculations.

**Running with fragments:**

* Download and modify script for fragment create run, e.g. this template: Create.TZP.sh  (modify ACCOUNT, add desired atoms and change to desired basis and desired functional)
* Run the create job in the same folder as the one where you want to run your main job(s) (qsub Create.TZP.sh).
* Put the line cp $init/t21.* .  in your ADF run script (in your $HOME/bin directory)
* In job.inp, specify correct file name in FRAGMENT section, e.g. “H   t21.H_tzp”. * Submit job.inp as usual. 
 

Running with fragments is only necessary when you want to run a BSSE calculations or manipulate charge and/or atomic mass for a given atom (for instance modeling heavy isotope labelled samples for frequency calculations).  