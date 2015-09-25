---
toc: no
title: Debugging
...

Debugging tools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Totalview is the recommended tool for debugging parallel applications.
gdb can also be used for serial codes.

 See also
`Valgrind <http://docs.notur.no/uit/stallo_documentation/user_guide/using-valgrind-to-debug-verify-and-optimize-your-code>`_
or Intel flags for debugging alternatives.

 

totalview
---------

 

TotalView is a graphical, source-level, multiprocess debugger. When
using this debugger you need to turn on X-forwarding, which is done when
you login via ssh. This is done by adding the -Y on newer ssh version,
and -X on older.

::

    ssh -Y username@stallo.uit.no

The program you want to debug has to be compiled with the debug option.
This is the "-g" option, on Intel and most compilers. The executable
from this compilation will in the following examples be called
"filename".

First, load the totalview module to get the correct environment
variables set:

::

    module load totalview

To start debugging run:

::

    totalview MyProg

Which will start a graphical user interface.

Once inside the debugger, if you cannot see any source code, and keep
the source files in a separate directory, add the search path to this
directory via the main menu item File->Search path.

Source lines where it is possible to insert a breakpoint are marked with
a box in the left column. Click on a box to toggle a breakpoint.

Double clicking a function/subroutine name in a source file should open
the sourcefile. You can go back to the previous view by clicking on the
left arrow on the top of the window.


The button "Go" runs the program from the beginning until the first
breakpoint. "Next" and "Step" takes you one line / statement forward.
"Out" will continue until the end of the current subroutine/function.
"Run to" will continue until the next breakpoint.

The value of variables can be inspected by right clicking on the name,
then choose "add to expression list". The variable will now be shown in
a pop up window. Scalar variables will be shown with their value, arrays
with their dimensions and type. To see all values in the array, right
click on the variable in the pop up window and choose "dive". You can
now scroll through the list of values. Another useful option is to
visualize the array: after choosing "dive", open the menu item
"Tools->Visualize" of the pop up window. If you did this with a 2D
array, use middle button and drag mouse to rotate the surface that
popped up, shift+middle button to pan, Ctrl+middle button to zoom
in/out.



Running totalview inside the batch system (compute nodes)

::

    qsub -I -lnodes=[#procs] -lwalltime=[time] -A [account] -q express -X
    mkdir -p /global/work/$USER/test_dir
    cp $HOME/test_dir/a.out /global/work/$USER/test_dir
    cd /global/work/$USER/test_dir
    module load totalview
    totalview a.out

Replace [#procs] with the core-count for the job.

A window with name "New Program" should pop up. Under "Program" write
the name of the executable. Under "Parallel" choose "Open MPI" and
"Tasks" is the number of cores you are using ([#procs]).

 

You can also start totalview with:

::

    mpirun -tv a.out

 

The users guide for totalview can be found
`here <http://www.totalviewtech.com/Documentation/latest/pdf/user_guide.pdf>`_.

 

gdb
---

 

gdb can be used for serial codes.

 

`http://www.gnu.org/software/gdb/ <http://www.gnu.org/software/gdb>`_

valgrind
--------

Intel Inspector XE
------------------
 
.. vim:ft=rst
