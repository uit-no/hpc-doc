

Debugging
=========


Debugging with TotalView
------------------------

TotalView is a graphical, source-level, multiprocess debugger.  It is the
primary debugger on Stallo and has excellent capabilities for debugging
parallel programs.  When using this debugger you need to turn on X-forwarding,
which is done when you login via ssh. This is done by adding the -Y on newer
ssh version, and -X on older::

  $ ssh -Y username@stallo.uit.no

The program you want to debug has to be compiled with the debug option.
This is the "-g" option, on Intel and most compilers. The executable
from this compilation will in the following examples be called
"filename".

First, load the totalview module to get the correct environment
variables set::

  $ module load TotalView

To start debugging run::

  $ totalview MyProg

Which will start a graphical user interface.

Once inside the debugger, if you cannot see any source code, and keep the
source files in a separate directory, add the search path to this directory via
the main menu item File->Search path.

Source lines where it is possible to insert a breakpoint are marked with a box
in the left column. Click on a box to toggle a breakpoint.

Double clicking a function/subroutine name in a source file should open the
source file. You can go back to the previous view by clicking on the left arrow
on the top of the window.

The button "Go" runs the program from the beginning until the first breakpoint.
"Next" and "Step" takes you one line / statement forward.  "Out" will continue
until the end of the current subroutine/function.  "Run to" will continue until
the next breakpoint.

The value of variables can be inspected by right clicking on the name, then
choose "add to expression list". The variable will now be shown in a pop up
window. Scalar variables will be shown with their value, arrays with their
dimensions and type. To see all values in the array, right click on the
variable in the pop up window and choose "dive". You can now scroll through the
list of values. Another useful option is to visualize the array: after choosing
"dive", open the menu item "Tools->Visualize" of the pop up window. If you did
this with a 2D array, use middle button and drag mouse to rotate the surface
that popped up, shift+middle button to pan, Ctrl+middle button to zoom in/out.

Running totalview on an interactive node::

  $ mkdir -p /global/work/$USER/test_dir
  $ cp $HOME/test_dir/a.out /global/work/$USER/test_dir
  $ cd /global/work/$USER/test_dir
  $ module load TotalView
  $ totalview a.out

Replace [#procs] with the core-count for the job.

A window with name "New Program" should pop up. Under "Program" write
the name of the executable. Under "Parallel" choose "Open MPI" and
"Tasks" is the number of cores you are using ([#procs]).

You can also start Totalview with::

  $ mpirun -tv a.out

The users guide and the quick start quide for Totalview can be found
on the `RogueWave documentation page
<http://www.roguewave.com/help-support/documentation/totalview>`_.


Debugging with Valgrind
-----------------------

* A memory error detector
* A thread error detector
* A MPI error detector
* A cache and branch-prediction profiler
* A call-graph generating cache profiler
* A heap profiler
* Very easy to use

Valgrind is the best thing for developers since the invention of pre-sliced
bread!

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

Simply start Valgrind with
the path to the binary program to be tested::

  $ module load Valgrind
  $ valgrind /path/to/prog

This runs Valgrind with the default "tool" which is called memcheck, which
checks memory consistency. When run without any extra flags, Valgrind will
produce a balanced, not overly detailed and informative output. If you need a
more detailed (but slower) report, run Valgrind with::

  $ valgrind --leak-check=full --track-origins=yes --show-reachable=yes /path/to/prog

Of course, if you want to get all possible information about where in the
program something was inconsistent you must compile the program with debugging
flags switched on.

If you have a multi-threaded program (e.g. OpenMP, pthreads), and you are
unsure if there might be possible deadlocks or data races lurking in your
program, the Valgrind thread checker is your best friend. The thread checking
tool is called helgrind::

  $ export OMP_NUM_THREADS=2
  $ valgrind --tool=helgrind /path/to/prog


For more information on using Valgrind please refer to the man pages and the
Valgrind manual which can be found on the Valgrind website:
http://www.valgrind.org
