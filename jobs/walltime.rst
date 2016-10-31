

Walltime
========

We recommend you to be as precise as you can when specifying the
parameters as they will inflict on how fast your jobs will start to run.
We generally have these rules for prioritizing jobs:

#. Large jobs, that is jobs with high CPUcounts, are prioritized.
#. Short jobs take precedence over long jobs.
#. Use fairshare. This means that users with many jobs running will get a
   decreased priority compared to other users.
