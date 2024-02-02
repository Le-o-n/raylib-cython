from setuptools import setup, find_packages, Extension
from Cython.Build import cythonize

import os
import glob


directory_path: str = os.path.abspath(".")

file_exts: list[str] = ["c", "pyd"]

for file_name in os.listdir(directory_path):
    ext = file_name.split(".")[-1]
    if ext in file_exts:
        full_path: str = os.path.join(directory_path, file_name)
        if os.path.exists(full_path):
            os.remove(full_path)
            print(f"Removed: {file_name}")


extensions = [
    Extension(
        "raylib",
        [
            "raylib.pyx",
        ],
        include_dirs=["../../libs"],
        library_dirs=["../../libs"],
        libraries=["../../libs/raylib"],  # Add any necessary libraries here
        extra_compile_args=[],  # Add any necessary compile flags here
    ),
    # Extension(
    #    "raylib_cython.test",
    #    [
    #        "src/raylib_cython/test.pyx",
    #    ],
    #    include_dirs=["src/raylib5/src"],
    #    library_dirs=["src/raylib5/libs"],
    #    libraries=["raylib"],  # Add any necessary libraries here
    #    extra_compile_args=[],
    # )
]

setup(
    name='raylib-cython',
    version='5.0.0',
    url='https://github.com/Le-o-n/raylib-cython',
    description='Cython bindings for the raylib game engine.',
    license='MIT',
    author='Leon Bass',
    ext_modules=cythonize(extensions),
    compiler_directives={"language_level": "3"},
)
