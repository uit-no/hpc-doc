.. role:: cover

==================================
:cover:`Introduction to Python`
==================================

.. class:: cover

    ::

        Jonas Juselius <jonas.juselius@uit.no>
    
        HPC@UiT

.. raw:: pdf

   SetPageCounter 0
   Transition Dissolve 1
   PageBreak oneColumn

About Python
----------------------------------------------------------

* Python is simple to use, but it is a real programming language.
* Python enables programs to be written compactly and readably. 
* Python comes with a large collection of standard modules.
* Python is an interpreted language.
* Python allows you to split your program into modules that can be reused in
  other Python programs.
* Python is extensible
* Python is just the language for you.
* Python is just great!

.. raw:: pdf

   PageBreak 
   Transition Dissolve 0

Using the Python interpreter
----------------------------------------------------------
The default Python interpreter is called ``python``. It is used to run
scripts and for simple interactive work:

.. code-block:: bash

    $ python
    Python 2.7.3 (default, Sep 26 2012, 21:51:14) 
    >>> 1 + 2
    3
    >>> ^D
    $

Using the iPython interpreter
----------------------------------------------------------
For interactive work, iPython (``ipython``) provides a more elaborate
interface with many enhancements:

.. code-block:: bash

    $ ipython 
    IPython 0.13.1.rc2 -- An enhanced Interactive Python.

    In [1]: "Hello" + " " + "World!"
    Out[1]: 'Hello World!'

    In [2]: ^D
    Do you really want to exit ([y]/n)? y
    $

The iPython web notebook
----------------------------------------------------------

iPython also comes with an incredibly cool interactive web notebook:

.. code-block:: bash

    $ ipython notebook
    [NotebookApp] The IPython Notebook is running at: http://127.0.0.1:8888/
    [NotebookApp] Use Control-C to stop this server and shut down all kernels.
    Created new window in existing browser session.

The notebook allows you to use work cells, save and load files, plot
functions, much like in Matlab or Mathematica. 

You can drag and drop Python files on disk straight into the notebook and
execute the file.

Numbers 
----------------------------------------------------------
.. literalinclude:: nums.py

Variables 
----------------------------------------------------------
.. literalinclude:: vars.py

Strings 
----------------------------------------------------------
.. literalinclude:: strings.py

String operations
----------------------------------------------------------
.. literalinclude:: string_ops.py

String methods
----------------------------------------------------------
.. literalinclude:: string_methods.py

Lists 
----------------------------------------------------------
.. literalinclude:: lists.py

Flow control
----------------------------------------------------------
.. literalinclude:: ifelse.py

Repeating things
----------------------------------------------------------
.. literalinclude:: while.py

The ``for`` loop
----------------------------------------------------------
.. literalinclude:: for.py

Tuples and sets
----------------------------------------------------------
.. literalinclude:: tuples.py

Dictionaries  
----------------------------------------------------------
Dictionaries are powerful data containers. They behave like an
unordered set of ``key:value`` pairs, with the requirement that the keys are
unique.

.. literalinclude:: dicts.py

Looping techniques
----------------------------------------------------------
.. literalinclude:: looptricks.py

Function definition
----------------------------------------------------------
.. literalinclude:: funcdef.py

Function definition
----------------------------------------------------------
.. literalinclude:: funcdef2.py

Function definition
----------------------------------------------------------
.. literalinclude:: funcdef3.py

Recursive functions
----------------------------------------------------------
.. literalinclude:: recursion.py

Zen of functions
----------------------------------------------------------
* Functions should be short. 
* Functions should do only one thing, and do it well.
* Functions should have a docstring.
* Document *what* a function does, not *how* it does it.

Input and output
----------------------------------------------------------

.. literalinclude:: writefile.py

Input and output
----------------------------------------------------------
.. literalinclude:: readfile.py

Pickling
----------------------------------------------------------
Python can save more than just numbers and text: It can store whole objects!
This is known as *pickling* or *serializing* objects.

.. literalinclude:: pickles.py

Shelving
----------------------------------------------------------
Shelving is a form of pickling, where the objects are stored in a
*persistent* dictionary on disk:

.. literalinclude:: shelf.py

Modules and namespaces
----------------------------------------------------------
.. literalinclude:: import.py

Getting help
----------------------------------------------------------
In iPython:

.. code-block:: pycon
    
    >>> dir?
    >>> dir()             # dir() is a Python builtin function
    >>> dir(__builtin__)
    >>> dir("foo")
    >>> dir(42)

Using ``pydoc``:

.. code-block:: console

    $ pydoc dir
    $ pydoc -p 8080
    pydoc server ready at http://localhost:8080/

| Least but not last: 
|   http://docs.python.org
|   http://google.com 

