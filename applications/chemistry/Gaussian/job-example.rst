

====================
Gaussian job example
====================

This page contains info aimed at first time
users of Gaussian on Stallo, but may also be useful to
more experienced users. Please look carefully through the
provided examples. Also note that the job-script example is rather richly
commented to provide additional and relevant info.

If you want to run this testjob, copy the input example and the job script example shown below
into your test job folder (which I assume you have created in advance).

Gaussian input example
----------------------

.. include:: caffeine.com
   :literal:


**NB: Pay special attention to the %mem defined in the beginning of the file.
Also note that there are no mentioning of Linda and shared memory cores. This
is addressed here:** :ref:`gaussian_on_stallo`

You can also download the input file here: :download:`Caffeine-input<caffeine.com>`


Gaussian runscript example
--------------------------

.. include:: gaussian-runscript.sh
   :literal:


**NB: Note that there has been a change in how the local IB adaption wrapper has been set up. Read the comments in the run script example!**

You can also download the runscript here: :download:`Gaussian run script<gaussian-runscript.sh>`
