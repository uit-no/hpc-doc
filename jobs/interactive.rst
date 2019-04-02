

Interactive jobs
================

You can run an interactive job like this::

  $ srun --nodes=1 --ntasks-per-node=1 --time=01:00:00 --pty bash -i

Here we ask for a single core on one interactive node for one hour with the
default amount of memory. The command prompt will appear as soon as
the job starts.

This is how it looks once the interactive job starts::

  srun: job 12345 queued and waiting for resources
  srun: job 12345 has been allocated resources

Exit the bash shell to end the job. If you exceed the time or memory
limits the job will also abort.

Interactive jobs have the same policies as normal batch jobs, there
are no extra restrictions. You should be aware that you might be
sharing the node with other users, so play nice.

Some users have experienced problems with the command, then it has helped to specify the cpu account::

  $ srun --account=<NAME_OF_MY_ACCOUNT> --nodes=1 --ntasks-per-node=1 --time=01:00:00 --pty bash -i 
  
  
