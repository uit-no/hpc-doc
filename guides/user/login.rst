=============================
Logging in for the first time
=============================


Log in with SSH
===============
An *SSH* client (Secure SHell) is the required tool to connect to Stallo. An *SSH* client provides secure encrypted communications between two hosts over an insecure network.

If you already have *ssh* installed on your UNIX-like system, have a user account and password on a Notur system, login may be as easy as typing

::

 ssh <machine name>         (for instance: ssh njord.hpc.ntnu.no)

into a terminal window.

If your user name on the machine differs from your user name on the local machine, use the -l option to specify the user name on the machine to which you connect. For example:

::

 ssh <machine name> -l [user name]

And if you need X-forwarding (for instance, if you like to run Emacs in it's own window) you must log in like this:

::

 ssh -X -Y <machine name>

Log in with an ssh-key
----------------------

.. FIXME: short explanation about using ssh keys

SSH clients for Windows and Mac
-------------------------------
At the `OpenSSH page <http://www.openssh.com>`_ you will find several *SSH* alternatives for both Windows and Mac.

Please note that Mac OS X comes with its own implementation of *OpenSSH*, so you don't need to install any third-party software to take advantage of the extra security *SSH* offers. Just open a terminal window and jump in.


Learning more about SSH
-----------------------
To learn more about using SSH, please also consult the `OpenSSH page <http://www.openssh.com>`_ page and take a look at the manual page on your system (*man ssh*).



Obtain a new password
=====================
When you have been granted an account on stallo.uit.no, your username and password is sent to you separately.
The username by email and the password by SMS. The password you receive by SMS is temporally and only valid for 7 days. 


The passwd command does not seem to work. My password is reset back to the old one after a while. Why is this happening?
------------------------------------------------------------------------------------------------------------------------

The Stallo system is using a centralised database for user management.
This will override the password changes done locally on Stallo.

The password can be changed `here <https://www.metacenter.no/user/password/>`_, log in using your
username on stallo and the NOTUR domain.


Logging on the compute nodes
============================

Information on how to log in on a compute node.

Some times you may want to log on a compute node (for instance to check
out output files on the local work area on the node), and this is also
done by using SSH. From stallo.uit.no you can log in to
compute-x-y the following way:

::

    ssh -Y compute-x-y     (for instance: ssh compute-5-8)

or short

::

    ssh -Y cx-y        (for instance: ssh c5-8)

If you don't need display forwarding you can omit the "-Y" option
above.

If you for instance want to run a program interactively on a compute
node, and with display forwarding to your desktop you should in stead do
something like this:

#. first login to Stallo with display forwarding,
#. then you should reserve a node, with display forwarding, trough the
   queuing system

Below is an example on how you can do this:

::

    1) Log in on Stallo with display forwarding.  
    $ ssh -Y stallo.uit.no                       
    
    2) Reserve and log in on a compute node with display forwarding.
       (start an interactive job.)
    $ qsub -lnodes=1,walltime=1:0:0 -I -X        

This example assumes that you are running an X-server on your local
desktop, which should be available for most users running Linux, Unix
and Mac Os X. If you are using Windows you must install some X-server
on your local PC.

.. vim:ft=rst
