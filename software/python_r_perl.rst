.. _python_r_perl:

***************************
Python, R, Matlab and Perl
***************************
Scripting languages often support modules or libraries for additional functionality or convenience functions. We encourage users to install modules locally for only the current user.

Python
=======
You can install many python and non-python packages yourself using 
`conda <https://docs.conda.io/en/latest/>`_ or especially for bioinformatics
software `bioconda <https://bioconda.github.io/>`_.

Conda enables you to easily install complex packages and software.
Creating multiple enviroments enables you to have installations of the 
same software in different versions or incompatible software collections
at once.
You can easily share a list of the installed packages with 
collaborators or colleagues, so they can setup the same
eniviroment in a matter of minutes.

Setup
------
First you load the miniconda module which is like a python and r package
manager.
Conda makes it easy to have multiple environments for example one python2 and
one python3 based parallel to each other without interfering.

Start by removing all preloaded modules which can complicate things. We then
display all installed version and load the newest one (4.6.14)::

  ml purge
  ml avail Miniconda
  ml Miniconda3/4.6.14

To install packages we first have to add the package repository to conda
(we only have to do this once) and set up a new conda environment which we
will call e.g. "python3" where we also specify which python version we want
and which packages should be installed (matplotlib numpy)::

  conda config --add channels defaults
  conda config --add channels conda-forge

  conda create --name python3 python=3 matplotlib numpy

If you want install bioinformatics packages you should also add
the bioconda channel::

  conda config --add channels bioconda

Daily usage
-------------
To load this environment you have to use the following commands either on the
command line or in your job script::

  ml purge
  ml Miniconda3/4.6.14
  conda activate python3

Then you can use all software as usual.

To deactivate the current environment::

  conda deactivate

If you need to install additional software or packages,
we can search for it with::

  conda search SOMESOFTWARE

and install it with::

  conda install -n python3 SOMESOFTWARE
  
If the python package you are looking for is not available in conda
you can use `**pip** <https://pip.pypa.io/en/stable/>`_ like usually
from within a conda environment to install additional python packages::

  pip install SOMEPACKAGE

To update the a single package with conda::

  conda update -n python3 SOMESOFTWARE

or to update all packages::

  conda update -n python3 --all
  
Share your environment
-------------------------
To export a list of all packages/programs installed with conda 
in a certain environment (in this case "python3")::

  conda list --explicit --name python3 > package-list.txt
  
To setup a new environment (let's call it "newpython")
from ab exported package list::

  conda create --name newpython --file package-list.txt


Additional Conda information
-------------------------------
Cheatsheet and built-in help
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
See this `cheatsheet 
<https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf>`_
for an overview over the most important conda commands.

In case you get confused by the conda commands and command line options
you can get help by adding `--help` to any conda command or have a look
at the `conda documentation <https://conda.io/projects/conda/en/latest/user-guide/getting-started.html>`_.

Miniconda vs. Anaconda
^^^^^^^^^^^^^^^^^^^^^^^^^
Both Miniconda and Anaconda are distributions of the conda repository
managment system.
But while Miniconda brings just the managment system (the conda command),
Anaconda comes with a lot of built-in packages.

Both are installed on Stallo but we advise the use of Miniconda.
By explicitly installing packages into your own enviroment the chance
for unwanted effects and errors due to wrong or incomaptible versions is
reduced. Also you can be sure that everything that happens with your setup is
controlled by yourself.

Virtual Environments (deprecated)
-------------------------------------
We recommend using Conda , but there is another way to install modules locally is using
`virtual environments <https://docs.python.org/3/tutorial/venv.html>`_

As an example we install the Biopython package (and here we use
the ``Python/3.6.4-intel-2018a`` module as an example)::

  $ module load Python/3.6.4-intel-2018a
  $ virtualenv venv
  $ source venv/bin/activate
  $ pip install biopython

Next time you log into the machine you have to activate
the virtual environment::

  $ source venv/bin/activate

If you want to leave the virtual environment again, type::

  $ deactivate

And you do not have to call it "venv". It is no problem to have many
virtual environments in your home directory. Each will start as a clean
Python setup which you then can modify. This is also a great system to have
different versions of the same module installed side by side.

If you want to inherit system site packages into your virtual
environment, do this instead::

  $ virtualenv --system-site-packages venv
  $ source venv/bin/activate
  $ pip install biopython



R
======
Load R
--------
Using R on Stallo is quite straightforward.
First check which versions are available::

  ml avail -r '^R/'

To load a version::

  ml R/3.5.0-iomkl-2018a-X11-20180131

Now you can use R from the command line just as you would on your local computer.


Install Packages
-----------------
To install R packages use  ``install.packages()``.
First open the R command line and then install a package e.g. "tidyverse"::
  
  R
  install.packages("tidyverse")

Note: The first time you install new packages, R will ask you
whether it should install these packages into your home folder.
Confirm both questions with ``y`` and then choose a close download mirror



MATLAB
========
Load MATLAB
------------
To use MATLAB simply load the module at the start of your jobscript or type them on
the command line::

  ml purge
  ml avail matlab # To display all installed versions
  ml MATLAB/R2018a-foss-2017a # or any other version you want

Interactice Shell
------------------
On the login nodes you can start a normal MATLAB session with an graphical user interface (GUI). You can use this to visualize and look at data. Just type ``matlab``.

But remember NOT to run calculations on the login nodes as this might slow down the system for all stallo users. If this happens we will kill the process without prior warning.

You can also start an interactive matlab shell on the command line without graphical user interface (headless) with::

  matlab -nodesktop -nodisplay -nosplash

See ``matlab -h`` for all command line options.
If you are on a compute node ``matlab`` always starts a headless matlab shell.

Running MATLAB Scripts
-----------------------
You can run a matlab script by::

  matlab -r -nodisplay -nosplash -r 'run("SCRIPT.m")'

In some instances it might be necessary to use an absolute file path to the script.

Tips
-----
* You can reduce the memory usage by starting matlab without java support, just add ``-nojvm``.
* To get a graphical interface when starting ``matlab`` on a login node, you need to activate X11 forwarding for your ssh connection to stallo.
  If you connect to stallo from a linux machine use ``ssh -X`` to tunnel graphical output to your computer.



Perl
======

We will use Perl 5.28 and use the standard paths.
This follows the general instruction given here: https://metacpan.org/pod/local::lib.

::

  $ module load Perl/5.28.0-GCCcore-7.3.0
  $ mkdir my_perl_installs   # or however you want to call this temporary folder
  $ cd my_perl_installs

  # Check the newest version on metacpan.org and search for local::lib
  $ wget https://cpan.metacpan.org/authors/id/H/HA/HAARG/local-lib-2.000024.tar.gz

  $ tar xzf local-lib-2.000024.tar.gz
  $ cd local-lib-2.000024
  $ perl Makefile.PL --bootstrap
  $ make test
  $ make install
  $ echo 'eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"' >> ~/.bashrc
  $ source ~/.bashrc

Now, the module local::lib is installed and the ``~/.bashrc`` changed such that Perl should now recognize your local folder as module folder.
All future modules will be installed to ``~/perl5``.

If you want to install, for example, the module Math::Vector::Real, just call cpan::

  $ cpan Math::Vector::Real

Remember to load the right Perl version first (``module load ...``).
The first time you call cpan, it will ask you to do some configurations.
Just press enter (let it do its configurations).
