
from src.raylib_cython.raylib cimport Vector2


cpdef void run():
    print("Running test")

    
    cdef Vector2 vec2

    vec2.x = 1
