from setuptools import setup, find_packages, Extension
from Cython.Build import cythonize

import os

with open('requirements.txt') as f:
    install_requires = f.read().strip().split('\n')

# Define the extension module
extensions = [
    Extension(
        "raylib_cython.raylib",
        ["src/raylib_cython/raylib.pyx"],
        include_dirs=["src/raylib5/src/"],
        library_dirs=["src/raylib5/src/"],
        libraries=[],  # Add any necessary libraries here
        extra_compile_args=["-std=c99"],  # Add any necessary compile flags here
    )
]

setup(
    name='raylib-cython',
    version='5.0.0',
    url='https://github.com/Le-o-n/raylib-cython',
    description='Cython bindings for the raylib game engine.',
    license='MIT',
    author='Leon Bass',
    packages=find_packages(where="src", include=["raylib_cython"]),
    package_dir={"": "src"},
    package_data={
        'raylib_cython': [
            'raylib.pyi',
            'raylib.pxd',
            'raylib.pyd'
        ]
    },
    ext_modules=cythonize(extensions),
    install_requires=install_requires,
    compiler_directives={"language_level": "3"},
)
