import os
import pathlib
__dir_path = os.path.dirname(os.path.realpath(__file__))
__libdir = str(pathlib.Path(os.path.join(__dir_path, "libs")).absolute())
os.add_dll_directory(__libdir)
