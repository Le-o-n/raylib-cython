from libc.stdint cimport uint8_t

cdef extern from "../raylib5/raylib.h":
    
    cdef double PI

    cdef double DEG2RAD

    cdef double RAD2DEG

    cdef void* RL_MALLOC(size_t sz)
    cdef void* RL_CALLOC(size_t n, size_t sz)
    cdef void* RL_REALLOC(void* ptr, size_t sz)
    cdef void RL_FREE(void* ptr)

    
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

    cdef Color LIGHTGRAY = { 200, 200, 200, 255 }   # Light Gray
    cdef Color GRAY      = { 130, 130, 130, 255 }   # Gray
    cdef Color DARKGRAY  = { 80, 80, 80, 255 }      # Dark Gray
    cdef Color YELLOW    = { 253, 249, 0, 255 }     # Yellow
    cdef Color GOLD      = { 255, 203, 0, 255 }     # Gold
    cdef Color ORANGE    = { 255, 161, 0, 255 }     # Orange
    cdef Color PINK      = { 255, 109, 194, 255 }   # Pink
    cdef Color RED       = { 230, 41, 55, 255 }     # Red
    cdef Color MAROON    = { 190, 33, 55, 255 }     # Maroon
    cdef Color GREEN     = { 0, 228, 48, 255 }      # Green
    cdef Color LIME      = { 0, 158, 47, 255 }      # Lime
    cdef Color DARKGREEN = { 0, 117, 44, 255 }      # Dark Green
    cdef Color SKYBLUE   = { 102, 191, 255, 255 }   # Sky Blue
    cdef Color BLUE      = { 0, 121, 241, 255 }     # Blue
    cdef Color DARKBLUE  = { 0, 82, 172, 255 }      # Dark Blue
    cdef Color PURPLE    = { 200, 122, 255, 255 }   # Purple
    cdef Color VIOLET    = { 135, 60, 190, 255 }    # Violet
    cdef Color DARKPURPLE= { 112, 31, 126, 255 }    # Dark Purple
    cdef Color BEIGE     = { 211, 176, 131, 255 }   # Beige
    cdef Color BROWN     = { 127, 106, 79, 255 }    # Brown
    cdef Color DARKBROWN = { 76, 63, 47, 255 }      # Dark Brown
    cdef Color WHITE     = { 255, 255, 255, 255 }   # White
    cdef Color BLACK     = { 0, 0, 0, 255 }         # Black
    cdef Color BLANK     = { 0, 0, 0, 0 }           # Blank (Transparent)
    cdef Color MAGENTA   = { 255, 0, 255, 255 }     # Magenta
    cdef Color RAYWHITE  = { 245, 245, 245, 255 }   # My own White (raylib logo)

    # Rectangle, 4 components
    ctypedef struct Rectangle:
        float x                 # Rectangle top-left corner position x
        float y                 # Rectangle top-left corner position y
        float width             # Rectangle width
        float height            # Rectangle height
    
    
