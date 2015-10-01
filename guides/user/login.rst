==========
Logging in
==========

An SSH client (Secure SHell) is the required tool to connect to Stallo. To
learn more about this, check out the `Metasenter page on SSH. <http://docs.notur.no/metacenter/metacenter-documentation/metacenter_user_guide/log-in-with-ssh>`_. 

.. FIXME: fix link to docs.notur.no 

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

.. FIXME: **Something about keys here?**


Logging on the compute nodes
============================

Information on how to log in on a compute node.

Some times you may want to log on a compute node (for instance to check
out output files on the local work area on the node), and this is also
done by using SSH. From stallo.uit.no you can log in to
compute-x-y the following way:

::

    $ ssh -Y compute-x-y     (for instance: ssh compute-5-8)

or short

::

    $ ssh -Y cx-y        (for instance: ssh c5-8)

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
