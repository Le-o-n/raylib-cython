from typing import Union


class CyVector2:
    x: float
    y: float
    def __init__(self, x: float = 0.0, y: float = 0.0): ...
    def copy(self) -> 'CyVector2': ...
    def get_x(self) -> float: ...
    def get_y(self) -> float: ...
    def set_x(self, x_new: float) -> None: ...
    def set_y(self, y_new: float) -> None: ...
    def add_value(self, value: float) -> 'CyVector2': ...
    def add(self, other: 'CyVector2') -> 'CyVector2': ...
    def add_value_inplace(self, value: float) -> 'CyVector2': ...
    def add_inplace(self, other: 'CyVector2') -> 'CyVector2': ...
    def sub_value(self, value: float) -> 'CyVector2': ...
    def sub(self, other: 'CyVector2') -> 'CyVector2': ...
    def sub_value_inplace(self, value: 'CyVector2') -> 'CyVector2': ...
    def sub_inplace(self, other: 'CyVector2') -> 'CyVector2': ...
    def scale(self, scalar: float) -> 'CyVector2': ...
    def scale_inplace(self, scalar: float) -> 'CyVector2': ...
    def mul(self, other: 'CyVector2') -> 'CyVector2': ...
    def mul_inplace(self, other: 'CyVector2') -> 'CyVector2': ...
    def length(self) -> float: ...
    def length_sqr(self) -> float: ...
    def dot(self, other: 'CyVector2') -> float: ...
    def distance(self, other: 'CyVector2') -> float: ...
    def distance_sqr(self, other: 'CyVector2') -> float: ...
    def angle(self, other: 'CyVector2') -> float: ...
    def line_angle(self, other: 'CyVector2') -> float: ...
    def negate(self) -> 'CyVector2': ...
    def negate_inplace(self) -> 'CyVector2': ...
    def normalize(self) -> 'CyVector2': ...
    def normalize_inplace(self) -> 'CyVector2': ...
    def transform(self, matrix: 'CyMatrix') -> 'CyVector2': ...
    def transform_inplace(self, matrix: 'CyMatrix') -> 'CyVector2': ...
    def lerp(self, target: 'CyVector2', amount: float) -> 'CyVector2': ...
    def lerp_inplace(self, target: 'CyVector2', amount: float) -> 'CyVector2': ...
    def reflect(self, normal: 'CyVector2') -> 'CyVector2': ...
    def reflect_inplace(self, normal: 'CyVector2') -> 'CyVector2': ...
    def rotate(self, angle: float) -> 'CyVector2': ...
    def rotate_inplace(self, angle: float) -> 'CyVector2': ...
    def move_towards(self, target: 'CyVector2', max_distance: float) -> 'CyVector2': ...
    def move_towards_inplace(self, target: 'CyVector2', max_distance: float) -> 'CyVector2': ...
    def invert(self) -> 'CyVector2': ...
    def invert_inplace(self) -> 'CyVector2': ...
    def clamp(self, min: 'CyVector2', max: 'CyVector2') -> 'CyVector2': ...
    def clamp_inplace(self, min: 'CyVector2', max: 'CyVector2') -> 'CyVector2': ...
    def clamp_value(self, min: float, max: float) -> 'CyVector2': ...
    def clamp_value_inplace(self, min: float, max: float) -> 'CyVector2': ...


class CyVector3:
    x: float
    y: float
    z: float
    def __init__(self, x: float = 0.0, y: float = 0.0, z: float = 0.0): ...
    def copy(self) -> 'CyVector3': ...
    def get_x(self) -> float: ...
    def get_y(self) -> float: ...
    def get_z(self) -> float: ...
    def set_x(self, x_new: float) -> None: ...
    def set_y(self, y_new: float) -> None: ...
    def set_z(self, z_new: float) -> None: ...
    def add_value(self, value: float) -> 'CyVector3': ...
    def add(self, other: 'CyVector3') -> 'CyVector3': ...
    def add_value_inplace(self, value: float) -> 'CyVector3': ...
    def add_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def sub_value(self, value: float) -> 'CyVector3': ...
    def sub(self, other: 'CyVector3') -> 'CyVector3': ...
    def sub_value_inplace(self, value: float) -> 'CyVector3': ...
    def sub_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def scale(self, scalar: float) -> 'CyVector3': ...
    def scale_inplace(self, scalar: float) -> 'CyVector3': ...
    def mul(self, other: 'CyVector3') -> 'CyVector3': ...
    def mul_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def div(self, other: 'CyVector3') -> 'CyVector3': ...
    def div_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def cross_product(self, other: 'CyVector3') -> 'CyVector3': ...
    def cross_product_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def perpendicular(self) -> 'CyVector3': ...
    def perpendicular_inplace(self) -> 'CyVector3': ...
    def length(self) -> float: ...
    def length_sqr(self) -> float: ...
    def dot(self, other: 'CyVector3') -> float: ...
    def distance(self, other: 'CyVector3') -> float: ...
    def distance_sqr(self, other: 'CyVector3') -> float: ...
    def angle(self, other: 'CyVector3') -> float: ...
    def negate(self) -> 'CyVector3': ...
    def negate_inplace(self) -> 'CyVector3': ...
    def normalize(self) -> 'CyVector3': ...
    def normalize_inplace(self) -> 'CyVector3': ...
    def project(self, other: 'CyVector3') -> 'CyVector3': ...
    def project_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def reject(self, other: 'CyVector3') -> 'CyVector3': ...
    def reject_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def ortho_normalize(self, other: 'CyVector3') -> 'CyVector3': ...
    def ortho_normalize_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def transform(self, matrix: 'CyMatrix') -> 'CyVector3': ...
    def transform_inplace(self, matrix: 'CyMatrix') -> 'CyVector3': ...
    def rotate_by_quaternion(self, quaternion: 'CyQuaternion') -> 'CyVector3': ...
    def rotate_by_quaternion_inplace(self, quaternion: 'CyQuaternion') -> 'CyVector3': ...
    def rotate_by_axis_angle(self, axis: 'CyVector3', angle: float) -> 'CyVector3': ...
    def rotate_by_axis_angle_inplace(self, axis: 'CyVector3', angle: float) -> 'CyVector3': ...
    def lerp(self, target: 'CyVector3', amount: float) -> 'CyVector3': ...
    def lerp_inplace(self, target: 'CyVector3', amount: float) -> 'CyVector3': ...
    def reflect(self, normal: 'CyVector3') -> 'CyVector3': ...
    def reflect_inplace(self, normal: 'CyVector3') -> 'CyVector3': ...
    def min(self, other: 'CyVector3') -> 'CyVector3': ...
    def min_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def max(self, other: 'CyVector3') -> 'CyVector3': ...
    def max_inplace(self, other: 'CyVector3') -> 'CyVector3': ...
    def barycenter(self, a: 'CyVector3', b: 'CyVector3', c: 'CyVector3') -> 'CyVector3': ...
    def barycenter_inplace(self, a: 'CyVector3', b: 'CyVector3', c: 'CyVector3') -> 'CyVector3': ...
    def unproject(self, projection: 'CyMatrix', view: 'CyMatrix') -> 'CyVector3': ...
    def unproject_inplace(self, projection: 'CyMatrix', view: 'CyMatrix') -> 'CyVector3': ...
    def to_float3(self) -> 'CyFloat3': ...
    def invert(self) -> 'CyVector3': ...
    def invert_inplace(self) -> 'CyVector3': ...
    def clamp(self, min: 'CyVector3', max: 'CyVector3') -> 'CyVector3': ...
    def clamp_inplace(self, min: 'CyVector3', max: 'CyVector3') -> 'CyVector3': ...
    def clamp_value(self, min: float, max: float) -> 'CyVector3': ...
    def equals(self, other: 'CyVector3') -> bool: ...
    def refract(self, normal: 'CyVector3', r: float) -> 'CyVector3': ...
    def refract_inplace(self, normal: 'CyVector3', r: float) -> 'CyVector3': ...


class CyVector4:
    def __init__(self): ...
    def get_x(self) -> float: ...
    def get_y(self) -> float: ...
    def get_z(self) -> float: ...
    def get_w(self) -> float: ...
    def set_x(self, x_new: float) -> None: ...
    def set_y(self, y_new: float) -> None: ...
    def set_z(self, z_new: float) -> None: ...
    def set_w(self, z_new: float) -> None: ...


class CyQuaternion(CyVector4):
    ...


class CyMatrix:
    def get_element(self, row: int, col: int) -> float: ...
    def set_element(self, row: int, col: int, value: float) -> None: ...
    def to_float16(self) -> 'CyFloat16': ...


class CyFloat3:
    def get_float(self, index: int) -> float: ...
    def set_float(self, index: int, f: float) -> None: ...


class CyFloat16:
    def get_float(self, index: int) -> float: ...
    def set_float(self, index: int, f: float) -> None: ...
