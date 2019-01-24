.. _local_script_modules:

Local script modules
====================

Scripting languages often support modules or libraries for additional functionality or convenience functions. We encourage users to install modules locally for only the current user.


Python
------

For Python, the recommended way to install modules locally is using
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


Perl
----

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
