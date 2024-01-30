from setuptools import setup, find_packages
from Cython.Build import cythonize
import os

with open('requirements.txt') as f:
    install_requires = f.read().strip().split('\n')

setup(
    name='raylib-cython',
    version='5.0.0',
    url='https://github.com/Le-o-n/raylib-cython',
    description='Cython bindings for the raylib game engine.',
    license='MIT',
    author='Leon Bass',
    
    package_dir={
        "": "src"
    },
    
    ext_modules=cythonize(
        "src/raylib_test/test.pyx",
    ),
    include_dirs=["src"],
    install_requires=install_requires,
    compiler_directives={
        "language_level": "3"
    },

)