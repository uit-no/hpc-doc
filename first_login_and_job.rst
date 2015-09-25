---
title: Logging in and running your first job (on Stallo).
...

Install an ssh client.
============================

Linux and Mac users should already have an ssh client installed.  Windows users can use 
`Putty <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`_.  

`Mac ssh intro on google <http://lmgtfy.com/?q=mac+ssh+intro>`_.
`Putty ssh intor on google <http://lmgtfy.com/?q=putty+ssh+intro>`_.

Logging in.
============================

First you connect from your computer with ssh.  Lets assume your username is marve::

    ssh marve@stallo.uit.no
    marve@stallo.uit.no's password: 
    Last login: Fri Jan 24 10:17:38 2014 from roynb.cc.uit.no

                Welcome to stallo.uit.no

    You will find documentation at http://docs.notur.no/uit/
    If you have questions or need help send an email to support-uit@notur.no


    News:
    2014-02-25: Power outage on Friday Feb. 21st

    More news and details at http://docs.notur.no/uit/uit-news/
    Restoring modules to system default
    [marve@stallo-2 ~]$ 
    [marve@stallo-2 ~]$ 

Now you have logged into one of the login-nodes on the system.  These nodes are setup for interactive use and are
not intended for doing heavy work as they are shared between all users that use the system.

Now, lets try to copy a job example to a subcatalog we create, edit it and try to run it::

    [marve@stallo-2 ~]$ mkdir firstjob
    [marve@stallo-2 ~]$ cd firstjob
    [marve@stallo-2 firstjob]$ cp ~marve/tmp/run.sh .
    [marve@stallo-2 firstjob]$ cat run.sh 
    #!/bin/sh 
    #PBS -lnodes=1
    #PBS -lwalltime=01:00:00
    
    echo "Hi, I am $USER running my first job!!!!"
    echo "This job is running on host " $HOSTNAME

All batch jobs are just ordinary shell scripts with directives to the batch system about the resources they need.  The directives
are just shell-script comments and are not executed.  The simple run.sh script can be run interactively also::

    [marve@stallo-2 firstjob]$ sh run.sh
    Hi, I am marve running my first job!!!!
    This job is running on host  stallo-2.local

The run.sh script asks for 1 hour of walltime and one CPU (it completes within a second but that is besides the point here).
When the script finishes the job is done.  More details on batch systems can be found here.

Let us submit the job script to the batch system using the command qsub::

    [marve@stallo-1 firstjob]$ qsub run.sh
    INFO: Project for cpu-time is missing, inserting default project nn9999k into jobscript.
    1983238.stallo-adm.uit.no
    
Here we see a warning about a missing project name to run under, it can be ignored for the time being.  As soon as the job
finishes copies back the result files to the catalog where you submitted the job from::
    
    [marve@stallo-1 firstjob]$ ls
    run.sh  run.sh~  run.sh.e1983238  run.sh.o1983238
    
The file run.sh.e1983238 contains any error messages, the file run.sh.o1983238 contains the ordinary output from the job::
    
    [marve@stallo-1 firstjob]$ cat run.sh.e1983238 
    [marve@stallo-1 firstjob]$ cat run.sh.o1983238 
    Hi, I am marve running my first job!!!!
    This job is running on host  c28-7.local
    [marve@stallo-1 firstjob]$ 
    
As you can see when running under the batch system the run.sh-script is executed on another machine, c28-7.local, than the
machine it was submitted from, stallo-2.local.

This was just an oversimplification of the process of running jobs on a supercomputer.  We recommend you to read further through
the documentation on this site.  We have a lot of detailed information about the batch systems :doc:`here </batch_system>`.

    

    