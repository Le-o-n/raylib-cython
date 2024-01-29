from setuptools import setup, find_packages
from Cython.Build import cythonize

with open('requirements.txt') as f:
    install_requires = f.read().strip().split('\n')

setup(
    name='raylib-cython',
    version='5.0.0',
    packages=find_packages(),
    ext_modules=cythonize("src/raylib.pyx"),
    install_requires=install_requires,
)
