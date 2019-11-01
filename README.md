

# HPC-services user documentation

Served via http://hpc-uit.readthedocs.org.

Copyright (c) 2018
Radovan Bast,
Mathias Bockwoldt,
Roy Dragseth,
Stig Rune Jensen,
Dan Jonsson,
Jonas Juselius,
Elena Malkin,
Marte Skadsem,
Espen Tangen,
Giacomo Tartari,
Steinar Traedal-Henden,
UiT The Arctic University of Norway.


## License

Text is licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/),
code examples are provided under the [MIT](https://opensource.org/licenses/MIT) license.


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
