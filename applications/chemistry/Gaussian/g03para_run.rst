---
title: Wrapper-script for submitting Gaussian 03 parallel jobs
...


`Back to Gaussian 03 top page<g03>`_

`Gaussian 03 serial script<g03serial_run>`_

Link to download the wrapper-script: `g03parallel.run<g03parallel.run>`_ (this file is also available in /global/apps/gaussian/usage).


Content of g03parallel.run:
----------------------------

::

 #!/bin/bash
 
 # Information:
 #$1 = Jobname, i.e., name of input-file, without extension.
 #$2 = Number of cores requested per node in shared-memory parallel calculation.
 #     Unless the job is truly serial, this number should normally correspond to the
 #     number of physical cores on the node, even if NProcShared has been set to a
 #     lower value in the input file. 
 #     Rule of thumb:
 #     1-3 nodes: NProcShared=8
 #     > 3 nodes: NProcShared=6
 #$3 = Number of nodes included in the TCP-Linda parallel job.
 #$4 = time on format hh:mm
 # You might also want to have a look at the value of the pmem-option below 
 # pmem=2000MB gives you normal nodes, pmem=4000Mb gives you highmem nodes if you 
 # are allowed to run in this queue.
 
 cat<<EOF>$1.job
 #!/bin/bash -l
 ##################     GAUSSIAN 09 JOB-FILE     #####################
 #                              for
 #                       stallo.uit.no - with TCP-Linda
 #
 # PBS-section 
 #PBS -S /bin/sh
 #PBS -A YOURACCOUNT-TO-CREDIT
 #PBS -l nodes=$3:ppn=$2,walltime=$4:00,pmem=2000mb
 # pmem is the memory requirement per process, softlimit.
 
 #PBS -N $1
 #PBS -o $1
 #PBS -r n
 #PBS -o $1.log
 #PBS -e $1.log
 #PBS -j oe
 #PBS -m ae
 #PBS -M YOUR-EMAILADRESS@YOURINSTITUTUION.YOURCOUNTRY
 #
 ##################################################################### 

 job=$1 # Name of input file without extension "inp".
 scratchdisk=/global/work # Scratch-files will go in global/work.
 
 #####################################################################
 # Information about this job-script:
 #
 # Stdout/stderr:
 # Indicated in the script by the lines containing PBS -o and PBS -e.
 # By default directed to "jobname".log.
 #
 # Scratch:
 # Scratch-files are put on /global/work/username.
 #
 # Checkpointfiles:
 # This script only looks for and generates GZIPPED checkpointfiles.
 # When starting a job the script first looks for a \$job.chk.gz file,
 # then for \$job.fchk.gz if the first alternative is not found.
 # After successfully finishing a gaussian job the script
 # converts the checkpointfile to a gzipped FORMATTED checkpointfile 
 # (\$job.fchk.gz). After an abnormal jobtermination, the script will 
 # NOT format the checkpointfile due to these checkpointfiles 
 # not being correctly formatted.
 #
 #####################################################################
 # Normally not necessary to change anything below this point
 ## 
 echo "###############  GAUSSIAN 09 JOB  #####################"
 machine=\`hostname\`
 echo "Job started on \$machine at"
 date
 #
 # Checking if we can get the home-directory of the job from the
 # queueing system. Currently supported: PBS.
 #
 if test \${PBS_O_WORKDIR-empty} = empty
 then
    project=`pwd`
 else
    project=\$PBS_O_WORKDIR
 fi
 #
 echo "The home-directory of the job is \$project."
 #
 # We override the default GAUSS_SCRDIR on stallo:
 export GAUSS_SCRDIR=\$scratchdisk/\$LOGNAME/\$PBS_JOBID/\$job
 #
 # We do not need to use the pbsdsh-command in order to generate the scratch-directory on all 
 # nodes involved in the job since we are scratching on /global/work. 
 mkdir -p \$GAUSS_SCRDIR
 cd \$GAUSS_SCRDIR
 echo "The job will use scratch-directory \${GAUSS_SCRDIR}."
 #
 # OMP error message:
 export OMP_NUM_THREADS=1
 export KMP_DUPLICATE_LIB_OK=TRUE
 #
 # Giving g09 and TCP Linda the list of nodes, from the queuing system.
 # We sort and cut the nodelist so that each node only appears once.
 # We never use more than one Linda worker per node.
 # We avoid using the obsolete "-mp" option.
 UNIQNODES=\`cat \$PBS_NODEFILE|sort|uniq|tr '\n' ' ' \`
 echo "UNIQNODES= \$UNIQNODES"
 export QNODES=\"\$UNIQNODES\"
 #
 # The number of TCP-Linda processes per node
 export GAUSS_LFLAGS="-v -nodelist \$QNODES"
 echo "GAUSS_LFLAGS= \$GAUSS_LFLAGS"
 #
 #
 # On stallo, the set-up for the various packages is performed by 
 # using the module facility:
 module load gaussian
 
 # We override the default GAUSS_SCRDIR on stallo. We have to repeat this command
 # because the default value is set in the module load facility.
 export GAUSS_SCRDIR=\$scratchdisk/\$LOGNAME/\$PBS_JOBID/\$job
 #
 cp \$project/\$job.inp .
 export GAUSS_MEMDEF=1500Mb
 #
 #
 if [ -f \$project/\$job.chk.gz ]
 then
    echo "Unformatted checkpointfile found."
    echo "Copying the unformatted checkpointfile to scratch."
    cp \$project/\$job.chk.gz \$job.chk.gz
    gunzip \$job.chk.gz
 else
    if [ -f \$project/\$job.fchk.gz ]
    then
       echo "No unformatted checkpointfile found."
       echo "Formatted checkpointfile found."
       echo "Copying the formatted checkpointfile to scratch."
       cp \$project/\$job.fchk.gz \$job.fchk.gz
       gunzip \$job.fchk.gz
       \$g09root/g09/unfchk \$job.fchk
    else
     echo "No valid checkpointfile found."
     echo "Starting the Gaussian job without a checkpointfile."
    fi
 fi
 #
 echo "*** Running Gaussian 09 ***"
 #
 NodeList=\`cat \$PBS_NODEFILE | sort -u | tr -s "\n" "," | sed "s/,$//"\`
 NPROCS=$2
 sed -i "1i %LindaWorkers=\$NodeList" \$job.inp
 sed -i "1i %NProcShared=\$NPROCS" \$job.inp
 sed -i "/^--Link1--/ a\%NProcShared=\$NPROCS\n%LindaWorkers=\$NodeList" \$job.inp
 
 g09 < \$job.inp > \$job.out
 #
 echo "What files were present in the scratch-directory when G09 finished?"
 #
 ls -lt
 echo "And what about scratch-disk space?"
 df -k .
 #
 # Utility routine to check that the copying of files from the work-dir
 # to the home-dir went OK before deleting the work-files.
 #
 cpcheck(){
     halt=\$?
     if [ \$halt -gt 0 ]
     then 
 	echo " Some files could not be copied from scratch to home-directory!"
 	echo " Thus not deleting scratch-directory."
	exit 1
    fi
 }

  #
 export GAUSS_MEMDEF=1500Mb
 fok=false
 if [ -f "\$job.out" ] 
 then
    if tail -1 "\$job.out" | grep "Normal termination of Gaussian 09" > /dev/null
    then
      fok=true
    fi
    cp \$job.out \$project/\$job.out
    cpcheck
 fi
 if [ -f "\$job.chk" ]
 then
    if test "\$fok" = true
    then  
       echo "Gaussian 09 terminated normally."
       echo "Thus formatting the checkpointfile."
       \$g09root/g09/formchk -2 "\$job.chk"
       halt=\$?
       if [ \$halt -gt 0 ]
       then
          echo "Formatting of checkpointfile failed!"
          echo "Copying the unformatted file back home instead."
          gzip "\$job.chk"
          cp \$job.chk.gz \$project/\$job.chk.gz
          cpcheck
       fi
       echo "Copying the formatted checkpointfile to home."
       gzip "\$job.fchk"
       cp \$job.fchk.gz \$project/\$job.fchk.gz
       cpcheck
    else
       echo "Gaussian 09 did not terminate normally."
       echo "Thus not formatting the checkpointfile."
       echo "Copying the unformatted checkpointfile to home."
       gzip "\$job.chk"
       cp \$job.chk.gz \$project/\$job.chk.gz
       cpcheck
    fi
 fi
 if [ -f FILE.47 ] 
 then
    echo "FILE.47 found on scratch."  
    echo "Copying FILE.47 back home."
    cp FILE.47 \$project/\$job.47
    cpcheck
 fi
 if [ -f fort.7 ] 
 then
    echo "fort.7 found on scratch."  
    echo "Copying fort.7 back home."
    cp fort.7 \$project/\$job.dat
    cpcheck
 fi
 #
 # Sometimes it's (for some strange reason) difficult to get
 # rid of the working directory on the scratch-disk. Trying
 # by brute force...
 #
 cd \$project
 if [ -d \$GAUSS_SCRDIR ]
 then 
    echo "Removing files in scratch-directory"
 #  rm -f \$GAUSS_SCRDIR/*
   rm -f  \$scratchdisk/\$LOGNAME/\$PBS_JOBID/
   echo "Removing the scratch-directory with rm -rf"
   rm -rf \$GAUSS_SCRDIR
   rm -rf \$scratchdisk/\$LOGNAME/\$PBS_JOBID/
 fi
 if [ -d \$GAUSS_SCRDIR ]
 then 
    echo "For some strange reason the scratch-directory is still present"
    echo "Trying to remove it using rmdir"
 #   rmdir \$GAUSS_SCRDIR
    rmdir  \$scratchdisk/\$LOGNAME/\$PBS_JOBID/
 fi
 #
 # Time to say goodbye!
 #
 echo "Job finished on \$machine at"
 date
 echo "###############  GAUSSIAN 09 JOB ENDED  #####################"
 
 exit 0
 EOF

 qsub $1.job

----
