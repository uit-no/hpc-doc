.. _file_transfer:

===========================================
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
