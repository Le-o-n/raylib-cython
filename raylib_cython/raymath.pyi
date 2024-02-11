from typing import Union


class CyVector2:
    def __init__(self, x: float = 0.0, y: float = 0.0) -> 'CyVector2': ...
    def get_x(self) -> float: ...
    def get_y(self) -> float: ...
    def set_x(self, x_new: float) -> None: ...
    def set_y(self, y_new: float) -> None: ...
    @staticmethod
    def zeros() -> 'CyVector2': ...
    @staticmethod
    def ones() -> 'CyVector2': ...
    def add(self, other: 'CyVector2') -> 'CyVector2': ...
    def add_value(self, value: float) -> 'CyVector2': ...
    def add_inplace(self, other: 'CyVector2') -> 'CyVector2': ...
    def add_value_inplace(self, value: float) -> 'CyVector2': ...
    def sub(self, other: 'CyVector2') -> 'CyVector2': ...
    def sub_value(self, value: float) -> 'CyVector2': ...
    def sub_inplace(self, other: 'CyVector2') -> 'CyVector2': ...
    def sub_value_inplace(self, value: float) -> 'CyVector2': ...
    def scale(self, scale: float) -> 'CyVector2': ...
    def scale_inplace(self, scale: float) -> 'CyVector2': ...
    def mul(self, other: 'CyVector2') -> 'CyVector2': ...
    def mul_inplace(self, other: 'CyVector2') -> 'CyVector2': ...
    def div(self, value: float) -> 'CyVector2': ...
    def div_inplace(self, value: float) -> 'CyVector2': ...
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
    def lerp(self, target: 'CyVector2', amount: float): ...
    def lerp_inplace(self, target: 'CyVector2', amount: float) -> 'CyVector2': ...
    def reflect(self, normal) -> 'CyVector2': ...
    def reflect_inplace(self, normal) -> 'CyVector2': ...
    def rotate(self, angle: float) -> 'CyVector2': ...
    def rotate_inplace(self, angle: float) -> 'CyVector2': ...
    def move_towards(self, target: 'CyVector2', max_distance: float) -> 'CyVector2': ...
    def move_towards_inplace(self, target: 'CyVector2', max_distance: float) -> 'CyVector2': ...
    def invert(self) -> 'CyVector2': ...
    def invert_inplace(self) -> 'CyVector2': ...
    def clamp(self, min, max) -> 'CyVector2': ...
    def clamp_inplace(self, min, max) -> 'CyVector2': ...
    def clamp_value(self, min: float, max: float) -> 'CyVector2': ...
    def clamp_value_inplace(self, min: float, max: float) -> 'CyVector2': ...


class CyVector3:
    def __init__(self) -> 'CyVector3': ...
    def get_x(self) -> float: ...
    def get_y(self) -> float: ...
    def get_z(self) -> float: ...
    def set_x(self, x_new: float) -> None: ...
    def set_y(self, y_new: float) -> None: ...
    def set_z(self, z_new: float) -> None: ...


class CyVector4:
    def __init__(self) -> 'CyVector4': ...
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
    def to_float16(self) -> CyFloat16: ...


class CyFloat3:
    def get_float(self, index: int) -> float: ...
    def set_float(self, index: int, f: float) -> None: ...


class CyFloat16:
    def get_float(self, index: int) -> float: ...
    def set_float(self, index: int, f: float) -> None: ...
