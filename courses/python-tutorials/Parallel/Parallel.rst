.. role:: cover

=========================================
:cover:`Parallel programming in Python`
=========================================

.. class:: cover

    ::

        Jonas Juselius <jonas.juselius@uit.no>
    
        HPC@UiT

.. raw:: pdf

   SetPageCounter 0
   Transition Dissolve 1
   PageBreak oneColumn

About writing parallel programs
---------------------------------------------------------
* It's hard, hard, hard

Parallel paradigms
---------------------------------------------------------
* Trivial parallelism
* Multi-threading and shared memory
* Message passing

Parallel Python (SMP)
----------------------------------------------------------
.. literalinclude:: pp_smp.py

Parallel Python (Cluster)
----------------------------------------------------------
.. literalinclude:: pp_cluster.py

MPI: Point-to-point 
----------------------------------------------------------
.. literalinclude:: ptp_py.py

MPI: Point-to-point (numpy)
----------------------------------------------------------
.. literalinclude:: ptp_np.py

MPI: Scatter and gather 
----------------------------------------------------------
.. literalinclude:: scatter_py.py

MPI: Scatter and gather (numpy)
----------------------------------------------------------
.. literalinclude:: scatter_np.py

MPI: Reduction 
----------------------------------------------------------
.. literalinclude:: quadr.py

