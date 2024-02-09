
cdef class CyVector2:
    cdef Vector2 _vector

    def __cinit__(self):
        self._vector.x = 0.0
        self._vector.y = 0.0

    cpdef float get_x(self):
        return self._vector.x

    cpdef float get_y(self):
        return self._vector.y
    
    cpdef void set_x(self, float x_new):
        self._vector.x = x_new
    
    cpdef void set_y(self, float y_new):
        self._vector.y = y_new

cdef class CyVector3:
    cdef Vector3 _vector

    def __cinit__(self):
        self._vector.x = 0.0
        self._vector.y = 0.0
        self._vector.z = 0.0

    cpdef float get_x(self):
        return self._vector.x

    cpdef float get_y(self):
        return self._vector.y

    cpdef float get_z(self):
        return self._vector.z
    
    cpdef void set_x(self, float x_new):
        self._vector.x = x_new
    
    cpdef void set_y(self, float y_new):
        self._vector.y = y_new
    
    cpdef void set_z(self, float z_new):
        self._vector.z = z_new

    #TODO TEST this works
    cpdef CyFloat3 to_float3(self):
        cdef CyFloat3 float3_instance = CyFloat3.__new__(CyFloat3)
        float3_instance._floats = (<float3*>(&self._vector[0]))[0]
        return float3_instance

cdef class CyVector4:
    cdef Vector4 _vector

    def __cinit__(self):
        self._vector.x = 0.0
        self._vector.y = 0.0
        self._vector.z = 0.0
        self._vector.w = 0.0

    cpdef float get_x(self):
        return self._vector.x

    cpdef float get_y(self):
        return self._vector.y

    cpdef float get_z(self):
        return self._vector.z
    
    cpdef float get_w(self):
        return self._vector.w
    
    cpdef void set_x(self, float x_new):
        self._vector.x = x_new
    
    cpdef void set_y(self, float y_new):
        self._vector.y = y_new
    
    cpdef void set_z(self, float z_new):
        self._vector.z = z_new
    
    cpdef void set_w(self, float w_new):
        self._vector.w = w_new

cdef class CyQuaternion(CyVector4):
    pass

cdef class CyMatrix:
    cdef Matrix _matrix

    def __cinit__(self):
        self._matrix.m0 = 0
        self._matrix.m1 = 0
        self._matrix.m2 = 0
        self._matrix.m3 = 0
        self._matrix.m4 = 0
        self._matrix.m5 = 0
        self._matrix.m6 = 0
        self._matrix.m7 = 0
        self._matrix.m8 = 0
        self._matrix.m9 = 0
        self._matrix.m10 = 0
        self._matrix.m11 = 0
        self._matrix.m12 = 0
        self._matrix.m13 = 0
        self._matrix.m14 = 0
        self._matrix.m15 = 0
    
    cpdef float get_element(self, int row, int col):
        return (&self._matrix.m0)[row * 4 + col]
    
    cpdef void set_element(self, int row, int col, float value):
        cdef float* float_ptr = &((<float*>&self._matrix.m0)[row * 4 + col])
        float_ptr[0] = value

    cpdef CyFloat16 to_float16(self):
        return CyFloat16.from_float16(<float16*>(&self._matrix.m0))


cdef class CyFloat3:
    cdef float3 _floats

    def __cinit__(self):
        self._floats.v[0] = 0
        self._floats.v[1] = 0
        self._floats.v[2] = 0
    
    cpdef float get_float(self, int index):
        return self._floats.v[index]
    
    cpdef void set_float(self, int index, float f):
        self._floats.v[index] = f


cdef class CyFloat16:
    cdef float16 _floats

    def __cinit__(self):
        self._floats.v[0] = 0.0
        self._floats.v[1] = 0.0
        self._floats.v[2] = 0.0
        self._floats.v[3] = 0.0
        self._floats.v[4] = 0.0
        self._floats.v[5] = 0.0
        self._floats.v[6] = 0.0
        self._floats.v[7] = 0.0
        self._floats.v[8] = 0.0
        self._floats.v[9] = 0.0
        self._floats.v[10] = 0.0
        self._floats.v[11] = 0.0
        self._floats.v[12] = 0.0
        self._floats.v[13] = 0.0
        self._floats.v[14] = 0.0
        self._floats.v[15] = 0.0
    
    @staticmethod
    cdef CyFloat16 from_float16(float16* float16_ptr):
        cdef CyFloat16 cy_float16 = CyFloat16.__new__(CyFloat16)
        cy_float16._floats = float16_ptr[0]
        return cy_float16   
    
    cpdef float get_float(self, int index):
        return self._floats.v[index]
    
    cpdef void set_float(self, int index, float f):
        self._floats.v[index] = f

