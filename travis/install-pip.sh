#!/bin/bash
set -e

echo "pip installing required python packages"
pip install -r requirements.txt

#PYVER=`python -V 2>&1 | cut -c 8`
PYVER=`echo $TRAVIS_PYTHON_VERSION | cut -c 1`
if [ "$PYVER" = "3" ]; then
    echo "pip installing snakemake packages (py3 only)"
    pip install -r requirements-pipes.txt
fi

echo "pip installing test-related packages (coveralls, etc.)"
pip install -r requirements-tests.txt
