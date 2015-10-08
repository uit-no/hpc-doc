

Debugging with Valgrind
=======================

What is Valgrind?
-----------------

* A memory error detector
* A thread error detector
* A MPI error detector
* A cache and branch-prediction profiler
* A call-graph generating cache profiler
* A heap profiler
* Very easy to use

Valgrind is the best thing for developers since the invention of pre-sliced
bread!


How does Valgrind work?
-----------------------

Valgrind works by emulating one or more CPUs. Hence it can intercept and
inspect your unmodified, running program in ways which would not be otherwise
possible. It can for example check that all variables have actually been
assigned before use, that all memory references are within their allowed space,
even for static arrays and arrays on the stack.

What makes Valgrind so extremely powerful is that it will tell exactly where in
the program a problem, error or violation occurred. It will also give you
information on how many allocates/deallocates the program performed, and
whether there is any unreleased memory or memory leaks at program exit. In
fact, it goes even further and will tell you on what line the
unreleased/leaking memory was allocated. The cache profiler will give you
information about cache misses and where they occur.

The biggest downside to Valgrind is that it will make your program run much
slower. How much slower depends on what kind of, and how much, information you
request. Typically the program will run 10-100 times slower under Valgrind.


Checking memory
---------------

As stated earlier, Valgrind is very easy to use; Simply start Valgrind with
the path to the binary program to be tested::

  $ module load valgrind
  $ valgrind /path/to/prog

This runs Valgrind with the default "tool" which is called memcheck, which
checks memory consistency. When run without any extra flags, Valgrind will
produce a balanced, not overly detailed and informative output. If you need a
more detailed (but slower) report, run Valgrind with::

  $ valgrind --leak-check=full --track-origins=yes --show-reachable=yes /path/to/prog

Of course, if you want to get all possible information about where in the
program something was inconsistent you must compile the program with debugging
flags switched on.


Checking threads
----------------

If you have a multi-threaded program (e.g. OpenMP, pthreads), and you are
unsure if there might be possible deadlocks or data races lurking in your
program, the Valgrind thread checker is your best friend. The thread checking
tool is called helgrind::

  $ export OMP_NUM_THREADS=2
  $ valgrind --tool=helgrind /path/to/prog


Further information
-------------------

For more information on using Valgrind please refer to the man pages and the
Valgrind manual which can be found on the Valgrind website:
http://www.valgrind.org
