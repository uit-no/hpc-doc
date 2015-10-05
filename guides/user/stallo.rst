
About stallo
============


Resource description
--------------------

Key numbers about the Stallo cluster: compute nodes, node interconnect,
operating system, and storage configuration.



+-------------------------+----------------------------------------------+---------------------------------------------+
|                         | Aggregated                                   | Per node                                    |
+=========================+==============================================+=============================================+
| Peak performance        | 104 Teraflop/s                               | 332 Gigaflop/s                              |
+-------------------------+----------------------------------------------+---------------------------------------------+
| # Nodes                 | 304 x  HP BL460 gen8 blade servers           | 1 x    HP BL460 gen8 blade servers          |
+-------------------------+----------------------------------------------+---------------------------------------------+
| # CPU's / # Cores       | 608 / 4864                                   | 2 / 16                                      |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Processors              | 608 x 2.60 GHz Intel Xeon E5 2670            | 2 x 2.60 GHz Intel Xeon E5 2670             |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Total memory            | 12.8 TB                                      | 32 GB (32 nodes with 128 GB)                |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Internal storage        | 155.2 TB                                     | 500 GB (32 nodes with 600GB raid)           |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Centralized storage     | 2000 TB                                      | 2000 TB                                     |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Interconnect            | Gigabit Ethernet + Infiniband  :sup:`1`      | Gigabit Ethernet + Infiniband  :sup:`1`     |
+-------------------------+----------------------------------------------+---------------------------------------------+

+-------------------------------------+-----------------------+
| Compute racks                       | 5                     |
+-------------------------------------+-----------------------+
| Infrastructure racks                | 2                     |
+-------------------------------------+-----------------------+
| Storage racks                       | 3                     |
+-------------------------------------+-----------------------+
| Dimensions                          | 15 m x 1,3 m x 2 m    |
+-------------------------------------+-----------------------+
| Weigha                              | 16 tons               |
+-------------------------------------+-----------------------+

 

1) All nodes in the cluster are connected with Gigabit Ethernet and
QDR Infiniband.

 

Stallo - a Linux cluster 
------------------------

A quick and brief introduction to the general features of Linux
Clusters / Stallo is available on the `Metasenter page about Linux
Clusters <http://docs.notur.no/metacenter/metacenter-documentation/metacenter_user_guide/general-about-linux-cluster>`_.

Linux operation system (Rocks): `<http://www.rocksclusters.org/>`_
------------------------------------------------------------------

Since 2003, the HPC-group at has been one of five international
development sites for the Linux operation system Rocks. Together with
people in Singapore, Thailand, Korea and USA, we have developed a tool
that has won international recognition, such as the price for "Most
important software innovation  " both in 2004 and 2005 in HPCWire. Now
Rocks is a de-facto standard for cluster-managment in Norwegian
supercomputing.

Stallo - Norse mythology
------------------------

In the folklore of the Sami, a Stallo (also Stallu or Stalo)is a sami wizard.
"The Sami traditions up North differ a bit from other parts of Norwegian
traditions. You will find troll and draug and some other creatures as well,
but the Stallo is purely Sami. He can change into all kinds of beings,;
animals, human beings, plants, insects, bird – anything. He can also “turn”
the landscape so you miss your direction or change it so you don’t recognise
familiar surroundings.  Stallo is very rich and smart, he owns silver and
reindeers galore, but he always wants more. To get what he wants he tries to
trick the Samis into traps, and the most popular Sami stories tell how people
manage to fool Stallo." NB! Don’t mix Stallo with the noaide! He is a real
wizard who people still believe in.

.. vim:ft=rst
