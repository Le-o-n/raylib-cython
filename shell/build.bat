@echo off
setlocal enabledelayedexpansion

@RD /S /Q build 
@RD /S /Q dist
@RD /S /Q raylib_cython.egg-info

REM Set the path to the Python interpreter (modify as needed)
set PYTHON_EXECUTABLE=python

REM Run setup.py for building the package in place
%PYTHON_EXECUTABLE% "setup.py" build_ext

REM Run setup.py for building the source distribution and compiled distribution
%PYTHON_EXECUTABLE% "setup.py" sdist bdist_wheel
