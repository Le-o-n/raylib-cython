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


# remove_file_extensions(directory_path, ["c", "pyd"])

raymath_extension: Extension = Extension(
    "raylib_cython.raymath",
    [
        "raymath.pyx"
    ],
    include_dirs=["./libs"],
    library_dirs=["./libs"],
    libraries=["./libs/raylib"],  # Add any necessary libraries here
    extra_compile_args=[],  # Add any necessary compile flags here

)
raylib_extension: Extension = Extension(
    "raylib_cython.raylib",
    [
        "raylib.pyx",
    ],
    include_dirs=["./libs", "."],
    library_dirs=["./libs"],
    libraries=["./libs/raylib"],  # Add any necessary libraries here
    extra_compile_args=[],  # Add any necessary compile flags here
)

rlgl_extension: Extension = Extension(
    "raylib_cython.rlgl",
    [
        "rlgl.pyx"
    ],
    include_dirs=["./libs"],
    library_dirs=["./libs"],
    libraries=["./libs/raylib"],  # Add any necessary libraries here
    extra_compile_args=[],  # Add any necessary compile flags here
)

extensions = [
    raymath_extension,
    raylib_extension,
    rlgl_extension,
]

setup(
    name='raylib-cython',
    version='5.0.0',
    url='https://github.com/Le-o-n/raylib-cython',
    description='Cython bindings for the raylib game engine.',
    license='MIT',
    author='Leon Bass',
    packages=['raylib_cython'],
    package_dir={'raylib_cython': '.'},
    package_data={
        'raylib_cython': [
            '*.pyx',
            '*.pxd',
            '*.pyi',
            "./libs/**.dll",
            "./libs/**.h",
            "./libs/**.lib",
        ],

    },
    exclude_package_data={
        'raylib_cython': [
            'main.py'
        ],
    },
    ext_modules=cythonize(extensions),
    compiler_directives={"language_level": "3"},


)

# remove_file_extensions(directory_path, ["c"])
