

def clamp(float value, float min, float max) -> float:
    return Clamp(value, min, max)

def lerp(float start, float end, float amount) -> float:
    return Lerp(start, end, amount)

def normalize(float value, float start, float end) -> float:
    return Normalize(value, start, end)

def remap(float value, float input_start, float input_end, float output_start, float output_end):
    return Remap(value, input_start, input_end, output_start, output_end)

def wrap(float value, float min, float max) -> float:
    return Wrap(value, min, max)

def float_equals(float x, float y) -> int:
    return FloatEquals(x, y)

cdef class CyVector2:
    

    def __cinit__(self, float x = 0.0, float y = 0.0):
        self._vector.x = x
        self._vector.y = y

    cpdef CyVector2 copy(self):
        cdef CyVector2 vec = CyVector2.__new__(CyVector2)
        vec._vector.x = self._vector.x
        vec._vector.y = self._vector.y
        return vec

    @property
    def x(self) -> float:
        return self._vector.x

    @x.setter
    def x(self, value: float) -> None:
        self._vector.x = value
    
    @property
    def y(self) -> float:
        return self._vector.y

    @y.setter
    def y(self, value: float) -> None:
        self._vector.y = value
    

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
    
    def __str__(self) -> str:
        string = f"Vec2<{self._vector.x}, {self._vector.y}>" 
        return string

    def __repr__(self) -> str:
        string = f"Vec2_{id(self)}<{self._vector.x}, {self._vector.y}>" 
        return string


cdef class CyVector3:

    def __cinit__(self, float x = 0.0, float y = 0.0, float z = 0.0):
        self._vector.x = x
        self._vector.y = y
        self._vector.z = z

    cpdef CyVector3 copy(self):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x = self._vector.x
        vec._vector.y = self._vector.y
        vec._vector.z = self._vector.z
        return vec

    @property
    def x(self) -> float:
        return self._vector.x

    @x.setter
    def x(self, value: float) -> None:
        self._vector.x = value
    
    @property
    def y(self) -> float:
        return self._vector.y

    @y.setter
    def y(self, value: float) -> None:
        self._vector.y = value
    
    @property
    def z(self) -> float:
        return self._vector.z

    @z.setter
    def z(self, value: float) -> None:
        self._vector.z = value

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
    cpdef CyVector3 ortho_normalize(self, CyVector3 other):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector.x = self._vector.x
        vec._vector.y = self._vector.y
        vec._vector.z = self._vector.z
        Vector3OrthoNormalize(&vec._vector, &other._vector)
        return vec
    
    # TODO TEST
    cpdef CyVector3 ortho_normalize_inplace(self, CyVector3 other):
        Vector3OrthoNormalize(&self._vector, &other._vector)
        return self
    
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
    

cdef class CyQuaternion:

    def __cinit__(self, float x = 0.0, float y = 0.0, float z = 0.0, float w = 0.0):
        self._vector.x = 0.0
        self._vector.y = 0.0
        self._vector.z = 0.0
        self._vector.w = 0.0

    cpdef CyQuaternion copy(self):
        cdef CyQuaternion vec = CyQuaternion.__new__(CyQuaternion)
        vec._vector.x = self._vector.x
        vec._vector.y = self._vector.y
        vec._vector.z = self._vector.z
        vec._vector.w = self._vector.w
        return vec
        
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
    # TODO TEST
    cpdef CyQuaternion add(self, CyQuaternion other):
        cdef CyQuaternion vec = CyQuaternion.__new__(CyQuaternion)
        vec._vector.x = self._vector.x + other._vector.x
        vec._vector.y = self._vector.y + other._vector.y 
        vec._vector.z = self._vector.z + other._vector.z
        vec._vector.w = self._vector.w + other._vector.w
        return vec
    
    # TODO TEST
    cpdef CyQuaternion add_inplace(self, CyQuaternion other):
        self._vector.x = self._vector.x + other._vector.x
        self._vector.y = self._vector.y + other._vector.y 
        self._vector.z = self._vector.z + other._vector.z
        self._vector.w = self._vector.w + other._vector.w
        return self
    
    # TODO TEST
    cpdef CyQuaternion add_value(self, float value):
        cdef CyQuaternion vec = CyQuaternion.__new__(CyQuaternion)
        vec._vector.x = self._vector.x + value
        vec._vector.y = self._vector.y + value
        vec._vector.z = self._vector.z + value
        vec._vector.w = self._vector.w + value
        return vec
    
    # TODO TEST
    cpdef CyQuaternion add_value_inplace(self, float value):
        self._vector.x = self._vector.x + value
        self._vector.y = self._vector.y + value
        self._vector.z = self._vector.z + value
        self._vector.w = self._vector.w + value
        return self
    
    # TODO TEST
    cpdef CyQuaternion subtract(self, CyQuaternion other):
        cdef CyQuaternion vec = CyQuaternion.__new__(CyQuaternion)
        vec._vector.x = self._vector.x - other._vector.x
        vec._vector.y = self._vector.y - other._vector.y 
        vec._vector.z = self._vector.z - other._vector.z
        vec._vector.w = self._vector.w - other._vector.w
        return vec
    
    # TODO TEST
    cpdef CyQuaternion subtract_inplace(self, CyQuaternion other):
        self._vector.x = self._vector.x - other._vector.x
        self._vector.y = self._vector.y - other._vector.y 
        self._vector.z = self._vector.z - other._vector.z
        self._vector.w = self._vector.w - other._vector.w
        return self

    # TODO TEST
    cpdef CyQuaternion subtract_value(self, float value):
        cdef CyQuaternion vec = CyQuaternion.__new__(CyQuaternion)
        vec._vector.x = self._vector.x - value
        vec._vector.y = self._vector.y - value
        vec._vector.z = self._vector.z - value
        vec._vector.w = self._vector.w - value
        return vec

    # TODO TEST
    cpdef CyQuaternion subtract_value_inplace(self, float value):
        self._vector.x = self._vector.x - value
        self._vector.y = self._vector.y - value
        self._vector.z = self._vector.z - value
        self._vector.w = self._vector.w - value
        return self
    
    @staticmethod
    cdef CyQuaternion c_identity():
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionIdentity()
        return q

    @staticmethod
    def identity() -> CyQuaternion:
        return CyQuaternion.c_identity()

    # TODO TEST
    cpdef float length(self):
        return QuaternionLength(self._vector)

    # TODO TEST
    cpdef CyQuaternion normalize(self):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionNormalize(self._vector)
        return q
    
    # TODO TEST
    cpdef CyQuaternion normalize_inplace(self):
        self._vector = QuaternionNormalize(self._vector)
        return self
    
    # TODO TEST
    cpdef CyQuaternion invert(self):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionInvert(self._vector)
        return q
    
    # TODO TEST
    cpdef CyQuaternion invert_inplace(self):
        self._vector = QuaternionInvert(self._vector)
        return self
    
    # TODO TEST
    cpdef CyQuaternion multiply(self, CyQuaternion other):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionMultiply(self._vector, other._vector)
        return q
    
    # TODO TEST
    cpdef CyQuaternion multiply_inplace(self, CyQuaternion other):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionMultiply(self._vector, other._vector)
        return q
    
    # TODO TEST
    cpdef CyQuaternion scale(self, float mul):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionScale(self._vector, mul)
        return q
    
    # TODO TEST
    cpdef CyQuaternion scale_inplace(self, float mul):
        self._vector = QuaternionScale(self._vector, mul)
        return self
    
    # TODO TEST
    cpdef CyQuaternion divide(self, CyQuaternion other):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionDivide(self._vector, other._vector)
        return q
    
    # TODO TEST
    cpdef CyQuaternion divide_inplace(self, CyQuaternion other):
        self._vector = QuaternionDivide(self._vector, other._vector)
        return self
    
    # TODO TEST
    cpdef CyQuaternion lerp(self, CyQuaternion other, float amount):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionLerp(self._vector, other._vector, amount)
        return q
    
    # TODO TEST
    cpdef CyQuaternion lerp_inplace(self, CyQuaternion other, float amount):
        self._vector = QuaternionLerp(self._vector, other._vector, amount)
        return self
    
    # TODO TEST
    cpdef CyQuaternion nlerp(self, CyQuaternion other, float amount):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionNlerp(self._vector, other._vector, amount)
        return q
    
    # TODO TEST
    cpdef CyQuaternion nlerp_inplace(self, CyQuaternion other, float amount):
        self._vector = QuaternionNlerp(self._vector, other._vector, amount)
        return self
    
    # TODO TEST
    cpdef CyQuaternion slerp(self, CyQuaternion other, float amount):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionSlerp(self._vector, other._vector, amount)
        return q
    
    # TODO TEST
    cpdef CyQuaternion slerp_inplace(self, CyQuaternion other, float amount):
        self._vector = QuaternionSlerp(self._vector, other._vector, amount)
        return self
    
    # TODO TEST
    @staticmethod
    cdef CyQuaternion c_from_vector3_to_vector3(CyVector3 from_vec, CyVector3 to_vec):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionFromVector3ToVector3(from_vec._vector, to_vec._vector)
        return q
    
    # TODO TEST
    @staticmethod
    def from_vector3_to_vector3(CyVector3 from_vec, CyVector3 to_vec) -> CyQuaternion:
        return CyQuaternion.c_from_vector3_to_vector3(from_vec, to_vec)

    # TODO TEST
    @staticmethod
    cdef CyQuaternion c_from_matrix(CyMatrix mat):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionFromMatrix(mat._matrix)
        return q
    
    # TODO TEST
    @staticmethod
    def from_matrix(CyMatrix mat) -> CyQuaternion:
        return CyQuaternion.c_from_matrix(mat)
    
    # TODO TEST
    cpdef CyMatrix to_matrix(self):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix)
        mat._matrix = QuaternionToMatrix(self._vector)
        return mat

    # TODO TEST
    @staticmethod
    cdef CyQuaternion c_from_axis_angle(CyVector3 axis, float angle):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionFromAxisAngle(axis._vector, angle)
        return q
    
    # TODO TEST
    @staticmethod
    def from_axis_angle(CyVector3 axis, float angle) -> CyQuaternion:
        return CyQuaternion.c_from_axis_angle(axis, angle)
    
    # TODO TEST
    cdef void c_to_axis_angle(self, CyVector3 out_axis, float out_angle):
        QuaternionToAxisAngle(
            self._vector,
             &out_axis._vector,
             &out_angle
        )
    
    # TODO TEST
    def to_axis_angle(self) -> tuple[CyVector3, float]:
        cdef CyVector3 out_axis = CyVector3.__new__(CyVector3)
        cdef float out_angle
        QuaternionToAxisAngle(self._vector, &out_axis._vector, &out_angle)
        return (out_axis, out_angle)
        
    # TODO TEST
    @staticmethod
    cdef CyQuaternion c_from_euler(float pitch, float yaw, float roll):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionFromEuler(pitch, yaw, roll)
        return q
    
    # TODO TEST
    @staticmethod
    def from_euler(float pitch, float yaw, float roll) -> CyQuaternion:
        return CyQuaternion.c_from_euler(pitch, yaw, roll)
    
    # TODO TEST
    cpdef CyVector3 to_euler(self):
        cdef CyVector3 vec = CyVector3.__new__(CyVector3)
        vec._vector = QuaternionToEuler(self._vector) 
        return vec

    # TODO TEST
    cpdef CyQuaternion transform(self, CyMatrix mat):
        cdef CyQuaternion q = CyQuaternion.__new__(CyQuaternion)
        q._vector = QuaternionTransform(self._vector, mat._matrix) 
        return q
    
    # TODO TEST
    cpdef CyQuaternion transform_inplace(self, CyMatrix mat):
        self._vector = QuaternionTransform(self._vector, mat._matrix) 
        return self
    
    # TODO TEST
    cpdef int equals(self, CyQuaternion other):
        return QuaternionEquals(self._vector, other._vector)
    
    
cdef class CyVector4(CyQuaternion):
    ...


cdef class CyMatrix:

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
    
    cpdef CyMatrix copy(self):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix)
        mat._matrix.m0 = self._matrix.m0
        mat._matrix.m1 = self._matrix.m1
        mat._matrix.m2 = self._matrix.m2
        mat._matrix.m3 = self._matrix.m3
        mat._matrix.m4 = self._matrix.m4
        mat._matrix.m5 = self._matrix.m5
        mat._matrix.m6 = self._matrix.m6
        mat._matrix.m7 = self._matrix.m7
        mat._matrix.m8 = self._matrix.m8
        mat._matrix.m9 = self._matrix.m9
        mat._matrix.m10 = self._matrix.m10
        mat._matrix.m11 = self._matrix.m11
        mat._matrix.m12 = self._matrix.m12
        mat._matrix.m13 = self._matrix.m13
        mat._matrix.m14 = self._matrix.m14
        mat._matrix.m15 = self._matrix.m15
        return mat

    cpdef float get_element(self, int row, int col):
        return (&self._matrix.m0)[row * 4 + col]
    
    cpdef void set_element(self, int row, int col, float value):
        cdef float* float_ptr = &((<float*>&self._matrix.m0)[row * 4 + col])
        float_ptr[0] = value

    # TODO TEST
    cpdef float determinant(self):
        return MatrixDeterminant(self._matrix)
    
    # TODO TEST
    cpdef float trace(self):
        return MatrixTrace(self._matrix)

    # TODO TEST
    cpdef CyMatrix transpose(self):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixTranspose(self._matrix)
        return mat
    
    # TODO TEST
    cpdef CyMatrix transpose_inplace(self):
        self._matrix = MatrixTranspose(self._matrix)
        return self

    # TODO TEST
    cpdef CyMatrix invert(self):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixInvert(self._matrix)
        return mat
    
    # TODO TEST
    cpdef CyMatrix invert_inplace(self):
        self._matrix = MatrixInvert(self._matrix)
        return self

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_identity():
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixIdentity()
        return mat
    
    @staticmethod
    def identity() -> CyMatrix:
        return CyMatrix.c_identity()

    # TODO TEST
    cpdef CyMatrix add(self, CyMatrix right):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixAdd(self._matrix, right._matrix)
        return mat
    
    # TODO TEST
    cpdef CyMatrix add_inplace(self, CyMatrix right):
        self._matrix = MatrixAdd(self._matrix, right._matrix)
        return self
    
    # TODO TEST
    cpdef CyMatrix subtract(self, CyMatrix right):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixSubtract(self._matrix, right._matrix)
        return mat
    
    # TODO TEST
    cpdef CyMatrix subtract_inplace(self, CyMatrix right):
        self._matrix = MatrixSubtract(self._matrix, right._matrix)
        return self
    
    # TODO TEST
    cpdef CyMatrix multiply(self, CyMatrix right):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixMultiply(self._matrix, right._matrix)
        return mat
    
    # TODO TEST
    cpdef CyMatrix multiply_inplace(self, CyMatrix right):
        self._matrix = MatrixMultiply(self._matrix, right._matrix)
        return self
    
    # TODO TEST
    @staticmethod
    cdef CyMatrix c_translate(float x, float y, float z):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixTranslate(x, y, z)
        return mat
    
    # TODO TEST
    @staticmethod
    def translate(float x, float y, float z) -> CyMatrix:
        return CyMatrix.c_translate(x, y, z)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_rotate(CyVector3 axis, float angle):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixRotate(axis._vector, angle)
        return mat

    # TODO TEST
    @staticmethod
    def rotate(CyVector3 axis, float angle) -> CyMatrix:
        return CyMatrix.c_rotate(axis, angle)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_rotate_x(float angle):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixRotateX(angle)
        return mat

    # TODO TEST
    @staticmethod
    def rotate_x(float angle) -> CyMatrix:
        return CyMatrix.c_rotate_x(angle)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_rotate_y(float angle):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixRotateY(angle)
        return mat

    # TODO TEST
    @staticmethod
    def rotate_y(float angle) -> CyMatrix:
        return CyMatrix.c_rotate_y(angle)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_rotate_z(float angle):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixRotateZ(angle)
        return mat

    # TODO TEST
    @staticmethod
    def rotate_z(float angle) -> CyMatrix:
        return CyMatrix.c_rotate_z(angle)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_rotate_xyz(CyVector3 angle):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixRotateXYZ(angle._vector)
        return mat

    # TODO TEST
    @staticmethod
    def rotate_xyz(CyVector3 angle) -> CyMatrix:
        return CyMatrix.c_rotate_xyz(angle)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_rotate_zyx(CyVector3 angle):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixRotateZYX(angle._vector)
        return mat

    # TODO TEST
    @staticmethod
    def rotate_zyx(CyVector3 angle) -> CyMatrix:
        return CyMatrix.c_rotate_zyx(angle)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_scale(float x, float y, float z):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixScale(x, y, z)
        return mat

    # TODO TEST
    @staticmethod
    def scale(float x, float y, float z) -> CyMatrix:
        return CyMatrix.c_scale(x, y, z)
    
    # TODO TEST
    @staticmethod
    cdef CyMatrix c_frustrum(double left, double right, double bottom, double top, double near, double far):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixFrustum(left, right, bottom, top, near, far)
        return mat

    # TODO TEST
    @staticmethod
    def frustrum(double left, double right, double bottom, double top, double near, double far) -> CyMatrix:
        return CyMatrix.c_frustrum(left, right, bottom, top, near, far)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_perspective(double fov_y, double aspect, double near_plane, double far_plane):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixPerspective(fov_y, aspect, near_plane, far_plane)
        return mat

    # TODO TEST
    @staticmethod
    def perspective(double fov_y, double aspect, double near_plane, double far_plane) -> CyMatrix:
        return CyMatrix.perspective(fov_y, aspect, near_plane, far_plane)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_orthogonal(double left, double right, double bottom, double top, double near_plane, double far_plane):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixOrtho(left, right, bottom, top, near_plane, far_plane)
        return mat

    # TODO TEST
    @staticmethod
    def orthogonal(double left, double right, double bottom, double top, double near_plane, double far_plane) -> CyMatrix:
        return CyMatrix.c_orthogonal(left, right, bottom, top, near_plane, far_plane)

    # TODO TEST
    @staticmethod
    cdef CyMatrix c_look_at(CyVector3 eye, CyVector3 target, CyVector3 up):
        cdef CyMatrix mat = CyMatrix.__new__(CyMatrix) 
        mat._matrix = MatrixLookAt(eye._vector, target._vector, up._vector)
        return mat

    # TODO TEST
    @staticmethod
    def look_at(CyVector3 eye, CyVector3 target, CyVector3 up) -> CyMatrix:
        return CyMatrix.c_look_at(eye, target, up)

    cpdef CyFloat16 to_float16(self):
        return CyFloat16.from_float16(<float16*>(&self._matrix.m0))

    def __str__(self) -> str:
        mat_string = f"Matrix["
        mat_string = f"{mat_string}\n\t{self._matrix.m0}\t{self._matrix.m4}\t{self._matrix.m8}\t{self._matrix.m12}"
        mat_string = f"{mat_string}\n\t{self._matrix.m1}\t{self._matrix.m5}\t{self._matrix.m9}\t{self._matrix.m13}"
        mat_string = f"{mat_string}\n\t{self._matrix.m2}\t{self._matrix.m6}\t{self._matrix.m10}\t{self._matrix.m14}"
        mat_string = f"{mat_string}\n\t{self._matrix.m3}\t{self._matrix.m7}\t{self._matrix.m11}\t{self._matrix.m15}"
        mat_string = f"{mat_string}\n]"
        return str(mat_string)

cdef class CyFloat3:
    
    def __cinit__(self):
        self._floats.v[0] = 0
        self._floats.v[1] = 0
        self._floats.v[2] = 0
    
    cpdef float get_float(self, int index):
        return self._floats.v[index]
    
    cpdef void set_float(self, int index, float f):
        self._floats.v[index] = f


cdef class CyFloat16:
    
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
    

