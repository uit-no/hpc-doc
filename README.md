

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
