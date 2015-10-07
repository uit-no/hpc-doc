===================================
Working with the Linux command line
===================================

New on Linux systems?
=====================

This page contains some tips on how to get started using the Snowstorm cluster on UiT if you are
not too familiar with Linux / Unix. The information is intended for both users that are new
to Snowstorm and for users that are new to Linux/UNIX-like operating
systems. Please consult the rest of the user guide for information that
is not covered in this chapter.

For details about the hardware and the operating system of stallo, and basic explanation
of linux clusters please see the :ref:`about_stallo` part of this documentation.

To find out more about the storage and file systems on the machines, your disk
quota, how to manage data, and how to transfer file to/from stallo, 
please read the :ref:`storage` section.

ssh
---
The only way to connect to Stallo is by using ssh. Check
the :ref:`login` in this documentation to learn more about ssh.

scp/sftp
--------
The machines are stand-alone systems. The machines do
not (NFS-)mount remote disks. Therefore you must explicitly transfer any
files you wish to use to the machine by ftp. For more info, see :ref:`file_transfer`.

chsh
----
You may want to change the shell that you get by default
(bash). Use the command 'echo $SHELL' to check your current
shell-type and 'chsh' to modify this (if needed). To list all
available shells on Snowstorm use the command 'chsh --list-shells'.
The C shell 'tcsh', the Korn shell 'ksh', and the Bourne-Again shell
'bash' are popular ones.

Running jobs on the machine
---------------------------
You must execute your jobs by
submitting them to the batch system. There is a dedicated
section :ref:`jobs` in our user guide that
explain how to use the batch system. The pages explains how to write job
scripts, and how to submit, manage, and monitor jobs. It is not
allowed to run long or large memory jobs interactively (i.e., directly
from the command line).

Manual pages
------------
If you know the UNIX-command that you would like to
use but not the exact syntax, consult the manual pages on the system to
get a brief overview. Use 'man [command]' for this. For example, to
get the right options to display the contents of a directory, use 'man
ls'. To choose the desired options for showing the current status of
processes, use 'man ps'.

Text editing. Popular tools for editing files on Linux/UNIX-based
systems are 'vi' and 'emacs'. Unfortunately the commands within both
editors are quite cryptic for beginners. It is probably wise to spend
some time understanding the basic editing commands before starting to
program the machine.

vi/vim: 
    Full-screen editor. Use 'man vi' for quick help.
emacs: 
    Comes by default with its own window. Type 'emacs -nw' to
    invoke emacs in the active window. Type 'Control-h i' or follow the
    menu 'Help->manuals->browse-manuals-with-info' for help. 'Control-h
    t' gives a tutorial for beginners.

Environment variables. The following variables are automatically
available after you log in:

::

    USER : your account nameHOME : your home directory (full path)PWD  : your current working directory (full path)

You can use these variables on the command line or in shell scripts by
typing $USER, $HOME, etc. For instance: 'echo $USER'. A complete
listing of the defined variables and their meanings can be obtained by
typing 'printenv  '.

You can define (and redefine) your own variables by typing

::

    setenv [VARIABLE] [VALUE]    (csh/tcsh shellexport [VARIABLE]=[VALUE]    (ksh shell)

Aliases (for csh/tcsh users). If you frequently use a command that
is long and has for example many options to it, you can put an alias
(abbreviation) for it in your ~/.cshrc file. For example, if you
normally prefer a long listing of the contents of a directory with the
command 'ls -laF  | more', you can put the line

::

    alias ll 'ls -laF | more'

in your ~/.cshrc file. You must run 'source ~/.cshrc' to update your
environment and to make the alias effective, or log out and in :-). From
then on, the command 'll' is equivalent to 'ls -laF  | more'.
Make sure that the chosen abbreviation is not already an existing
command, otherwise you may get unexpected (and unwanted) behavior. You
can check the existence and location of a program, script, or alias by
typing

::

    which [command]whereis [command]

~/bin (for csh/tcsh users). If you frequently use a self-made or
self-installed program or script that you use in many different
directories, you can create a directory ~/bin in which you put this
program/script. If that directory does not already exist, you can do the
following. Suppose your favorite little program is called 'takk' and
is in your home ($HOME) directory.

::

    cd $HOMEmkdir bincp takk bin/.setenv PATH $PATH:$HOME/bin

PATH is a colon-separated list of directories that are searched in the
order in which they are specified whenever you type a command. The first
occurrence of a file (executable) in a directory in this PATH variable
that has the same name as the command will be executed (if possible). In
the example above, the 'setenv' command adds the ~/bin directory to
the PATH variable and any executable program/script you put in the
~/bin directory will be recognized as a command. To add the ~/bin
directory permanently to your PATH variable, add the above
'setenv'  command to your ~/.cshrc file and update your environment
with 'source ~/.cshrc'.
Make sure that the names of the programs/scripts are not already
existing commands, otherwise you may get unexpected (and unwanted)
behaviour. You can check the contents of the PATH variable by typing

::

    printenv PATHecho $PATH

More advanced usage .....
-------------------------

git is a version control system, which allows you to keep old
versions of files (usually source code), keep a log of who, when, and
why changes occurred, etc. git helps to manage releases and to control
the concurrent editing of source files among multiple authors. 


.. vim:ft=rst
