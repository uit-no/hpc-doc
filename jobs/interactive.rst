.. _interactive:

Interactive jobs
================

Starting an interactive job
---------------------------
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
  
  

Keeping interactive jobs alive
------------------------------
Interactive jobs die when you disconnect from the login node either by choice or by
internet connection problems. To keep a job alive you can use a terminal multiplexer
like ``tmux``.

tmux allows you to run processes as usual in your standard bash shell 

You start tmux on the login node before you get a interactive slurm session with
``srun`` and then do all the work in it. In case of a disconnect you simply reconnect 
to the login node and attach to the tmux session again by typing::

  tmux attach

or in case you have multiple sessions running::

  tmux list-session
  tmux attach -t SESSION_NUMBER

As long as the tmux session is not closed or terminated (e.g. by a server restart) your 
session should continue. One problem with our systems is that the tmux session is bound 
to the particular login server you get connected to. So if you start a tmux session on 
stallo-1 and next time you get randomly connected to stallo-2 you first have to connect
to stallo-1 again by::

  ssh login-1

To log out a tmux session without closing it you have to press CTRL-B (that the Ctrl key 
and simultaneously "b", which is the standard tmux prefix) and then "d" (without the
quotation marks). To close a session just close the bash session with either CTRL-D or
type exit. You can get a list of all tmux commands by CTRL-B and the ? (question mark).
See also `this page <https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/>`_
for a short tutorial of tmux.
Otherwise working inside of a tmux session is almost the same as a normal bash session.
