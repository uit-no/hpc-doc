.. _file_transfer:

=================================
Transferring files to/from Stallo
=================================

All Notur systems are stand-alone systems, and in general we do not
(NFS-)mount remote disks on them. Therefore you must either explicitly
transfer any files you wish to use by using either sftp  or scp, or
you can `mount your home directory('s) 
<http://docs.notur.no/metacenter/metacenter-documentation/metacenter_user_guide/mounting_disks_on_notur_systems>`_ on the Notur systems *on your own computer*. 


Transferring data to/from the system
====================================

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
`expandrive <http://www.expandrive.com/windows>`_.


High-performance tools
======================

OpenSSH with HPN
----------------
The default *ssh* client and server on stallo login nodes is the *openssh* package
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

.. vim:ft=rst
