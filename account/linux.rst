.. _linux:

==================
Linux command line
==================


New on Linux systems?
=====================

This page contains some tips on how to get started using the Stallo cluster on
UiT if you are not too familiar with Linux/ Unix. The information is intended
for both users that are new to Stallo and for users that are new to
Linux/UNIX-like operating systems. Please consult the rest of the user guide
for information that is not covered in this chapter.

For details about the hardware and the operating system of stallo, and basic
explanation of Linux clusters please see the :ref:`about_stallo` part of this
documentation.

To find out more about the storage and file systems on the machines, your disk
quota, how to manage data, and how to transfer file to/from Stallo, please read
the :ref:`file_transfer` section.


ssh
---

The only way to connect to Stallo is by using ssh. Check
the :ref:`login` in this documentation to learn more about ssh.


scp
---

The machines are stand-alone systems. The machines do not (NFS-)mount remote
disks. Therefore you must explicitly transfer any files you wish to use to the
machine by scp. For more info, see :ref:`file_transfer`.


Running jobs on the machine
---------------------------

You must execute your jobs by submitting them to the batch system. There is a
dedicated section :doc:`/jobs/batch` in our user guide that explain how to use the
batch system. The pages explains how to write job scripts, and how to submit,
manage, and monitor jobs. It is not allowed to run long or large memory jobs
interactively (i.e., directly from the command line).


Common commands
---------------

pwd
    Provides the full pathname of the directory you are currently in.
cd
    Change the current working directory.
ls
    List the files and directories which are located in the directory you are currently in.
find
    Searches through one or more directory trees of a file system, locates files based on some user-specified
    criteria and applies a user-specified action on each matched file. e.g.::

       find . -name 'my*' -type f

    The above command searches in the current directory (.) and below it, for files and directories with names starting with my.
    "-type f" limits the results of the above search to only regular files, therefore excluding directories,
    special files, pipes, symbolic links, etc. my* is enclosed in single quotes (apostrophes) as otherwise the
    shell would replace it with the list of files in the current directory starting with "my".
grep
    Find a certain expression in one or more files, e.g::

      grep apple fruitlist.txt

mkdir
    Create new directory.
rm
    Remove a file. Use with caution.
rmdir
    Remove a directory. Use with caution.
mv
    Move or rename a file or directory.
vi/vim or emacs
    Edit text files, see below.
less/ more
    View (but do not change) the contents of a text file one screen at a time, or, when combined with other commands (see below)
    view the result of the command one screen at a time. Useful if a command prints several screens of information on
    your screen so quickly, that you don't manage to read the first lines before they are gone.
\|
    Called "pipe" or "vertical bar" in English. Group 2 or more commands together, e.g.::

      ls -l | grep key | less

    This will list files in the current directory (ls), retain only the lines of *ls* output containing the string "key" (grep),
    and view the result in a scrolling page (less).


More info on manual pages
-------------------------

If you know the UNIX-command that you would like to
use but not the exact syntax, consult the manual pages on the system to
get a brief overview. Use 'man [command]' for this. For example, to
get the right options to display the contents of a directory, use 'man
ls'. To choose the desired options for showing the current status of
processes, use 'man ps'.


Text editing
------------

Popular tools for editing files on Linux/UNIX-based
systems are 'vi' and 'emacs'. Unfortunately the commands within both
editors are quite cryptic for beginners. It is probably wise to spend
some time understanding the basic editing commands before starting to
program the machine.

vi/vim
    Full-screen editor. Use 'man vi' for quick help.
emacs
    Comes by default with its own window. Type 'emacs -nw' to
    invoke emacs in the active window. Type 'Control-h i' or follow the
    menu 'Help->manuals->browse-manuals-with-info' for help. 'Control-h
    t' gives a tutorial for beginners.


Environment variables
---------------------

The following variables are automatically available after you log in::

  $USER     your account name
  $HOME     your home directory
  $PWD      your current directory

You can use these variables on the command line or in shell scripts by
typing $USER, $HOME, etc. For instance: 'echo $USER'. A complete
listing of the defined variables and their meanings can be obtained by
typing 'printenv  '.

You can define (and redefine) your own variables by typing::

  export VARIABLE=VALUE


Aliases
-------

If you frequently use a command that
is long and has for example many options to it, you can put an alias
(abbreviation) for it in your ``~/.bashrc`` file. For example, if you
normally prefer a long listing of the contents of a directory with the
command 'ls -laF  | more', you can put following line in your ``~/.bashrc`` file::

  alias ll='ls -laF | more'

You must run 'source ~/.bashrc' to update your
environment and to make the alias effective, or log out and in :-). From
then on, the command 'll' is equivalent to 'ls -laF  | more'.
Make sure that the chosen abbreviation is not already an existing
command, otherwise you may get unexpected (and unwanted) behavior. You
can check the existence and location of a program, script, or alias by
typing::

  which [command]
  whereis [command]


~/bin
-----

If you frequently use a self-made or self-installed program or script that you
use in many different directories, you can create a directory ~/bin in which
you put this program/script. If that directory does not already exist, you can
do the following. Suppose your favorite little program is called 'myscript' and is
in your home ($HOME) directory::

  mkdir -p $HOME/bin
  cp myscript $HOME/bin
  export PATH=$PATH:$HOME/bin

PATH is a colon-separated list of directories that are searched in the
order in which they are specified whenever you type a command. The first
occurrence of a file (executable) in a directory in this PATH variable
that has the same name as the command will be executed (if possible). In
the example above, the 'export' command adds the ~/bin directory to
the PATH variable and any executable program/script you put in the
~/bin directory will be recognized as a command. To add the ~/bin
directory permanently to your PATH variable, add the above
'export' command to your ~/.bashrc file and update your environment
with 'source ~/.bashrc'.

Make sure that the names of the programs/scripts are not already
existing commands, otherwise you may get unexpected (and unwanted)
behaviour. You can check the contents of the PATH variable by typing::

  printenv PATH
  echo $PATH
