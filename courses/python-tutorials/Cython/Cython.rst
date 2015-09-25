.. role:: cover

=========================================
:cover:`Cython`
=========================================

.. class:: cover

    ::

        Jonas Juselius <jonas.juselius@uit.no>
    
        HPC@UiT

.. raw:: pdf

   SetPageCounter 0
   Transition Dissolve 1
   PageBreak oneColumn

Introduction
----------------------------------------------------
* Fortran and C/C++ are well suited for problems requiring
  highly optimized execution
* For high-level tasks, low-level languages are cumbersome,
  error prone and slow to write
* Python is a flexible and elegant language for rapid
  development
* Cython translates Python code to native C/C++:
    * Faster execution
    * Much faster execution
    * Makes interfacing with Fortran and C/C++ simple
    * Python/Cython can be used as a bridge between unrelated
      software modules

Cython
----------------------------------------------------
* Cython compiles Python code to C or C++:
    * 15-20% faster execution
* Cython extends Python syntax:
    * File extension .pyx (and .pxd)
    * Native data types (integer, real):
* The simplicity of Python at the speed of Fortran
    * Directives for easy interfacing of Python with C/C++:
* Direct calling of C/C++ and Fortran routines from Python
* Interfacing Fortran is best done through the F2003
  ISO_C_BINDING facility (recent gfortran, ifort)
* Cython support in CMake:
    * Trivial to compile and run Cython code
    * Fortran and C/C++ linkage


