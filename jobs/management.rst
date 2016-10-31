

Managing jobs
=============

The lifecycle of a job can be managed with as little as three different
commands:

#. Submit the job with ``sbatch <script_name>``.
#. Check the job status with ``squeue``. (to limit the display to only
   your jobs use ``squeue -u <user_name>``.)
#. (optional) Delete the job with ``scancel <job_id>``.

You can also hold the start of a job:

scontrol hold <job_id>
    Put a hold on the job. A job on hold will not start or block other jobs from starting until you release the hold.
scontrol release <job_id>
    Release the hold on a job.
