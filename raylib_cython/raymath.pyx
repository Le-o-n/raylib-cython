
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
    
    #TODO Test
    cpdef CyVector2 add_value(self, float value):
        cdef CyVector2 result = CyVector2.__new__(CyVector2)
        result._vector.x = self._vector.x + value
        result._vector.y = self._vector.y + value
        return result

    # TODO Test
    cpdef CyVector2 add(self, CyVector2 other):
        cdef CyVector2 result = CyVector2.__new__(CyVector2)
        result._vector.x = self._vector.x + other._vector.x
        result._vector.y = self._vector.y + other._vector.y
        return result

    #TODO TEST
    cpdef CyVector2 add_value_inplace(self, float value):
        self._vector.x += value
        self._vector.y += value
        return self

    # TODO Test 
    cpdef CyVector2 add_inplace(self, CyVector2 other):
        self._vector.x += other._vector.x
        self._vector.y += other._vector.y
        return self

    #TODO Test
    cpdef CyVector2 sub_value(self, float value):
        cdef CyVector2 result = CyVector2.__new__(CyVector2)
        result._vector.x = self._vector.x - value
        result._vector.y = self._vector.y - value
        return result

    # TODO Test
    cpdef CyVector2 sub(self, CyVector2 other):
        cdef CyVector2 result = CyVector2.__new__(CyVector2)
        result._vector.x = self._vector.x - other._vector.x
        result._vector.y = self._vector.y - other._vector.y
        return result

    #TODO TEST
    cpdef CyVector2 sub_value_inplace(self, float value):
        self._vector.x -= value
        self._vector.y -= value
        return CyVector2

    # TODO Test 
    cpdef CyVector2 sub_inplace(self, CyVector2 other):
        self._vector.x -= other._vector.x
        self._vector.y -= other._vector.y
        return self

    # TODO TEST
    cpdef CyVector2 scale(self, float scale):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector.x = self._vector.x * scale
        return vec

    # TODO TEST
    cpdef CyVector2 scale_inplace(self, float scale):
        self._vector.x *= scale
        self._vector.y *= scale
        return self

    # TODO TEST
    cpdef CyVector2 mul(self, CyVector2 other):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Multiply(self._vector, other._vector)
        return vec

    # TODO TEST
    cpdef CyVector2 mul_inplace(self, CyVector2 other):
        self._vector.x *= other._vector.x 
        self._vector.y *= other._vector.y   
        return self

    # TODO TEST
    cpdef CyVector2 div_value(self, float value):
        return self.scale(1/value)
    
    # TODO TEST
    cpdef CyVector2 div_value_inplace(self, float value):
        return self.scale_inplace(1/value)

    # TODO TEST
    cpdef CyVector2 div(self, CyVector2 other):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Divide(self._vector, other._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector2 div_inplace(self, CyVector2 other):
        self._vector.x /= other._vector.x
        self._vector.y /= other._vector.y
        return self

    # TODO TEST
    cpdef float get_length(self):
        return Vector2Length(self._vector)

    # TODO TEST
    cpdef float get_length_sqr(self):
        return Vector2LengthSqr(self._vector)

    # TODO TEST
    cpdef float get_dot_product(self, CyVector2 other):
        return Vector2DotProduct(self._vector, other._vector)

    # TODO TEST
    cpdef float distance(self, CyVector2 other):
        return Vector2Distance(self._vector, other._vector)
    
    # TODO TEST
    cpdef float distance_sqr(self, CyVector2 other):
        return Vector2DistanceSqr(self._vector, other._vector)

    # TODO TEST
    cpdef float angle(self, CyVector2 other):
        return Vector2Angle(self._vector, other._vector)

    # TODO TEST
    cpdef float line_angle(self, CyVector2 other):
        return Vector2LineAngle(self._vector, other._vector)

    # TODO TEST
    cpdef CyVector2 negate(self):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector.x = -self._vector.x
        vec._vector.y = -self._vector.y
        return vec
    
    # TODO TEST
    cpdef CyVector2 negate_inplace(self):
        self._vector.x = -self._vector.x
        self._vector.y = -self._vector.y
        return self
    
    # TODO TEST
    cpdef CyVector2 normalize(self):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Normalize(self._vector)
        return vec

    # TODO TEST
    cpdef CyVector2 normalize_inplace(self):
        self._vector = Vector2Normalize(self._vector)
        return self
    
    # TODO TEST
    cpdef CyVector2 transform(self, CyMatrix matrix):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Transform(vec._vector, matrix._matrix)
        return vec
    
    # TODO TEST
    cpdef CyVector2 transform_inplace(self, CyMatrix matrix):
        self._vector = Vector2Transform(self._vector, matrix._matrix)
        return self
    
    # TODO TEST
    cpdef CyVector2 lerp(self, CyVector2 target, float amount):    
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Lerp(self._vector, target._vector, amount)
        return vec
    
    # TODO TEST
    cpdef CyVector2 lerp_inplace(self, CyVector2 target, float amount):    
        self._vector = Vector2Lerp(self._vector, target._vector, amount)
        return self
    
    # TODO TEST
    cpdef CyVector2 reflect(self, CyVector2 normal):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Reflect(self._vector, normal._vector)
        return vec

    # TODO TEST
    cpdef CyVector2 reflect_inplace(self, CyVector2 normal):
        self._vector = Vector2Reflect(self._vector, normal._vector)
        return self
    
    # TODO TEST
    cpdef CyVector2 rotate(self, float angle):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Rotate(self._vector, angle)
        return vec

    # TODO TEST
    cpdef CyVector2 rotate_inplace(self, float angle):
        self._vector = Vector2Rotate(self._vector, angle)
        return self

    # TODO TEST
    cpdef CyVector2 move_towards(self, CyVector2 target, float max_distance):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2MoveTowards(self._vector, target._vector, max_distance)
        return vec

    # TODO TEST
    cpdef CyVector2 move_towards_inplace(self, CyVector2 target, float max_distance):
        self._vector = Vector2MoveTowards(self._vector, target._vector, max_distance)
        return self
    
    # TODO TEST
    cpdef CyVector2 invert(self):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Invert(self._vector)
        return vec

    # TODO TEST
    cpdef CyVector2 invert_inplace(self):
        self._vector = Vector2Invert(self._vector)
        return self
    
    # TODO TEST
    cpdef CyVector2 clamp(self, CyVector2 min, CyVector2 max):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2Clamp(self._vector, min._vector, max._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector2 clamp_inplace(self, CyVector2 min, CyVector2 max):
        self._vector = Vector2Clamp(self._vector, min._vector, max._vector)
        return self
    
    # TODO TEST
    cpdef CyVector2 clamp_value(self, float min, float max):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector = Vector2ClampValue(self._vector, min, max)
        return vec
    
    # TODO TEST
    cpdef CyVector2 clamp_value_inplace(self, float min, float max):
        self._vector = Vector2ClampValue(self._vector, min, max)
        return self
        
    


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
        float3_instance._floats = (<float3*>(&self._vector.x))[0]
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

