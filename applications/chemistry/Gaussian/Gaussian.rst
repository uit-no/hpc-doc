.. _gaussian:

===========================
The GAUSSIAN program system
===========================

Gaussian is a computational chemistry software program system initially released in 1970. The name comes from, then groundbreaking, the use of gaussian type basis functions – which later more or less has become the “trade standard”. Gaussian has a rather low user threshold and a tidy user setup, which, together with a broad range of possibilities and a graphical user interface (gaussview), might explain its popularity in academic institutions. 

- For information about the latest Gaussian release, see http://www.gaussian.com/g_prod/g09b.htm.
- For a list of functionality: see http://www.gaussian.com/g_prod/g09_glance.htm
- For information about Gaussian 09 job types, see http://www.gaussian.com/g_tech/g_ur/m_jobtypes.htm

GAUSSIAN on NOTUR installations
================================
 
Currently there are two available main release versions in the NOTUR system; Gaussian 03 and Gaussian 09. Gaussian 09 is the latest in the Gaussian series of programs and Gaussian 03 is its predecessor. For differences between the two, please check the gaussian web page http://www.gaussian.com/g_tech/g_ur/a_gdiffs09.htm.

Generally, we advice users to run the latest version of the software. This rule has some important exceptions: 

#. As a rule of thumb you should always complete a project using the same software as you started with. 
#. If you by experience know that your kind of problem behaves better (runs faster, uses less memory or scales better) on older versions of the program we of course encourage you to run your jobs the more efficient way.


For more information on using Gaussian, please look at the following:
 
.. toctree::
   :maxdepth: 1

   g03.rst
   g09.rst
   gaussview.rst
   input.rst
   water_input.rst
   serial_run.rst
   para_run.rst


LINKS
======
Software home-page: http://www.gaussian.com/

Technical support from software vendor: http://www.gaussian.com/g_email/em_help.htm 

Technical support for Stallo: support-uit@notur.no

.. :vim:ft=rst
