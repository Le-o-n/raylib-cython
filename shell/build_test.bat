@echo off
set PYTHON=python

@DEL /F /Q "src\raylib_test\test.c"
@DEL /F /Q "src\raylib_test\*.pyd"
@RD /S /Q "src\raylib_test\build"

%PYTHON% "./src/raylib_test/setup.py" build_ext --inplace

@DEL /F /Q "src\raylib_test\test.c"
@RD /S /Q "src\raylib_test\build"