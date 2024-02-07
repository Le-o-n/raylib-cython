from setuptools import find_packages, setup, Extension
from Cython.Build import cythonize
import os


directory_path: str = os.path.abspath(".")


def remove_file_extensions(
    dir_path: str,
    extensions: list[str] = []
):
    for file_name in os.listdir(dir_path):
        ext = file_name.split(".")[-1]
        if ext in extensions:
            full_path: str = os.path.join(directory_path, file_name)
            if os.path.exists(full_path):
                os.remove(full_path)
                print(f"Removed: {file_name}")


remove_file_extensions(directory_path, ["c", "pyd"])

extensions = [
    Extension(
        "raylib",
        [
            "raylib.pyx",
        ],
        include_dirs=["./libs"],
        library_dirs=["./libs"],
        libraries=["./libs/raylib"],  # Add any necessary libraries here
        extra_compile_args=[],  # Add any necessary compile flags here
    ),
    Extension(
        "raymath",
        [
            "raymath.pyx"
        ],
        include_dirs=["./libs"],
        library_dirs=["./libs"],
        libraries=["./libs/raylib"],  # Add any necessary libraries here
        extra_compile_args=[],  # Add any necessary compile flags here
        
    ),
    Extension(
        "rlgl",
        [
            "rlgl.pyx"
        ],
        include_dirs=["./libs"],
        library_dirs=["./libs"],
        libraries=["./libs/raylib"],  # Add any necessary libraries here
        extra_compile_args=[],  # Add any necessary compile flags here
    ),

]

setup(
    name='raylib-cython',
    version='5.0.0',
    url='https://github.com/Le-o-n/raylib-cython',
    description='Cython bindings for the raylib game engine.',
    license='MIT',
    author='Leon Bass',
    packages=find_packages(),
    package_dir={'': '.'},
    include_package_data=True,
    ext_modules=cythonize(extensions),
    compiler_directives={"language_level": "3"},
    
    
)

remove_file_extensions(directory_path, ["c"])
