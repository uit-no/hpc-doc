

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
virtualenv venv
source venv/bin/activate
pip install sphinx
pip install sphinx_rtd_theme
sphinx-build . _build
```

Then point your browser to `_build/index.html`.


## Getting started with RST and Sphinx

- http://sphinx-doc.org/rest.html
- http://sphinx-doc.org/markup/inline.html#cross-referencing-arbitrary-locations


## Branches and versions

We currently have 2 branches:

| branch        | renders to                      |
| ------------- | ------------------------------- |
| master        | http://hpc.uit.no/en/latest/    |
| easybuild     | http://hpc.uit.no/en/easybuild/ |

Note that all three versions are public. We can have as many
branches and versions as we want but we need to activate new branches on
ReadTheDocs.

Be careful to only commit changes that relate to
EasyBuild to the `easybuild` branch. Everything else
should go to `master`.

If you work on the `easybuild` branch and see something wrong in the general text,
then it is not a good idea to fix it on the `easybuild` branch "while at it".
Otherwise these changes stay invisible on the official page until the moment we
publish the `easybuild` branch.  The right strategy is to fix the general text on
the `master` branch and merge the change to the `easybuild` branch:
```
$ git checkout master

                              # now do the general fix

$ git commit                  # commit the fix to master
$ git push origin master      # push changes to master branch on github
$ git checkout easybuild      # switch to easybuild branch
$ git merge master            # merge the master branch into the current branch (easybuild)

                              # continue working on easybuild branch ...

$ git push origin easybuild   # push changes to easybuild branch on github
```

It is always safe to merge `master` into `easybuild` as shown above.
Merging the other way means publishing changes into the official version so be
careful with that.
