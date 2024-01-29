@echo off
setlocal enabledelayedexpansion

@RD /S /Q build dist raylib_cython.egg-info

REM Set the path to the Python interpreter (modify as needed)
set PYTHON_EXECUTABLE=python

REM Run setup.py for building the package
%PYTHON_EXECUTABLE% "src\setup.py" build_ext --build-lib=build

REM Run setup.py for building the source distribution and compiled distribution
%PYTHON_EXECUTABLE% "src\setup.py" sdist bdist_wheel
