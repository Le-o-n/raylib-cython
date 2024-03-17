


cdef extern from "libs/raymath.h":
    
    cdef double PI
    cdef float EPSILON
    cdef double DEG2RAD
    cdef double RAD2DEG

    ctypedef struct Vector2: # DONE
        float x
        float y

    ctypedef struct Vector3: # DONE
        float x
        float y
        float z
    
    ctypedef struct Vector4: # DONE
        float x
        float y
        float z
        float w

    ctypedef Vector4 Quaternion # DONE

    ctypedef struct Matrix: # DONE
        float m0, m4, m8, m12      # Matrix first row (4 components)
        float m1, m5, m9, m13      # Matrix second row (4 components)
        float m2, m6, m10, m14     # Matrix third row (4 components)
        float m3, m7, m11, m15     # Matrix fourth row (4 components)

    ctypedef struct float3: # DONE
        float v[3]
    
    ctypedef struct float16: # DONE
        float v[16]
    
    cdef float16 MatrixToFloat(Matrix mat) # DONE
    cdef float3 Vector3ToFloat(Vector3 vec) # DONE

    cdef float Clamp(float value, float min, float max)
    cdef float Lerp(float start, float end, float amount)
    cdef float Normalize(float value, float start, float end)
    cdef float Remap(float value, float inputStart, float inputEnd, float outputStart, float outputEnd)
    cdef float Wrap(float value, float min, float max)
    cdef int FloatEquals(float x, float y)
    cdef Vector2 Vector2Zero() # X
    cdef Vector2 Vector2One() # X
    cdef Vector2 Vector2Add(Vector2 v1, Vector2 v2) # DONE
    cdef Vector2 Vector2AddValue(Vector2 v, float add) # DONE
    cdef Vector2 Vector2Subtract(Vector2 v1, Vector2 v2) # DONE
    cdef Vector2 Vector2SubtractValue(Vector2 v, float sub) # DONE
    cdef float Vector2Length(Vector2 v) # DONE
    cdef float Vector2LengthSqr(Vector2 v) # DONE
    cdef float Vector2DotProduct(Vector2 v1, Vector2 v2) # DONE
    cdef float Vector2Distance(Vector2 v1, Vector2 v2) # DONE
    cdef float Vector2DistanceSqr(Vector2 v1, Vector2 v2) # DONE
    cdef float Vector2Angle(Vector2 v1, Vector2 v2) # DONE
    cdef float Vector2LineAngle(Vector2 start, Vector2 end) # DONE
    cdef Vector2 Vector2Scale(Vector2 v, float scale) # DONE
    cdef Vector2 Vector2Multiply(Vector2 v1, Vector2 v2) # DONE
    cdef Vector2 Vector2Negate(Vector2 v) # DONE
    cdef Vector2 Vector2Divide(Vector2 v1, Vector2 v2) # DONE
    cdef Vector2 Vector2Normalize(Vector2 v) # DONE
    cdef Vector2 Vector2Transform(Vector2 v, Matrix mat) # DONE
    cdef Vector2 Vector2Lerp(Vector2 v1, Vector2 v2, float amount) # DONE
    cdef Vector2 Vector2Reflect(Vector2 v, Vector2 normal) # DONE
    cdef Vector2 Vector2Rotate(Vector2 v, float angle) # DONE
    cdef Vector2 Vector2MoveTowards(Vector2 v, Vector2 target, float maxDistance) # DONE
    cdef Vector2 Vector2Invert(Vector2 v) # DONE
    cdef Vector2 Vector2Clamp(Vector2 v, Vector2 min, Vector2 max) # DONE
    cdef Vector2 Vector2ClampValue(Vector2 v, float min, float max) # DONE
    cdef int Vector2Equals(Vector2 p, Vector2 q) # DONE
    cdef Vector3 Vector3Zero() # DONE
    cdef Vector3 Vector3One() # DONE
    cdef Vector3 Vector3Add(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3AddValue(Vector3 v, float add) # DONE
    cdef Vector3 Vector3Subtract(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3SubtractValue(Vector3 v, float sub) # DONE
    cdef Vector3 Vector3Scale(Vector3 v, float scalar) # DONE
    cdef Vector3 Vector3Multiply(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3CrossProduct(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3Perpendicular(Vector3 v) # DONE
    cdef float Vector3Length(const Vector3 v) # DONE
    cdef float Vector3LengthSqr(const Vector3 v) # DONE
    cdef float Vector3DotProduct(Vector3 v1, Vector3 v2) # DONE
    cdef float Vector3Distance(Vector3 v1, Vector3 v2) # DONE
    cdef float Vector3DistanceSqr(Vector3 v1, Vector3 v2) # DONE
    cdef float Vector3Angle(Vector3 v1, Vector3 v2) #  DONE
    cdef Vector3 Vector3Negate(Vector3 v) # DONE
    cdef Vector3 Vector3Divide(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3Normalize(Vector3 v) # DONE
    cdef Vector3 Vector3Project(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3Reject(Vector3 v1, Vector3 v2) # DONE
    cdef void Vector3OrthoNormalize(Vector3 *v1, Vector3 *v2) # TODO
    cdef Vector3 Vector3Transform(Vector3 v, Matrix mat) # DONE
    cdef Vector3 Vector3RotateByQuaternion(Vector3 v, Quaternion q) # DONE
    cdef Vector3 Vector3RotateByAxisAngle(Vector3 v, Vector3 axis, float angle) # DONE
    cdef Vector3 Vector3Lerp(Vector3 v1, Vector3 v2, float amount) # DONE
    cdef Vector3 Vector3Reflect(Vector3 v, Vector3 normal) # DONE
    cdef Vector3 Vector3Min(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3Max(Vector3 v1, Vector3 v2) # DONE
    cdef Vector3 Vector3Barycenter(Vector3 p, Vector3 a, Vector3 b, Vector3 c) # DONE
    cdef Vector3 Vector3Unproject(Vector3 source, Matrix projection, Matrix view) # DONE
    cdef float3 Vector3ToFloatV(Vector3 v) # DONE
    cdef Vector3 Vector3Invert(Vector3 v)
    cdef Vector3 Vector3Clamp(Vector3 v, Vector3 min, Vector3 max) # DONE
    cdef Vector3 Vector3ClampValue(Vector3 v, float min, float max) # DONE
    cdef int Vector3Equals(Vector3 p, Vector3 q) # DONE
    cdef Vector3 Vector3Refract(Vector3 v, Vector3 n, float r) # DONE
    cdef float MatrixDeterminant(Matrix mat) # DONE
    cdef float MatrixTrace(Matrix mat) # DONE
    cdef Matrix MatrixTranspose(Matrix mat) # DONE
    cdef Matrix MatrixInvert(Matrix mat) # DONE
    cdef Matrix MatrixIdentity() # DONE
    cdef Matrix MatrixAdd(Matrix left, Matrix right) # DONE
    cdef Matrix MatrixSubtract(Matrix left, Matrix right) # DONE
    cdef Matrix MatrixMultiply(Matrix left, Matrix right) # DONE
    cdef Matrix MatrixTranslate(float x, float y, float z) # DONE
    cdef Matrix MatrixRotate(Vector3 axis, float angle) # DONE
    cdef Matrix MatrixRotateX(float angle) # DONE
    cdef Matrix MatrixRotateY(float angle) # DONE
    cdef Matrix MatrixRotateZ(float angle) # DONE
    cdef Matrix MatrixRotateXYZ(Vector3 angle) # DONE
    cdef Matrix MatrixRotateZYX(Vector3 angle) # DONE
    cdef Matrix MatrixScale(float x, float y, float z) # DONE
    cdef Matrix MatrixFrustum(double left, double right, double bottom, double top, double near, double far) # DONE
    cdef Matrix MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane) # DONE
    cdef Matrix MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane) # DONE
    cdef Matrix MatrixLookAt(Vector3 eye, Vector3 target, Vector3 up) # DONE
    cdef float16 MatrixToFloatV(Matrix mat) # DONE
    cdef Quaternion QuaternionAdd(Quaternion q1, Quaternion q2) # DONE
    cdef Quaternion QuaternionAddValue(Quaternion q, float add) # DONE
    cdef Quaternion QuaternionSubtract(Quaternion q1, Quaternion q2) # DONE
    cdef Quaternion QuaternionSubtractValue(Quaternion q, float sub) # DONE
    cdef Quaternion QuaternionIdentity() # DONE
    cdef float QuaternionLength(Quaternion q) # DONE
    cdef Quaternion QuaternionNormalize(Quaternion q) # DONE
    cdef Quaternion QuaternionInvert(Quaternion q) # DONE
    cdef Quaternion QuaternionMultiply(Quaternion q1, Quaternion q2) # DONE
    cdef Quaternion QuaternionScale(Quaternion q, float mul) # DONE
    cdef Quaternion QuaternionDivide(Quaternion q1, Quaternion q2) # DONE
    cdef Quaternion QuaternionLerp(Quaternion q1, Quaternion q2, float amount) # DONE
    cdef Quaternion QuaternionNlerp(Quaternion q1, Quaternion q2, float amount) # DONE
    cdef Quaternion QuaternionSlerp(Quaternion q1, Quaternion q2, float amount) # DONE
    cdef Quaternion QuaternionFromVector3ToVector3(Vector3 from_vec, Vector3 to_vec) # DONE
    cdef Quaternion QuaternionFromMatrix(Matrix mat) # DONE
    cdef Matrix QuaternionToMatrix(Quaternion q) # DONE
    cdef Quaternion QuaternionFromAxisAngle(Vector3 axis, float angle) # DONE
    cdef void QuaternionToAxisAngle(Quaternion q, Vector3 *outAxis, float *outAngle) # DONE
    cdef Quaternion QuaternionFromEuler(float pitch, float yaw, float roll) # DONE
    cdef Vector3 QuaternionToEuler(Quaternion q) # DONE
    cdef Quaternion QuaternionTransform(Quaternion q, Matrix mat) # DONE
    cdef int QuaternionEquals(Quaternion p, Quaternion q) # DONE

cdef class CyFloat3:
    cdef float3 _floats
    
    cpdef float get_float(CyFloat3 self, int index)
    cpdef void set_float(CyFloat3 self, int index, float f)

cdef class CyQuaternion:
    cdef Vector4 _vector

    cpdef CyQuaternion copy(CyQuaternion self)
    cpdef float get_x(CyQuaternion self)
    cpdef float get_y(CyQuaternion self)
    cpdef float get_z(CyQuaternion self)
    cpdef float get_w(CyQuaternion self)
    cpdef void set_x(CyQuaternion self, float x_new)
    cpdef void set_y(CyQuaternion self, float y_new)
    cpdef void set_z(CyQuaternion self, float z_new)
    cpdef void set_w(CyQuaternion self, float w_new)
    cpdef CyQuaternion add(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion add_inplace(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion add_value(CyQuaternion self, float value)
    cpdef CyQuaternion add_value_inplace(CyQuaternion self, float value)
    cpdef CyQuaternion subtract(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion subtract_inplace(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion subtract_value(CyQuaternion self, float value)
    cpdef CyQuaternion subtract_value_inplace(CyQuaternion self, float value)
    @staticmethod
    cdef CyQuaternion c_identity()
    cpdef float length(CyQuaternion self)
    cpdef CyQuaternion normalize(CyQuaternion self)
    cpdef CyQuaternion normalize_inplace(CyQuaternion self)
    cpdef CyQuaternion invert(CyQuaternion self)
    cpdef CyQuaternion invert_inplace(CyQuaternion self)
    cpdef CyQuaternion multiply(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion multiply_inplace(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion scale(CyQuaternion self, float mul)
    cpdef CyQuaternion scale_inplace(CyQuaternion self, float mul)
    cpdef CyQuaternion divide(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion divide_inplace(CyQuaternion self, CyQuaternion other)
    cpdef CyQuaternion lerp(CyQuaternion self, CyQuaternion other, float amount)
    cpdef CyQuaternion lerp_inplace(CyQuaternion self, CyQuaternion other, float amount)
    cpdef CyQuaternion nlerp(CyQuaternion self, CyQuaternion other, float amount)
    cpdef CyQuaternion nlerp_inplace(CyQuaternion self, CyQuaternion other, float amount)
    cpdef CyQuaternion slerp(CyQuaternion self, CyQuaternion other, float amount)
    cpdef CyQuaternion slerp_inplace(CyQuaternion self, CyQuaternion other, float amount)
    @staticmethod
    cdef CyQuaternion c_from_vector3_to_vector3(CyVector3 from_vec, CyVector3 to_vec)
    @staticmethod
    cdef CyQuaternion c_from_matrix(CyMatrix mat)
    cpdef CyMatrix to_matrix(CyQuaternion self)
    @staticmethod
    cdef CyQuaternion c_from_axis_angle(CyVector3 axis, float angle)
    cdef void c_to_axis_angle(CyQuaternion self, CyVector3 out_axis, float out_angle)
    @staticmethod
    cdef CyQuaternion c_from_euler(float pitch, float yaw, float roll)
    cpdef CyVector3 to_euler(CyQuaternion self)
    cpdef CyQuaternion transform(CyQuaternion self, CyMatrix mat)
    cpdef CyQuaternion transform_inplace(CyQuaternion self, CyMatrix mat)
    cpdef int equals(CyQuaternion self, CyQuaternion other)

cdef class CyVector3:
    cdef Vector3 _vector
    cpdef CyVector3 copy(CyVector3 self)
    cpdef float get_x(CyVector3 self)
    cpdef float get_y(CyVector3 self)
    cpdef float get_z(CyVector3 self)
    cpdef void set_x(CyVector3 self, float x_new)
    cpdef void set_y(CyVector3 self, float y_new)
    cpdef void set_z(CyVector3 self, float z_new)
    cpdef CyVector3 add_value(CyVector3 self, float value)
    cpdef CyVector3 add(CyVector3 self, CyVector3 other)
    cpdef CyVector3 add_value_inplace(CyVector3 self, float value)
    cpdef CyVector3 add_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 sub_value(CyVector3 self, float value)
    cpdef CyVector3 sub(CyVector3 self, CyVector3 other)
    cpdef CyVector3 sub_value_inplace(CyVector3 self, float value)
    cpdef CyVector3 sub_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 scale(CyVector3 self, float scalar)
    cpdef CyVector3 scale_inplace(CyVector3 self, float scalar)
    cpdef CyVector3 mul(CyVector3 self, CyVector3 other)
    cpdef CyVector3 mul_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 div(CyVector3 self, CyVector3 other)
    cpdef CyVector3 div_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 cross_product(CyVector3 self, CyVector3 other)
    cpdef CyVector3 cross_product_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 perpendicular(CyVector3 self)
    cpdef CyVector3 perpendicular_inplace(CyVector3 self)
    cpdef float length(CyVector3 self)
    cpdef float length_sqr(CyVector3 self)
    cpdef float dot(CyVector3 self, CyVector3 other)
    cpdef float distance(CyVector3 self, CyVector3 other)
    cpdef float distance_sqr(CyVector3 self, CyVector3 other)
    cpdef float angle(CyVector3 self, CyVector3 other)
    cpdef CyVector3 negate(CyVector3 self)
    cpdef CyVector3 negate_inplace(CyVector3 self)
    cpdef CyVector3 normalize(CyVector3 self)
    cpdef CyVector3 normalize_inplace(CyVector3 self)
    cpdef CyVector3 project(CyVector3 self, CyVector3 other)
    cpdef CyVector3 project_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 reject(CyVector3 self, CyVector3 other)
    cpdef CyVector3 reject_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 ortho_normalize(CyVector3 self, CyVector3 other)
    cpdef CyVector3 ortho_normalize_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 transform(CyVector3 self, CyMatrix matrix)
    cpdef CyVector3 transform_inplace(CyVector3 self, CyMatrix matrix)
    cpdef CyVector3 rotate_by_quaternion(CyVector3 self, CyQuaternion quaternion)
    cpdef CyVector3 rotate_by_quaternion_inplace(CyVector3 self, CyQuaternion quaternion)
    cpdef CyVector3 rotate_by_axis_angle(CyVector3 self, CyVector3 axis, float angle)
    cpdef CyVector3 rotate_by_axis_angle_inplace(CyVector3 self, CyVector3 axis, float angle)
    cpdef CyVector3 lerp(CyVector3 self, CyVector3 target, float amount)
    cpdef CyVector3 lerp_inplace(CyVector3 self, CyVector3 target, float amount)
    cpdef CyVector3 reflect(CyVector3 self, CyVector3 normal)
    cpdef CyVector3 reflect_inplace(CyVector3 self, CyVector3 normal)
    cpdef CyVector3 min(CyVector3 self, CyVector3 other)
    cpdef CyVector3 min_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 max(CyVector3 self, CyVector3 other)
    cpdef CyVector3 max_inplace(CyVector3 self, CyVector3 other)
    cpdef CyVector3 barycenter(CyVector3 self, CyVector3 a, CyVector3 b, CyVector3 c) 
    cpdef CyVector3 barycenter_inplace(CyVector3 self, CyVector3 a, CyVector3 b, CyVector3 c)
    cpdef CyVector3 unproject(CyVector3 self, CyMatrix projection, CyMatrix view)
    cpdef CyVector3 unproject_inplace(CyVector3 self, CyMatrix projection, CyMatrix view)
    cpdef CyFloat3 to_float3(CyVector3 self)
    cpdef CyVector3 invert(CyVector3 self)
    cpdef CyVector3 invert_inplace(CyVector3 self)
    cpdef CyVector3 clamp(CyVector3 self, CyVector3 min, CyVector3 max)
    cpdef CyVector3 clamp_inplace(CyVector3 self, CyVector3 min, CyVector3 max)
    cpdef CyVector3 clamp_value(CyVector3 self, float min, float max)
    cpdef bint equals(CyVector3 self, CyVector3 other)
    cpdef CyVector3 refract(CyVector3 self, CyVector3 normal, float r)
    cpdef CyVector3 refract_inplace(CyVector3 self, CyVector3 normal, float r)


cdef class CyFloat16:
    cdef float16 _floats
    
    @staticmethod
    cdef CyFloat16 from_float16(float16* float16_ptr)
    cpdef float get_float(CyFloat16 self, int index)
    cpdef void set_float(CyFloat16 self, int index, float f)
    


cdef class CyMatrix:
    cdef Matrix _matrix

    cpdef CyMatrix copy(CyMatrix self)
        
    cpdef float get_element(CyMatrix self, int row, int col)
        
    cpdef void set_element(CyMatrix self, int row, int col, float value)
        
    cpdef float determinant(CyMatrix self)
        
    cpdef float trace(CyMatrix self)
        
    cpdef CyMatrix transpose(CyMatrix self)
        
    cpdef CyMatrix transpose_inplace(CyMatrix self)
        
    cpdef CyMatrix invert(CyMatrix self)
        
    cpdef CyMatrix invert_inplace(CyMatrix self)
        
    @staticmethod
    cdef CyMatrix c_identity()
        
    cpdef CyMatrix add(CyMatrix self, CyMatrix right)
        
    cpdef CyMatrix add_inplace(CyMatrix self, CyMatrix right)
        
    cpdef CyMatrix subtract(CyMatrix self, CyMatrix right)
        
    cpdef CyMatrix subtract_inplace(CyMatrix self, CyMatrix right)
        
    cpdef CyMatrix multiply(CyMatrix self, CyMatrix right)
        
    cpdef CyMatrix multiply_inplace(CyMatrix self, CyMatrix right)
        
    @staticmethod
    cdef CyMatrix c_translate(float x, float y, float z)
        
    @staticmethod
    cdef CyMatrix c_rotate(CyVector3 axis, float angle)
        
    @staticmethod
    cdef CyMatrix c_rotate_x(float angle)
        
    @staticmethod
    cdef CyMatrix c_rotate_y(float angle)
        
    @staticmethod
    cdef CyMatrix c_rotate_z(float angle)
        
    @staticmethod
    cdef CyMatrix c_rotate_xyz(CyVector3 angle)
        
    @staticmethod
    cdef CyMatrix c_rotate_zyx(CyVector3 angle)
        
    @staticmethod
    cdef CyMatrix c_scale(float x, float y, float z)
        
    @staticmethod
    cdef CyMatrix c_frustrum(double left, double right, double bottom, double top, double near, double far)
        
    @staticmethod
    cdef CyMatrix c_perspective(double fov_y, double aspect, double near_plane, double far_plane)
        
    @staticmethod
    cdef CyMatrix c_orthogonal(double left, double right, double bottom, double top, double near_plane, double far_plane)
        

    @staticmethod
    cdef CyMatrix c_look_at(CyVector3 eye, CyVector3 target, CyVector3 up)
    cpdef CyFloat16 to_float16(CyMatrix self)

cdef class CyVector2:
    cdef Vector2 _vector

    cpdef CyVector2 copy(CyVector2 self)
        
    cpdef float get_x(CyVector2 self)
        
    cpdef float get_y(CyVector2 self)
        
    cpdef void set_x(CyVector2 self, float x_new)
        
    cpdef void set_y(CyVector2 self, float y_new)
        
    cpdef CyVector2 add_value(CyVector2 self, float value)
        
    cpdef CyVector2 add(CyVector2 self, CyVector2 other)
        
    cpdef CyVector2 add_value_inplace(CyVector2 self, float value)
         
    cpdef CyVector2 add_inplace(CyVector2 self, CyVector2 other)
        
    cpdef CyVector2 sub_value(CyVector2 self, float value)
        
    cpdef CyVector2 sub(CyVector2 self, CyVector2 other)
        
    cpdef CyVector2 sub_value_inplace(CyVector2 self, float value)
        
    cpdef CyVector2 sub_inplace(CyVector2 self, CyVector2 other)
        
    cpdef CyVector2 scale(CyVector2 self, float scalar)
        
    cpdef CyVector2 scale_inplace(CyVector2 self, float scalar)
        
    cpdef CyVector2 mul(CyVector2 self, CyVector2 other)
        
    cpdef CyVector2 mul_inplace(CyVector2 self, CyVector2 other)
        
    cpdef float length(CyVector2 self)
        
    cpdef float length_sqr(CyVector2 self)
        
    cpdef float dot(CyVector2 self, CyVector2 other)
        
    cpdef float distance(CyVector2 self, CyVector2 other)
        
    cpdef float distance_sqr(CyVector2 self, CyVector2 other)
        
    cpdef float angle(CyVector2 self, CyVector2 other)
        
    cpdef float line_angle(CyVector2 self, CyVector2 other)
        
    cpdef CyVector2 negate(CyVector2 self)
        
    cpdef CyVector2 negate_inplace(CyVector2 self)
        
    cpdef CyVector2 normalize(CyVector2 self)
        
    cpdef CyVector2 normalize_inplace(CyVector2 self)
        
    cpdef CyVector2 transform(CyVector2 self, CyMatrix matrix)
        
    cpdef CyVector2 transform_inplace(CyVector2 self, CyMatrix matrix)
        
    cpdef CyVector2 lerp(CyVector2 self, CyVector2 target, float amount)    
        
    cpdef CyVector2 lerp_inplace(CyVector2 self, CyVector2 target, float amount)    
        
    cpdef CyVector2 reflect(CyVector2 self, CyVector2 normal)
        
    cpdef CyVector2 reflect_inplace(CyVector2 self, CyVector2 normal)
        
    cpdef CyVector2 rotate(CyVector2 self, float angle)
        
    cpdef CyVector2 rotate_inplace(CyVector2 self, float angle)
        
    cpdef CyVector2 move_towards(CyVector2 self, CyVector2 target, float max_distance)
        
    cpdef CyVector2 move_towards_inplace(CyVector2 self, CyVector2 target, float max_distance)
        
    cpdef CyVector2 invert(CyVector2 self)
        
    cpdef CyVector2 invert_inplace(CyVector2 self)
        
    cpdef CyVector2 clamp(CyVector2 self, CyVector2 min, CyVector2 max)
        
    cpdef CyVector2 clamp_inplace(CyVector2 self, CyVector2 min, CyVector2 max)
        
    
    cpdef CyVector2 clamp_value(CyVector2 self, float min, float max)
        
    
    cpdef CyVector2 clamp_value_inplace(CyVector2 self, float min, float max)
        