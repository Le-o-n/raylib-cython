from setuptools import setup, find_packages
from Cython.Build import cythonize
import os

with open('requirements.txt') as f:
    install_requires = f.read().strip().split('\n')

setup(

    package_dir={
        "": "src/raylib_test"
    },

    ext_modules=cythonize(
        "src/raylib_test/test.pyx",
        include_path=["src"],
    ),
    include_dirs=["src"],
    

    install_requires=install_requires,
    compiler_directives={
        "language_level": "3"
    },

)
