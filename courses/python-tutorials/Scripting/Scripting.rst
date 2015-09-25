.. role:: cover

==================================
:cover:`Writing Python scripts`
==================================

.. class:: cover

    ::

        Jonas Juselius <jonas.juselius@uit.no>
    
        HPC@UiT

.. raw:: pdf

   SetPageCounter 0
   Transition Dissolve 1
   PageBreak oneColumn

Writing scripts
---------------------------------------------------------
Instead of working inside the Python interpreter, we can write scripts using
our favorite editor (e.g. PyCharm) and save them. We can then execute the
scripts when we need them: 

.. code-block:: console

    $ python elderberry.py

Under UNIX we can make the scripts executable by adding a *shebang* to the
first line in the of the script, and then change the file mode:

.. code-block:: console

    $ sed -i '1i #!/usr/bin/env python' elderberry.py
    $ chmod a+x elderberry.py


    #!/usr/bin/env python
    def hamster(): print('Your mother was a hamster.')

On Windows you don't have to do anything special, since the Python installer
registers file with a ``.py`` ending as Python programs.

Organizing your code: modules 
---------------------------------------------------------
When you organize your work in files, these files become Python modules if
they are in your ``PYTHONPATH``:

.. code-block:: pycon

    >>> import elderberry as eb
    >>> eb.hamster()

Organizing your code: packages
---------------------------------------------------------
Packages are a way of structuring Python’s module namespace by using *dotted
module names*::

    cheese/                     Top-level package
        __init__.py             Initialize the sound package
        swiss/                  Subpackage for swiss chees
            __init__.py
            emmental.py
            gruyere.py
        dutch/                  Subpackage for dutch cheese
            __init__.py
            gouda.py
            maasdam.py

Organizing your code: importing packages
---------------------------------------------------------
.. literalinclude:: maasdam.py
    
Module search paths
----------------------------------------------------------

How and where Python looks for available modules can be configured using the
``PYTHONPATH`` environment variable:

.. code-block:: console

    $ export PYTHONPATH=$PYTHONPATH:/path/to/my/stuff
    $ python elderberry.py

The search path can also be configured in Python:

.. code-block:: python

    import sys
    sys.path.append('/path/to/my/stuff')
    print(sys.path)

Some important built-in functions
----------------------------------------------------------
::

    abs(x)          # Return absolute values of x
    all(list)       # True if all elements are True
    any(list)       # True if any element is True
    cmp(a, b)       # Compare a and b
    dir()           # Return a list of "members"
    eval(str)       # Evaluate a string as a Python experssion
    filter(f, list) # Return elements for which f evaluates true
    map(f, list)    # Apply f to every element in list
    max(), min()    # Minimum and maximum of values
    pow(x, y)       # x^y
    reduce(f, list) # Reduce list with f
    str(o)          # Generate a string from an object
    sum(list)       # Sum all elements

The standard library
----------------------------------------------------------
.. literalinclude:: pysys.py

.. literalinclude:: pyos.py

The standard library: Math
----------------------------------------------------------
.. literalinclude:: pymath.py

The standard library: Compression
----------------------------------------------------------
.. literalinclude:: pyzlib.py

The standard library: A web server
----------------------------------------------------------
.. literalinclude:: httpd.py

The standard library: Input from urls
----------------------------------------------------------
.. literalinclude:: urls.py

The standard library: Sending mail
----------------------------------------------------------
.. literalinclude:: smtp.py

Functional programming 
---------------------------------------------------------
.. literalinclude:: functional.py

Coding style (`PEP 8`_)
----------------------------------------------------------
* Use 4-space indentation, and no tabs.
* Wrap lines so that they don’t exceed 79 characters.
* Use blank lines to separate functions and classes, and larger blocks of code
  inside functions.
* When possible, put comments on a line of their own.
* Use docstrings.
* Use spaces around operators and after commas, but not directly inside
  bracketing constructs: a = f(1, 2) + g(3, 4).
* Name your classes and functions consistently; the convention is to use
  CamelCase for classes and lower_case_with_underscores for functions and
  methods. Always use self as the name for the first method argument 
* Don’t use fancy encodings if your code is meant to be used in international
  environments. Plain ASCII works best in any case.

The Zen of (Python) programing
----------------------------------------------------------
:: 

    $ python -c "import this"

#.   Beautiful is better than ugly.
#.   Explicit is better than implicit.
#.   Simple is better than complex.
#.   Complex is better than complicated.
#.   Flat is better than nested.
#.   Sparse is better than dense.
#.   Readability counts.
#.   Special cases aren't special enough to break the rules.
#.   Although practicality beats purity.

The Zen of (Python) programing
----------------------------------------------------------
10.   Errors should never pass silently.
#.   Unless explicitly silenced.
#.   In the face of ambiguity, refuse the temptation to guess.
#.   There should be one-- and preferably only one --obvious way to do it.
#.   Although that way may not be obvious at first unless you're Dutch.
#.   Now is better than never.
#.   Although never is often better than *right* now.
#.   If the implementation is hard to explain, it's a bad idea.
#.   If the implementation is easy to explain, it may be a good idea.
#.   Namespaces are one honking great idea -- let's do more of those!

.. _`PEP 8`: http://www.python.org/dev/peps/pep-0008/
