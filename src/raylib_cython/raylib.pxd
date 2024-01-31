cimport ctypes
from libc.stdint cimport uint8_t

cdef extern from "../raylib5/raylib.h":
    
    cdef double PI

    cdef double DEG2RAD

    cdef double RAD2DEG

    cdef void* RL_MALLOC(size_t sz)
    cdef void* RL_CALLOC(size_t n, size_t sz)
    cdef void* RL_REALLOC(void* ptr, size_t sz)
    cdef void RL_FREE(void* ptr)

    cdef Color LIGHTGRAY = Color(200, 200, 200, 255)

    # Vector2, 2 components
    ctypedef struct Vector2:
        float x                 # Vector x component
        float y                 # Vector y component

    # Vector3, 3 components
    ctypedef struct Vector3:
        float x                 # Vector x component
        float y                 # Vector y component
        float z                 # Vector z component

    # Vector4, 4 components
    ctypedef struct Vector4:
        float x                 # Vector x component
        float y                 # Vector y component
        float z                 # Vector z component
        float w                 # Vector w component

    # Quaternion, 4 components (Vector4 alias)
    ctypedef Vector4 Quaternion

    # Matrix, 4x4 components, column major, OpenGL style, right-handed
    ctypedef struct Matrix:
        float m0, m4, m8, m12   # Matrix first row (4 components)
        float m1, m5, m9, m13   # Matrix second row (4 components)
        float m2, m6, m10, m14  # Matrix third row (4 components)
        float m3, m7, m11, m15  # Matrix fourth row (4 components)

    # Color, 4 components, R8G8B8A8 (32bit)
    ctypedef struct Color:
        uint8_t r               # Color red value
        uint8_t g               # Color green value
        uint8_t b               # Color blue value
        uint8_t a               # Color alpha value

    # Rectangle, 4 components
    ctypedef struct Rectangle:
        float x                 # Rectangle top-left corner position x
        float y                 # Rectangle top-left corner position y
        float width             # Rectangle width
        float height            # Rectangle height
    
    
