

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