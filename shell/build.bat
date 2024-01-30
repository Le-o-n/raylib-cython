@echo off
setlocal enabledelayedexpansion

@RD /S /Q build 
@RD /S /Q dist
@RD /S /Q raylib_cython.egg-info

REM Set the path to the Python interpreter (modify as needed)
set PYTHON_EXECUTABLE=python

REM Set path to cython
set CYTHON=cython

REM Run setup.py for building the package in place
%PYTHON_EXECUTABLE% "setup.py" build_ext

REM Create annotations
%CYTHON% --annotate -o build/ src/raylib_cython/raylib.pyx

REM Run setup.py for building the source distribution and compiled distribution
%PYTHON_EXECUTABLE% "setup.py" sdist bdist_wheel

REM Cleanup

