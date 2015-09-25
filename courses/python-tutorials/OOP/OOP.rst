.. role:: cover

===============================================
:cover:`Introduction to Object-Oriented Python`
===============================================

.. class:: cover

    ::

        Jonas Juselius <jonas.juselius@uit.no>
    
        HPC@UiT

.. raw:: pdf

   Transition Dissolve 1
   SetPageCounter 0
   PageBreak oneColumn

Object-Oriented Programming
---------------------------------------------------------
* In *procedual programming* the focus is on operations applied to data
* In *object-oriented programming* the focus is on the data the operations
  that apply to the data
* OOP *can* provide nice structure to programs and make programs more readable
  and well orgainzed
* The fundamental entity in OOP is the *class*, which provide the stencil
  from which *objects* are created (strings, files, ...)
* Using classes we can easily separate the *interfaces* and the
  *implementation*
* Classes are used to hide the *implementation* details and *data* 
* Classes can be organized in parent-chiled hierarchies, where the children
  inherit properties of their parents

Classes and objects
----------------------------------------------------------
.. literalinclude:: class.py

Class variables
----------------------------------------------------------
.. literalinclude:: class2.py

Class customization
-----------------------------------------------------------
A really cool feature of Python classes is that they can be made to behave
like standard types: E.g. printed, added, assigned, compared, called, etc.

The customization is done using special operator methods, e.g. ``__init__``,
``__str__``. Some other interesting operators are::

    __getitem__(self, key)  # Behave like a list or dict
    __call__(self, ...)     # Call the object like a function
    __eq__(self, other)     # Compare objs using ==
    __add__(self, other)    # Add stuff using +
    __len__(self)           # Respond to len()
    
For a full overview, refer to the chapter on operators_ in the *Python
Language Reference*. 

.. _operators: http://docs.python.org/2/reference/datamodel.html

Inheritance
-----------------------------------------------------------
.. literalinclude:: inherit.py

