import os
import pathlib
libdir = str(pathlib.Path("../../libs").absolute())
os.add_dll_directory(libdir)
