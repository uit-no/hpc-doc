.. contents:: Table of contents.

.. index:: getting started, quickstart guide

.. _getting_started:

===============
Getting started
===============

The really quick and dirty startup guide for the pathologically impatient
================================================================================================

First of all you need to have a :doc:`CPU-quota and a login account <./account>`, and then you can :doc:`log onto the system <./login>`.

Once you have passed the initial hurdles you can start computing, but before you start we would like you to read through the following basic points about our computing service.

#. You need to run batch jobs to get computing going.
#. You need to have some sense parallelism to get performance. (Stallo will not do this automatically for you)
#. Do NOT run long computations on the login nodes. With long we mean more than 15 minutes of runtime. We kill long running processes automatically.
#. Your home catalog is for things you write and cannot recompute (we take REALLY good care of that stuff), the project area is for things you want to share with others on stallo (we take good care of that too), the work area is for big data results coming from your computations (we do not take backup of these data).
#. Stallo do not have a GUI, or, at least not a good one.


Keep this guidelines in the back of your head and try to start running jobs on the system.  :doc:`Here <./firstjob>` is a quick run-through on how to get your first job running on the system.

Further reading.
=========================

We have a wealth of documentation for you, here are some places with more information on how to use our system.

* :doc:`Batch system <./jobs>`.
* :doc:`Develop and compile your own apps <../developer/index>`.
* :doc:`Use preinstalled applications <../applications/index>`.


Accounts and quotas
================================================================================================

Getting started on the machine (account, quota, password)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before you start using Stallo, please read the :doc:`University of Tromsø's guidelines <guidelines>`.

A general introduction to Notur can be found at
`http://www.notur.no/quotas/rules/ <http://www.notur.no/quotas/rules/>`_

How to get an account and a CPU quota on Stallo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To be able to work on Stallo you must have an account and you must have
been granted CPU time on the system. There are two ways to achieve this:

Research Council Quota
------------------------

National users (including users from UiT) may apply for an account and
a CPU quota from the Research Councils share of Stallo. If you want to
apply for such a quota please use this `form.  <http://www.notur.no/quotas/apply>`_

UiT Quota
-----------

“Local users” (i.e. users from UiT and users affiliated with UiT in some way) can apply for an account and
a quota from UiT’s share of Stallo. If you wan to apply for such a quota
please use this `form. <http://uit.no/ansatte/organisasjon/artikkel?p_document_id=299809&p_dimension_id=88223&p_menu=49281>`_

Please note that most users who are allowed to apply for a UiT quota
also are allowed to apply for a quota from the Research Council –
at the same time!

Before you start using Stallo, please read the `University of
Tromsø's guidelines <guidelines>`_.

Information about how to log in on Stallo with ssh, and how to learn more about ssh.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An SSH client (Secure SHell) is the required tool to connect to
Stallo. To learn more about this, check out the `Metasenter page on SSH
<http://docs.notur.no/metacenter/metacenter-documentation/metacenter_user_guide/log-in-with-ssh>`_.

.. FIXME: fix link to docs.notur.no

Obtain a new password
~~~~~~~~~~~~~~~~~~~~~

When you have been granted an account on stallo.uit.no, your username and password is sent to you separat.
the username by email and the password by SMS.  The password you receive by SMS is temporally and only valid for 7 days.

The passwd command does not seem to work. My password is reset back to the old one after a while. Why is this happening?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Stallo system is using a centralised database for user management.
This will override the password changes done locally on Stallo.

The password can be changed `here <https://www.metacenter.no/user/password/>`_, log in using your
username on stallo and the NOTUR domain.

.. vim:ft=rst
