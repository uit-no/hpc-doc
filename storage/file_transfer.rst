.. _file_transfer:

=================================
Transferring files to/from Stallo
=================================

Only ssh type of access is open to stallo. Therefore to upload or
download data only scp and sftp can be used.

To transfer data to and from stallo use the following address:

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

Mounting the file system on you local machine using sshfs
---------------------------------------------------------
For linux users::

    sshfs [user@]stallo.uit.no:[dir] mountpoint [options]

eg.::

    sshfs steinar@stallo.uit.no:  /home/steinar/stallo-fs/

Windows users may buy and install
`expandrive <https://www.expandrive.com/windows>`_.


High-performance tools
======================

NONE cipher
-----------
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
--------------------
The tools subversion and rsync is also available for transferring files.
