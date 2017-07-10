.. _X11_connection_problems:

==========================
X11 connection problems
==========================

Over the last 6-12 months we have had an increasing number of users experiencing problems when connecting to stallo with X11 forwarding enabled. We have put a lot of effort in investigating and trying to solve this but have so far not been able to come up with a solution. We have some solutions that seem to temporarily solve the problem for some users.

We are now asking for help on this because we are not able to solve it alone and for the impacted users this is a serious problem.

Here we will collect all information we have including the solutions we know have worked for some.

Description of the problem
==========================

The errormessages reported, os-es and browsers we know it apers on.

List of solutions we have tried
==========================

Espen's solution on his Mac:
--------------------------------

For Mac OS X Sierra (10.12) it is related to the fact that the xauth binary has a non-standard
placement, causing ssh to not finding it when logging in with X11 tunelling enabled (ssh -Y). 

Be ware that for the OS X platform, this also inflects the usage of the safari browser when 
logging in to stallo-gui, since the browser seems to read the default path setup from the system.
Using the Chrome browser solves the X11 problem on stallo-gui for OSX.

The overall sollution for Espen on his Mac was the following: 

* sudo emacs -nw /etc/ssh/ssh_config
* Go to the line that starts with "# Host *" (line 20 in my config)
* Added "XAuthLocation /usr/X11/bin/xauth" under ForwardAgent and ForwardX11.
* Closed the file and closed all terminal windows.
* Opened a terminal window and logged in to Stallo. Problem gone.

* Since he had multiple user accounts on Stallo, he also had to add "X11Forwarding yes" to your sshd_config file.
 
