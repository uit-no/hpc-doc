.. _gaussian_serial_run:

==================================================
Wrapper-script for submitting Gaussian serial jobs
==================================================

Link to download the wrapper-script: `g03serial.run<g03serial.run>`_ (this file is also available in /global/apps/gaussian/usage).

Content of g03serial.run:
-------------------------


::

 #!/bin/bash

 # Information:
 #$1 = Jobname, i.e., name of input-file, without extension.
 #$2 = time on format hh:mm

 # You might also want to have a look at the value of the pmem-option below.

 cat<<EOF>$1.job
 #!/bin/bash -l
 ##################     GAUSSIAN 09 JOB-FILE     #####################
 #                              for
 #                       stallo.uit.no
 #
 # PBS-section 
 #PBS -S /bin/sh
 ##PBS -A ACCOUNT
 #PBS -l walltime=$2:00,pvmem=4000mb,pmem=2000mb
 # pmem is the memory requirement per process 

 #PBS -N $1
 #PBS -o $1
 #PBS -r n
 #PBS -o $1.log
 #PBS -e $1.log
 #PBS -j oe
 #PBS -m ae
 #PBS -M YOUR-EMAIL-ADRESS
 #
 #####################################################################
 # User input:  
               job=$1      # Name of input file without extension "inp".
                  scratchdisk=/global/work       # Scratch-files will go in
 #####################################################################
 # Normally not necessary to change anything below this point
 ## 
 echo "###############  GAUSSIAN 09 JOB  #####################"
 machine=\`hostname\`
 echo "Job started on \$machine at"
 date
 
    project=\$PBS_O_WORKDIR
 # We override the default GAUSS_SCRDIR on stallo:
 export GAUSS_SCRDIR=\$scratchdisk/\$LOGNAME/\$PBS_JOBID/\$job
 mkdir -p \$GAUSS_SCRDIR
 cd \$GAUSS_SCRDIR
 #
 # OMP error message:
 export OMP_NUM_THREADS=1
 export KMP_DUPLICATE_LIB_OK=TRUE
 #
 module load gaussian/03.e01
 
 export GAUSS_SCRDIR=\$scratchdisk/\$LOGNAME/\$PBS_JOBID/\$job
 #
 cp \$project/\$job.inp .
 export GAUSS_MEMDEF=2000Mb
 #
 if [ -f \$project/\$job.chk.gz ]
 then
    echo "Unformatted checkpointfile found."
    echo "Copying the unformatted checkpointfile to scratch."
    cp \$project/\$job.chk.gz \$job.chk.gz
    gunzip \$job.chk.gz
 else
 echo "No unformatted checkpointfile found."
 fi
 #
 echo "*** Running Gaussian 09 with the "time" command ***"
 #
 time  g09 < \$job.inp > \$job.out
 #
 export GAUSS_MEMDEF=2000Mb
 fok=false
 if [ -f "\$job.out" ] 
 then
    if tail -1 "\$job.out" | grep "Normal termination of Gaussian 09" > /dev/null
    then
       fok=true
    fi
    cp \$job.out \$project/\$job.out
 fi
 if [ -f "\$job.chk" ]
 then
    if test "\$fok" = true
    then  
       echo "Gaussian 09 terminated normally."
       echo "Thus formatting the checkpointfile."
       \$g09root/g09/formchk -2 "\$job.chk"
 else
 echo "Checkpointfile not formatted."
       fi
       echo "Copying the formatted checkpointfile to home."
       gzip "\$job.fchk"
       cp \$job.fchk.gz \$project/\$job.fchk.gz
 fi
 #
 cd \$project
   rm -rf  \$scratchdisk/\$LOGNAME/\$PBS_JOBID/
 #
 echo "Job finished on \$machine at"
 date
 echo "###############  GAUSSIAN 09 JOB ENDED  #####################"  

 qstat -f \$PBS_JOBID | grep resources_used >> \$1.log
 
 exit 0
 EOF
 
 qsub $1.job

----

.. :vim:ft=rst
