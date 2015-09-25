---
title: How to restart an ADF job
...

**Restarting a job:**
    
#. In the directory where you started your job, rename or copy the job-output t21 file into $SCM_TMPDIR/TAPE21.

#. In job.inp file, put RESTART TAPE21 just under the comment line.

#. Submit job.inp file as usual. 

This might also be automized, we are working on a solution for restart after unexpected downtime. 