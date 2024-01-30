cimport ctypes

cdef extern from "../raylib5/raylib.h":
    ctypedef struct Vector2:
        float x
        float y

    ctypedef struct Vector3:
        float x
        float y
        float z

    ctypedef struct Vector4:
        float x
        float y
        float z
        float w

    ctypedef Vector4 Quaternion

    ctypedef struct Matrix:
        float m0, m4, m8, m12
        float m1, m5, m9, m13
        float m2, m6, m10, m14
        float m3, m7, m11, m15
    
    cdef double PI

    cdef double DEG2RAD

    cdef double RAD2DEG
