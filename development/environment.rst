

Environment modules
===================

The user's environment, and which programs are available for immediate use, is
controlled by the ``module`` command. Many development libraries are dependant
on a particular compiler versions, and at times a specific MPI library. When
loading and/or unloading a compiler, ``module`` automatically unloads
incompatible modules and, if possible, reloads compatible versions.

Currently, not all libraries in all combinations of all compilers and MPI
implementations are supported. By using the default compiler and MPI library,
these problems can be avoided. In the future, we aim to automate the process so
that all possible (valid) permutations are allowed.

Read the :ref:`module_scheme` section for an introduction on how to use modules.
