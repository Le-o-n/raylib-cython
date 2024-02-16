
cdef class CyVector2:
    cdef Vector2 _vector

    def __cinit__(self, float x = 0.0, float y = 0.0):
        self._vector.x = x
        self._vector.y = y

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
    cpdef CyVector2 scale(self, float scalar):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector.x = self._vector.x * scalar
        return vec

    # TODO TEST
    cpdef CyVector2 scale_inplace(self, float scalar):
        self._vector.x *= scalar
        self._vector.y *= scalar
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
    cpdef float length(self):
        return Vector2Length(self._vector)

    # TODO TEST
    cpdef float length_sqr(self):
        return Vector2LengthSqr(self._vector)

    # TODO TEST
    cpdef float dot(self, CyVector2 other):
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
        self._vector.x = 1/self._vector.x
        self._vector.y = 1/self._vector.y
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

    def __cinit__(self, float x = 0.0, float y = 0.0, float z = 0.0):
        self._vector.x = x
        self._vector.y = y
        self._vector.z = z

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

    # TODO TEST
    cpdef CyVector3 add_value(self, float value):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x = self._vector.x + value 
        vec._vector.y = self._vector.y + value
        vec._vector.z = self._vector.z + value
        return vec

    # TODO TEST
    cpdef CyVector3 add(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x += other._vector.x 
        vec._vector.y += other._vector.y
        vec._vector.z += other._vector.z
        return vec

    # TODO TEST 
    cpdef CyVector3 add_value_inplace(self, float value):
        self._vector.x += value
        self._vector.y += value
        self._vector.z += value
        return self
    
    # TODO TEST 
    cpdef CyVector3 add_inplace(self, CyVector3 other):
        self._vector.x += other._vector.x
        self._vector.y += other._vector.y
        self._vector.z += other._vector.z
        return self

    # TODO TEST
    cpdef CyVector3 sub_value(self, float value):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x = self._vector.x - value 
        vec._vector.y = self._vector.y - value
        vec._vector.z = self._vector.z - value
        return vec

    # TODO TEST
    cpdef CyVector3 sub(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x -= other._vector.x 
        vec._vector.y -= other._vector.y
        vec._vector.z -= other._vector.z
        return vec

    # TODO TEST 
    cpdef CyVector3 sub_value_inplace(self, float value):
        self._vector.x -= value
        self._vector.y -= value
        self._vector.z -= value
        return self
    
    # TODO TEST 
    cpdef CyVector3 sub_inplace(self, CyVector3 other):
        self._vector.x -= other._vector.x
        self._vector.y -= other._vector.y
        self._vector.z -= other._vector.z
        return self

    # TODO TEST
    cpdef CyVector3 scale(self, float scalar):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x *= scalar
        vec._vector.y *= scalar
        vec._vector.z *= scalar
        return vec
    
    # TODO TEST
    cpdef CyVector3 scale_inplace(self, float scalar):
        self._vector.x *= scalar
        self._vector.y *= scalar
        self._vector.z *= scalar
        return self

    # TODO TEST
    cpdef CyVector3 mul(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x = self._vector.x * other._vector.x
        vec._vector.y = self._vector.y * other._vector.y
        vec._vector.z = self._vector.z * other._vector.z
        return vec
    
    # TODO TEST
    cpdef CyVector3 mul_inplace(self, CyVector3 other):
        self._vector.x *= other._vector.x
        self._vector.y *= other._vector.y
        self._vector.z *= other._vector.z
        return self

    # TODO TEST
    cpdef CyVector3 div(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x = self._vector.x / other._vector.x
        vec._vector.y = self._vector.y / other._vector.y
        return vec

    # TODO TEST
    cpdef CyVector3 div_inplace(self, CyVector3 other):
        self._vector.x = self._vector.x / other._vector.x
        self._vector.y = self._vector.y / other._vector.y
        return self

    # TODO TEST
    cpdef CyVector3 cross_product(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3CrossProduct(self._vector, other._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 cross_product_inplace(self, CyVector3 other):
        self._vector = Vector3CrossProduct(self._vector, other._vector)
        return self

    # TODO TEST
    cpdef CyVector3 perpendicular(self):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Perpendicular(self._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 perpendicular_inplace(self):
        self._vector = Vector3Perpendicular(self._vector)
        return self

    # TODO TEST
    cpdef float length(self):
        return Vector3Length(self._vector)

    # TODO TEST
    cpdef float length_sqr(self):
        return Vector3LengthSqr(self._vector)

    # TODO TEST
    cpdef float dot(self, CyVector3 other):
        return Vector3DotProduct(self._vector, other._vector)
        
    # TODO TEST
    cpdef float distance(self, CyVector3 other):
        return Vector3Distance(self._vector, other._vector)

    # TODO TEST
    cpdef float distance_sqr(self, CyVector3 other):
        return Vector3DistanceSqr(self._vector, other._vector)

    # TODO TEST
    cpdef float angle(self, CyVector3 other):
        return Vector3Angle(self._vector, other._vector)

    # TODO TEST
    cpdef CyVector3 negate(self):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x = -self._vector.x
        vec._vector.y = -self._vector.y
        return vec

    # TODO TEST
    cpdef CyVector3 negate_inplace(self):
        self._vector.x = -self._vector.x
        self._vector.y = -self._vector.y
        return self

    
    # TODO TEST
    cpdef CyVector3 normalize(self):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Normalize(self._vector)
        return vec
        
    # TODO TEST
    cpdef CyVector3 normalize_inplace(self):
        self._vector = Vector3Normalize(self._vector)
        return self
    
    # TODO TEST
    cpdef CyVector3 project(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Project(self._vector, other._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 project_inplace(self, CyVector3 other):
        self._vector = Vector3Project(self._vector, other._vector)
        return self
    
    # TODO TEST
    cpdef CyVector3 reject(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Reject(self._vector, other._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 reject_inplace(self, CyVector3 other):
        self._vector = Vector3Reject(self._vector, other._vector)
        return self

    # TODO TEST
    #cpdef CyVector3 ortho_normalize(self, CyVector3 other):
    #    cdef CyVector3 vec = CyVector3.__new__(CyVector3)
    #    vec._vector = Vector3OrthoNormalize(&self._vector, &other._vector)
    #    return vec
    
    # TODO TEST
    #cpdef CyVector3 ortho_normalize_inplace(self, CyVector3 other):
    #    self._vector = Vector3OrthoNormalize(&self._vector, &other._vector)
    #    return self
    
    # TODO TEST
    cpdef CyVector3 transform(self, CyMatrix matrix):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Transform(self._vector, matrix._matrix)
        return vec
    
    # TODO TEST
    cpdef CyVector3 transform_inplace(self, CyMatrix matrix):
        self._vector = Vector3Transform(self._vector, matrix._matrix)
        return self

    # TODO TEST
    cpdef CyVector3 rotate_by_quaternion(self, CyQuaternion quaternion):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3RotateByQuaternion(self._vector, quaternion._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 rotate_by_quaternion_inplace(self, CyQuaternion quaternion):
        self._vector = Vector3RotateByQuaternion(self._vector, quaternion._vector)
        return self
    
    # TODO TEST
    cpdef CyVector3 rotate_by_axis_angle(self, CyVector3 axis, float angle):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3RotateByAxisAngle(self._vector, axis._vector, angle)
        return vec
    
    # TODO TEST
    cpdef CyVector3 rotate_by_axis_angle_inplace(self, CyVector3 axis, float angle):
        self._vector = Vector3RotateByAxisAngle(self._vector, axis._vector, angle)
        return self
    
    # TODO TEST
    cpdef CyVector3 lerp(self, CyVector3 target, float amount):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Lerp(self._vector, target._vector, amount)
        return vec
    
    # TODO TEST
    cpdef CyVector3 lerp_inplace(self, CyVector3 target, float amount):
        self._vector = Vector3Lerp(self._vector, target._vector, amount)
        return self
    
    # TODO TEST
    cpdef CyVector3 reflect(self, CyVector3 normal):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Reflect(self._vector, normal._vector)
        return vec

    # TODO TEST
    cpdef CyVector3 reflect_inplace(self, CyVector3 normal):
        self._vector = Vector3Reflect(self._vector, normal._vector)
        return self
    
    # INPLACE MAKE BELOW

    # TODO TEST
    cpdef CyVector3 min(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Min(self._vector, other._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 min_inplace(self, CyVector3 other):
        self._vector = Vector3Min(self._vector, other._vector)
        return self
    
    # TODO TEST
    cpdef CyVector3 max(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Max(self._vector, other._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 max_inplace(self, CyVector3 other):
        self._vector = Vector3Max(self._vector, other._vector)
        return self
    
    # TODO TEST 
    cpdef CyVector3 barycenter(self, CyVector3 a, CyVector3 b, CyVector3 c):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Barycenter(self._vector, a._vector, b._vector, c._vector)
        return vec
    
    # TODO TEST 
    cpdef CyVector3 barycenter_inplace(self, CyVector3 a, CyVector3 b, CyVector3 c):
        self._vector = Vector3Barycenter(self._vector, a._vector, b._vector, c._vector)
        return self
    
    # TODO TEST 
    cpdef CyVector3 unproject(self, CyMatrix projection, CyMatrix view):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Unproject(self._vector, projection._matrix, view._matrix)
        return vec

    # TODO TEST 
    cpdef CyVector3 unproject_inplace(self, CyMatrix projection, CyMatrix view):
        self._vector = Vector3Unproject(self._vector, projection._matrix, view._matrix)
        return self

    #TODO TEST this works
    cpdef CyFloat3 to_float3(self):
        cdef CyFloat3 float3_instance = CyFloat3.__new__(CyFloat3)
        float3_instance._floats = (<float3*>(&self._vector.x))[0]
        return float3_instance
    
    #TODO TEST this works
    cpdef CyVector3 invert(self):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Invert(self._vector)
        return vec
    
    #TODO TEST this works
    cpdef CyVector3 invert_inplace(self):
        self._vector = Vector3Invert(self._vector)
        return self
    
    #TODO TEST this works
    cpdef CyVector3 clamp(self, CyVector3 min, CyVector3 max):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Clamp(self._vector, min._vector, max._vector)
        return vec
    
    #TODO TEST this works
    cpdef CyVector3 clamp_inplace(self, CyVector3 min, CyVector3 max):
        self._vector = Vector3Clamp(self._vector, min._vector, max._vector)
        return self
    
    #TODO TEST this works
    cpdef CyVector3 clamp_value(self, float min, float max):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3ClampValue(self._vector, min, max)
        return vec
       
    #TODO TEST this works
    cpdef bint equals(self, CyVector3 other):
        return Vector3Equals(self._vector, other._vector)
    
    #TODO TEST this works
    cpdef CyVector3 refract(self, CyVector3 normal, float r):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = Vector3Refract(self._vector, normal._vector, r)
        return vec
    
    #TODO TEST this works
    cpdef CyVector3 refract_inplace(self, CyVector3 normal, float r):
        self._vector = Vector3Refract(self._vector, normal._vector, r)
        return self
    
    
    
def do_test():
    cdef Vector3 vec1
    vec1.x = 0
    vec1.y = 1
    vec1.z = 0

    cdef Vector3 vec2 = Vector3Invert(vec1)

    print(vec1.x)
    print(vec1.y)
    print(vec1.z)

    print(vec2.x)
    print(vec2.y)
    print(vec2.z)

     
    
    

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

