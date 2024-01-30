from setuptools import setup, find_packages
from Cython.Build import cythonize

with open('requirements.txt') as f:
    install_requires = f.read().strip().split('\n')

setup(
    name='raylib-cython',
    version='5.0.0',
    url='https://github.com/Le-o-n/raylib-cython',
    description='Cython bindings for the raylib game engine.',
    license='MIT',
    author='Leon Bass',
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    package_data={
        'raylib_cython': [
            '*.pyi',
            '*.pxd',
        ]
    },
    ext_modules=cythonize("src/raylib_cython/raylib.pyx"),
    install_requires=install_requires,
    compiler_directives={"language_level": "3"}

)
