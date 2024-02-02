@echo off
setlocal enabledelayedexpansion

REM Set the path to the Python interpreter (modify as needed)
set PYTHON_EXECUTABLE=python
set SETUP="src/raylib_cython/setup.py"

REM Run setup.py for building the source distribution and compiled distribution
%PYTHON_EXECUTABLE% %SETUP% build_ext --inplace


