@echo off
set PYTHON=python

@DEL /F /Q "src\raylib_test\main.c"
@DEL /F /Q "src\raylib_test\*.pyd"
@RD /S /Q "src\raylib_test\build"

cythonize -i "./src/raylib_test/main.pyx"

@DEL /F /Q "src\raylib_test\main.c"
@RD /S /Q "src\raylib_test\build"