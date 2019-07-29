.. _getting_started:

===============
Getting started
===============

Here you will get the basics to work with Stallo. Please study carefully the links at the end of each paragraph to get more detailed information.

Get an account
--------------

If you are associated with UiT The Arctic University of Norway, you may apply locally. :doc:`/account/uitquota`

You can also apply for an account for Stallo or any of the other Norwegian computer clusters at the `Metacenter account application <https:/www.metacenter.no/user/application/form/notur/>`_. This is also possible if you already have a local account. :doc:`/account/account`

Change temporary password
-------------------------

The password you got by SMS  has to be changed on `MAS <https://www.metacenter.no/user/login/?next=/user/password/>`_ within  one week, or else the loginaccount will be closed again - and you need to contact us for reopening.
You can't use the temporary password for logging in to Stallo.

Connect to Stallo
-----------------

You may connect to Stallo via *SSH* to ``stallo.uit.no``. This means that on Linux and OSX you may directly connect by opening a terminal and writing ``ssh username@stallo.uit.no``. From Windows, you may connect via PuTTY which is available in the Software Center. X-forwarding for graphical applications is possible. There exists also a webinterface to allow easy graphical login. Please see the following link for details to all mentioned methods. :doc:`/account/login`

On nodes and files
------------------

When you login, you will be on a login node. Do *not* run any long-lasting programs here. The login node shall only be used for job preparation (see below) and simple file operations.

You will also be in your home directory ``/home/username``. Here, you have 300 GB at your disposal that will be backed up regularly. For actual work, please use the global work area at ``/global/work/username``. This space is not backed up, but it has a good performance and is 1000 TB in size. Please remove old files regularly. :doc:`/storage/storage`

To move files from your computer to Stallo or vice versa, you may use any tool that works with *ssh*. On Linux and OSX, these are scp, rsync, or similar programs. On Windows, you may use WinSCP. :doc:`/storage/file_transfer`

Run a program
-------------

There are many programs pre-installed. You may get a list of all programs by typing ``module avail``. You can also search within that list. ``module avail blast`` will search for Blast (case-insensitive). When you found your program of choice, you may load it using ``module load BLAST+/2.7.1-intel-2017b-Python-2.7.14``. All program files will now be available, i.e. you can now simply call ``blastp -version`` to run Blast and check the loaded version. You can also compile your own software, if necessary. :doc:`/software/modules`

To eventually run the program, you have to write a job script. In this script, you can define how long the job (i.e. the program) will run and how much memory and compute cores it needs. For the actual computation, you need to learn at least the basics of Linux shell scripting. You can learn some basics here: :doc:`/account/linux`.

When you wrote the job script, you can start it with ``sbatch jobscript.sh``. This will put the script in the queue, where it will wait until an appropriate compute node is available. You can see the status of your job with ``squeue -u username``. :doc:`/jobs/batch` and :doc:`/jobs/examples`

Every job that gets started will be charged to your quota. Your quota is calculated in hours of CPU time and is connected to your specific project. To see the status of your quota account(s), type ``cost`` :doc:`/account/accounting`

Get help
--------

Do you need help with Stallo? Write us an email to support@metacenter.no. You can also request new software (either an update or entirely new software), suggest changes to this documentation, or send us any other suggestions or issues concerning Stallo to that email address. Please also read the rest of this documentation.

Happy researching!
