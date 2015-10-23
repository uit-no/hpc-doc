

# HPC-services user documentation

Served via http://hpc-uit.readthedocs.org.

Copyright (c) 2015
Radovan Bast,
Roy Dragseth,
Dan Jonsson,
Jonas Juselius,
Elena Malkin,
Espen Tangen,
Giacomo Tartari,
Steinar Traedal-Henden,
UiT The Arctic University of Norway.


## Locally building the HTML for testing

```
git clone https://github.com/uit-no/hpc-doc.git
cd hpc-doc
virtualenv venv           # optional step in case you need to install sphinx
source venv/bin/activate  # optional step in case you need to install sphinx
pip install sphinx        # optional step in case you need to install sphinx
sphinx-build . _build
```

Then point your browser to `_build/index.html`.


## Getting started with RST and Sphinx

- http://sphinx-doc.org/rest.html
- http://sphinx-doc.org/markup/inline.html#cross-referencing-arbitrary-locations


## Branches and versions

We currently have 3 branches:

| branch        | renders to                                   |
| ------------- | -------------------------------------------- |
| master        | http://hpc-uit.readthedocs.org/en/latest/    |
| slurm         | http://hpc-uit.readthedocs.org/en/slurm/     |
| easybuild     | http://hpc-uit.readthedocs.org/en/easybuild/ |

Note that http://hpc-uit.readthedocs.org/en/latest/ is behind
http://hpc.uit.no/ and all three versions are public.  We can have as many
branches and versions as we want but we need to activate new branches on
ReadTheDocs.

You can locally switch between branches like this:
```
$ git checkout slurm   # switch to slurm branch

$ git branch           # figure out on which branch we are

  easybuild
  master
* slurm

$ git checkout master  # back to master

$ git branch           # figure out on which branch we are

  easybuild
* master
  slurm
```

Be careful to only commit changes that relate to the switch to SLURM or
EasyBuild to the `slurm` or `easybuild` branch, respectively. Everything else
should go to `master`.

If you work on the `slurm` branch and see something wrong in the general text,
then it is not a good idea to fix it on the `slurm` branch "while at it".
Otherwise these changes stay invisible on the official page until the moment we
publish the `slurm` branch.  The right strategy is to fix the general text on
the `master` branch and merge the change to the `slurm` branch:
```
$ git checkout master

                          # now do the general fix

$ git commit              # commit the fix to master
$ git push origin master  # push changes to master branch on github
$ git checkout slurm      # switch to slurm branch
$ git merge master        # merge the master branch into the current branch (slurm)

                          # continue working on slurm branch ...

$ git push origin slurm   # push changes to slurm branch on github
```

It is always safe to merge `master` into `slurm` or `easybuild` as shown above.
Merging the other way means publishing changes into the official version so be
careful with that.
