.. _About_licenses:

================================
General comments about licenses
================================

This is an attempt to describe the different licenses we have on Stallo and for the entire NOTUR system when it comes to chemistry and material science codes.

Here, I will only address the codes with a certain access limitation. For free, open source codes without any limitations, I do not really see the point in commenting. But, the reader should be aware that "free" not allways means "unrestricted access".

Also, due to a choice of policy, I am only adressing the issues of academic access. For commercial licenses, the user or user groups needs to investigate consequences and prices themselves. For any given code, the license model and related issues is more in depth described as a part of the standard documentation.

There is in general 6 different categories of access limitations for software on Stallo:

#. Licenses paid entirely by the users.
#. Licenses paid partially by the users and partly by national bodies.
#. Licenses paid partly or entirely by institutions.
#. Licenses paid entirely by national bodies.
#. Licenses available only on a machine or a service (machine-license).
#. Free licenses that requires an agreement with the vendor before using the code.

Category 1 is what is the "bring your own license" group. Either the vendor does not provide computer centre license, or pricing is somewhat outside the boundaries of acceptance for NOTUR. VASP is in this category, where NOTUR does administer a certain level of access based on feedback from the VASP vendor. Other examples is Petrel, Molpro (previously).

Category 2 is a joint funding model, where users have to add to the total pool of finance in order to provide a certain level of license tokens available. For instance, the Schrodinger small molecule drug discovery suite license is split into a "national" and a "local" part, with one common license server and unlimited tokens available for everyone. NOTUR provides support and manages the license tokens on behalf of the community, up until now as a part of DS Chem (predecessor to the Application Managment project). The license is monitored, in order to ensure a minimum level of fairness. If a user crosses a certain level of usage without representing one of the groups contributing to funding - access will be denied until finance formalities has been settled.

Category 3 is the group of software where your respective host institution has implication for access or not. Codes like COMSOL, MATLAB, STATA, ANSYS, STAR-CCM+, IDL, Mathematica are all in this category.

Category 4 is a lot more complex than you might anticipate. Codes like ADF and Turbomole are in this category. ADF is currently entirely funded by Sigma2, but how long this will continue is unknown. For ADF, we have a national license - meaning that anyone can request a download and install the code suite as long as they are members on a Norwegian Grant degreeing institution. Turbomole has currently the form of a national machine type license, as a part of prevoiously mentioned DS Chem. As long as on person has the responsibility of installing Turbomole on all the national academic high performance compute clusters, we only have to by one common license for all these machines. Currently, the national body has paid for a two group Crystal license, in order to map interest and need. We have (or at least had when the license was bought) an agreement that if the interest came to the level where we needed to grant access to more people, we could transform the license into a machine type license by only paying the difference in license fee. Gaussian has the appearance of a national license, and is paid by NOTUR - but it really is 4 site licenses making a total of "access license for those who comes from one of the four original norwegian academic hpc host sites - NTNU, UiB, UiO, UiT". It also means that others that do hold a valid Gaussian license will be allowed access. This licensing is limited to main version (G09, G16 etc) and may explain limitations on the more recent versions. The intel tools and compiler suites for use on the national academic hpc cluster is also in this category.

Category 5 is the group of software that is only available on a single installation/machine. On Stallo we have NBO6 and the nbo6 plug in for ADF. On Abel they have an installation of Molpro which is both machine type and site type licensed. 

Category 6  In this group, we have Molcas, ORCA. (and maybe Dalton and Dirac). Some vendors, even if they offer their software free for academic usage in general, or for limited areas (Molcas is free for academics from Nordic institutions), they still want to have a certain control over the software distribution. 

and, of course, category 7 is the entire group of software where this is not really a problem;-).

You will find more info in the application guides or in the respective module files. The latter info you get access to by typing:

.. code-block::bash

    module help <application> # Like for instance ADF
