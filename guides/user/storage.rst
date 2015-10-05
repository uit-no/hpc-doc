
=======================================================
Working on stallo (storage, back-ups, file systems,...) 
=======================================================

Available file system
=====================

Stallo has a "three folded" file system:

* global accessible home area (user area):            /home        (  64 TB)
* global accessible work / scratch area:              /global/work (1000 TB)
* local  accessible work / scratch area on each node: /local/work  (~450 GB)  

File system
===========

Home area
---------

The file system for user home directories on stallo. It is a 64 TB global file system, which is
accessible from both the login nodes and all the compute nodes. The
default size of the home directory's for each user is 300 GB. If more
space is needed for permanent storage users have to apply for it. Please
contact the system administrators,
:doc:`support-uit@notur.no <mailto:support-uit@notur.no>`, for more
information about this.

The home area is for "permanent" storage only, so please do not
use it for temporary storage during production runs.
Jobs using the home area for scratch files while running may be killed
without any warning.


Work / scratch areas
--------------------

There are two different work / scratch areas available on Stallo:

*  There are an 1000 TB global accessible work area on the cluster.
   This is accessible from both the login nodes and all the compute
   nodes as /global/work. *This is the recommended work area, both
   because of size and performance!* Users can stripe files themselves as this file system is a Lustre file system.
*  In addition, each compute node has a small work area of approximately
    450 GB, only locally accessible on each node. This area is
   accessible as /local/work on each compute node. In general we do
   not  recommend to use /local/work, both because of (the lack of)
   size and performance, however for some users this may be the best
   alternative.

These work areas should be used for all jobs running on Stallo.

After a job has finished old files should be deleted, this is to
ensure that there are plenty of available space for new jobs. Files left
on the work areas after a job has finished may be removed without any
warning.

There are no backup of files stored on the work areas.
If you need permanent storage of large amounts of data, please
contact the system administrators:
:doc:`support-uit@notur.no <mailto:support-uit@notur.no>`

Disk quota and accounting
-------------------------

Each user has the default size of the home directory 300 GB. If more
space is needed for permanent storage, users have to apply for it. Please
contact the system administrators,
:doc:`support-uit@notur.no <mailto:support-uit@notur.no>`, for more
information about this.
Disk quota is not supported on work/scratch areas. Please use common courtesy and
keep your work /scratch partitions clean. Move all files you do not need on stallo
elsewhere or delete them. Since overfilled work/scratch partitions can cause problems, files older than 14 days are subject for
deletion without any notice.

What area to use for what data
------------------------------

/home should be used for storing tools, like application sources,
scripts, or any relevant data which must have a backup.

/work/ should be used for running jobs, as a main storage during data
processing. All data after processing must be moved out of the machine
or deleted after use.

Policies for deletion of temporary data
---------------------------------------

/global/work/ has no backup and, file older than 14 days are subject for
deletion without any notice. /local/work/ has no backup and, files
belonging to users other than the one that runs a job on the node will
be deleted.

Since this deletion process (as well as the high disk usage percent)
will take away disk-performance from the running jobs - the best
solution is of course for you to remember to clean up after each job.


Backup
------

There is no real backup of the data on stallo. However we do keep daily snapshots of
/home and /project for the last 7 days. The /home snapshots are kept at
/global/hds/.snapshot/


There are no backup of files stored on the /work areas.
If you need permanent storage of large amounts of data, or if you need to restore some lost data, please
contact the system administrators:
:doc:`support-uit@notur.no <mailto:support-uit@notur.no>`

Archiving data
--------------

Archiving is not provided. However you may apply for archive space on
`Norstore <http://www.norstore.no/>`_.

Closing of user account
-----------------------

User account's on stallo are closed on request from Uninett Sigma or the
project leader. The account is closed in a way so that the user no
longer can log in to stallo.

If the user has data needed by other people in the group all
data on /home/ is preserved.


Privacy of user data
--------------------

General privacy

There is a couple of things you as a user, can do to minimize the risk
of your data and account on stallo being read/accessed from the outside
world.

#. Your account on stallo is personal, do not give away your password to
   anyone, not even the HPC staff.
#. If you have configured ssh-keys on your local computer, do not use
   password less keys for accessing stallo.

What you can do to to prevent other users on stallo to access your
files

By default a new account on stallo is readable for everyone on the
system. That is both /home/ and /global/work/

This can easily be change by the user using the command chmod The chmod
have a lot "cryptic" combinations of options (`click here for a more in
depth explanation <http://en.wikipedia.org/wiki/Chmod>`_ ). the most
commonly used is:

*  only user can read her home directory::
       chmod 700 /home/$USER
*  User and its group can read and execute files on the home
   directory::
       chmod 750 /home/$USER
*  User and all others including the group can read and exeute the
   files::
       chmod 755 /home/$USER
*  everybody can read execute and WRITE to directory::
       chmod 777 /home/$USER


Management of data
==================

Management of lage files (> 200GB )
-----------------------------------

Some special care needs to be taken if you want to create very large
files on the system. With large we mean filesizes over 200GB or so.

Storage architecture.
^^^^^^^^^^^^^^^^^^^^^

The /global/work file system (and /global/home too) is served by a
number of storage arrays that each contain smaller pieces of the file
system, the size of the chunks are 2TB (2000GB) each. In the default
setup each file is contained within one storage array so the default
filesize limit is thus 2TB. In practice the file limit is considerably
smaller as each array contains a lot of files.

Increasing the file size limitation by striping.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each user can change the default placement of the files it creates by
striping files over several storage arrays. This is done with the
following command:

::

    lfs setstripe -c 4 .

after this has been done all new files created in the current directory
will be spread over 4 storage arrays each having 1/4th of the file. The
file can be accessed as normal no special action need to be taken. When
the striping is set this way it will be defined on a per directory basis
so different dirs can have different stripe setups in the same file
system, new subdirs will inherit the striping from its parent at the
time of creation.

Stripe count recommendation.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We recommend users to set the stripe count so that each chunk will be
approx. 200-300GB each, for example

============ =================== =============================
File size       Stripe count         Command
============ =================== =============================
500-1000GB     4                  ``lfs setstripe -c 4 .``
1TB - 2TB      8                  ``lfs setstripe -c 8 .``
============ =================== =============================

Changing stripe count for files.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once a file is created the stripe count cannot be changed. This is
because the physical bits of the data already are written to a certain
subset of the storage arrays. However the following trick can used after
one has changed the striping as described above:

::

    # mv file file.bu
    # cp -a file.bu file
    # rm file.bu

The use of ``-a`` flag ensures that all permissions etc are preserved.

Management of many small files ( > 10000)
-----------------------------------------

The file system on stallo is designed to give good performance for large
files. This have some impact if you have many small files.

If you have thousands of files in one directory. Basic operations like
'ls' becomes very slow, there is nothing to do about this. However
directories containing many files may cause the backup of the data to
fail. It is therefore highly recommended that if you want backup of the
files you need to use 'tar' to create on archive file of the directory.

Compression of data
-------------------

Infrequently accessed files must be compressed to reduce file system
usage.

Tools like gzip, bzip2 and zip are in the PATH and are available on all
nodes. The manual page for these tools are very detailed, use them for
further help:

::

    man gzip

Binary data (endianness, ...)
-----------------------------

Stallo is like all desktop PC's a little endian computer.

At the moment in NOTUR the only Big endian machine is njord.hpc.ntnu.no
so Fortran sequential unformatted files create on njord cannot be read
on stallo.

The best work around for this is to save your file in a portable file
format like `netCDF <http://www.unidata.ucar.edu/software/netcdf/>`_ or
`HDF5 <http://www.hdfgroup.org/>`_.

Both format's are supported on stallo, but you have to load its modules
to use them:

::

    module load netcdf
    or
    module load hdf5


Transferring data to/from stallo using ftp.
===========================================

The ssh protocol (or rather the openssh implementation) has some
limitations that becomes noticeable on long haul data transfers on
high-speed networks like the one we have between the sites in Norway.
The ftp protocol does not have these limitations and gives superior
performance (10X over scp/sftp) when moving data to/from stallo from the
other sites in Norway.


The basics
----------

You need an ftp client that supports encrypted authentication.

Please note that it is only the authentication that is encrypted, the
data you copy will flow unencrypted over the network so do not copy any
sensitive information using ftp.

Also note that ftp-access is only available from the university networks
in Norway.

Here is a list of ftp clients that is reported to work with encrypted
authentication:

========== =================== ========= ===================
Name        OS                  TYPE      Support encryption
========== =================== ========= ===================
lftp        linux/unix          CLI        YES
gftp        linux/unix          Graphical  YES
kasablanca  linux/unix          Graphical  YES
FileZilla   Windows/MacOs/UNIX  Graphical  YES
========== =================== ========= ===================

CLI: Command Line Interface

Clients that most probably will not work: the std. ftp client on your
system, that is, the one you get when you use the command ``ftp``,
``ncftp`` also seems to have problems.

How to connect
--------------

The hostname of the ftp server is ``stallo-wgw.uit.no`` (this will
change to stallo-ftp.uit.no soon).

Example using lftp on linux:

::

    > lftp userA@stallo-wgw.uit.no
    lftp userA@stallo-wgw.uit.no:~> ls
        ........ file listing .........
    lftp userA@stallo-wgw.uit.no:~> get a-file-on-the-system
    84291584 bytes transferred in 3 seconds (28.98M/s)

Problems
--------

We seem to have some problems with the openssl library that takes care
of the encryption, newer versions seems to work better but we cannot
change the library without recompiling a lot of other stuff so we have
to live with it until we upgrade stallo this fall.

The problem gives the following error message when transferring a file
using lftp:

::

    lftp userA@stallo-wgw.uit.no:~> get filename
    get: Fatal error: SSL_read: wrong version number
    lftp userA@stallo-wgw.uit.no:~> get filename
    84291584 bytes transferred in 3 seconds (29.00M/s)

As one sees, just retrying fixes the problem(??).


Transferring files to/from Stallo
=================================

About file transfer to/from Stallo

All Notur systems are stand-alone systems, and in general we do not
(NFS-)mount remote disks on them. Therefore you must either explicitly
transfer any files you wish to use by using either sftp  or scp, or
you can `mount your home directory('s) 
<http://docs.notur.no/metacenter/metacenter-documentation/metacenter_user_guide/mounting_disks_on_notur_systems>`_ on the Notur systems on you own computer. To learn more about file transfer, check out the `Metasenter page on file transfer 
<http://docs.notur.no/metacenter/metacenter-documentation/metacenter_user_guide/transfering-files-to-from-snowstorm>`_ .



Transferring data to/from the system
------------------------------------

Only ssh type of access is open to stallo. Therefore to upload or
download data only scp and sftp can be used.

To transfer data to and from hexagon use the following address:

::

    stallo.uit.no

This address has nodes with 10Gb network interfaces.

Basic tools (scp, sftp)

Standard scp command and sftp clients can be used:

::

    ssh stallo.uit.no
    ssh -l <username> stallo.uit.no

    sftp stallo.uit.no
    sftp <username>@stallo.uit.no

mounting the file system on you local machine using sshfs:

::

    for linux users:
    sshfs [user@]stallo.uit.no:[dir] mountpoint [options]
    eg.
    sshfs steinar@stallo.uit.no:  /home/steinar/stallo-fs/

Windows users may buy and install
`expandrive <http://www.expandrive.com/windows>`_.

High-performance tools
......................

Default ssh client and server on stallo login nodes is openssh package
with applied HPN patches. By using a hpnssh client on the other end of
the data transfer throughput will be increased.

To use this feature you must have a HPN patched openssh version. You can
check if your ssh client has HPN patches by issuing:

::

    ssh -V

if the output contains the word "hpn" followed by version and release
then you can make use of the high performance features.

Transfer can then be speed up either by disabling data encryption, AFTER
you have been authenticated or logged into the remote host (NONE
cipher), or by spreading the encryption load over multiple threads
(using MT-AES-CTR cipher).

NONE cipher

This cipher has the highest transfer rate. Keep in mind that data after
authentication is NOT encrypted, therefore the files can be sniffed and
collected unencrypted by an attacker. To use you add the following to
the client command line:

::

    -oNoneSwitch=yes -oNoneEnabled=yes

Anytime the None cipher is used a warning will be printed on the screen:

::

    "WARNING: NONE CIPHER ENABLED"

If you do not see this warning then the NONE cipher is not in use.

MT-AES-CTR

If for some reason (eg: high confidentiality) NONE cipher can't be used,
the multithreaded AES-CTR cipher can be used, add the following to the
client command line (choose one of the numbers):

::

    -oCipher=aes[128|192|256]-ctr

or:

::

    -caes[128|192|256]-ctr.

Subversion and rsync

The tools subversion and rsync is also available for transferring files.

.. vim:ft=rst
