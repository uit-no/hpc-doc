.. _torque_slurm_table:


Quick Guide to translate PBS/Torque to SLURM
============================================

======================== =================== ==========================
User commands            PBS/Torque          SLURM
======================== =================== ==========================
Job submission           qsub [filename]     sbatch [filename]
Job deletion             qdel [job_id]       scancel [job_id]
Job status (by job)      qstat [job_id]      squeue `-`-job [job_id]
Full job status (by job) qstat -f [job_id]   scontrol show job [job_id]
Job status (by user)     qstat -u [username] squeue `-`-user=[username]
======================== =================== ==========================

===================== ============== ===================
Environment variables PBS/Torque     SLURM
===================== ============== ===================
Job ID                $PBS_JOBID     $SLURM_JOBID
Submit Directory      $PBS_O_WORKDIR $SLURM_SUBMIT_DIR
Node List             $PBS_NODEFILE  $SLURM_JOB_NODELIST
===================== ============== ===================

===================== =========================== ==========================================
Job specification     PBS/Torque                  SLURM
===================== =========================== ==========================================
Script directive      #PBS                        #SBATCH
Job Name              -N [name]                   `-`-job-name=[name] OR -J [name]
Node Count            -l nodes=[count]            `-`-nodes=[min[-max]] OR -N [min[-max]]
CPU Count             -l ppn=[count]              `-`-ntasks-per-node=[count]
CPUs Per Task                                     `-`-cpus-per-task=[count]
Memory Size           -l mem=[MB]                 `-`-mem=[MB] OR `-`-mem-per-cpu=[MB]
Wall Clock Limit      -l walltime=[hh:mm:ss]      `-`-time=[min] OR `-`-time=[days-hh:mm:ss]
Node Properties       -l nodes=4:ppn=8:[property] `-`-constraint=[list]
Standard Output File  -o [file_name]              `-`-output=[file_name] OR -o [file_name]
Standard Error File   -e [file_name]              `-`-error=[file_name] OR -e [file_name]
Combine stdout/stderr -j oe (both to stdout)      (Default if you don't specify `-`-error)
Job Arrays            -t [array_spec]             `-`-array=[array_spec] OR -a [array_spec]
Delay Job Start       -a [time]                   `-`-begin=[time]
===================== =========================== ==========================================
