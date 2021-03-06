SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = docs
BUILDDIR      = docs/_build

default:
	@echo Type: make check, make html, or make clean

rcheck:
	-pyroma -d .
	-check-manifest
	-pylint miepython/miepython.py
	-pydocstyle miepython/miepython.py
	-pylint miepython/__init__.py
	-pydocstyle miepython/__init__.py

html:
	$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

test:
	tox

clean:
	rm -rf dist
	rm -rf miepython.egg-info
	rm -rf miepython/__pycache__
	rm -rf docs/api/*
	rm -rf docs/_build/*
	rm -rf docs/_build/.buildinfo
	rm -rf docs/_build/.doctrees
	rm -rf .tox
	
realclean:
	make clean

.PHONY: clean rcheck html test realclean