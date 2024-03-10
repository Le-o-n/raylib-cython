import numpy as np
from raylib_cython import raymath


class CyColor:

    def __init__(self, r: int = 0, g: int = 0, b: int = 0, a: int = 0): ...
    @staticmethod
    def lightgray() -> 'CyColor': ...
    @staticmethod
    def gray() -> 'CyColor': ...
    @staticmethod
    def darkgray() -> 'CyColor': ...
    @staticmethod
    def yellow() -> 'CyColor': ...
    @staticmethod
    def gold() -> 'CyColor': ...
    @staticmethod
    def orange() -> 'CyColor': ...
    @staticmethod
    def pink() -> 'CyColor': ...
    @staticmethod
    def red() -> 'CyColor': ...
    @staticmethod
    def maroon() -> 'CyColor': ...
    @staticmethod
    def green() -> 'CyColor': ...
    @staticmethod
    def lime() -> 'CyColor': ...
    @staticmethod
    def darkgreen() -> 'CyColor': ...
    @staticmethod
    def skyblue() -> 'CyColor': ...
    @staticmethod
    def blue() -> 'CyColor': ...
    @staticmethod
    def darkblue() -> 'CyColor': ...
    @staticmethod
    def purple() -> 'CyColor': ...
    @staticmethod
    def violet() -> 'CyColor': ...
    @staticmethod
    def darkpurple() -> 'CyColor': ...
    @staticmethod
    def beige() -> 'CyColor': ...
    @staticmethod
    def brown() -> 'CyColor': ...
    @staticmethod
    def darkbrown() -> 'CyColor': ...
    @staticmethod
    def white() -> 'CyColor': ...
    @staticmethod
    def black() -> 'CyColor': ...
    @staticmethod
    def blank() -> 'CyColor': ...
    @staticmethod
    def magenta() -> 'CyColor': ...
    @staticmethod
    def raywhite() -> 'CyColor': ...


class CyRectangle:

    def __init__(self, x: float = 0.0, y: float = 0.0, width: float = 0.0, height: float = 0.0): ...
    @property
    def x(self) -> float: ...
    @x.setter
    def x(self, value: float) -> None: ...
    @property
    def y(self) -> float: ...
    @y.setter
    def y(self, value: float) -> None: ...
    @property
    def height(self) -> float: ...
    @height.setter
    def height(self, value: float) -> None: ...
    @property
    def width(self) -> float: ...
    @width.setter
    def width(self, value: float) -> None: ...


class CyImage:

    def __init__(self): ...


class CyTexture:

    def __init__(self): ...


class CyTexture2D(CyTexture):
    ...


class CyTextureCubemap(CyTexture):
    ...


class CyRenderTexture:

    def __init__(self): ...


class CyRenderTexture2D(CyRenderTexture):
    ...


class CyNPatchInfo:

    def __init__(self): ...


class CyGlyphInfo:

    def __init__(self): ...


class CyFont:

    def __init__(self): ...
    @staticmethod
    def load_font(path: str) -> 'CyFont': ...
    @staticmethod
    def c_load_font(path: str) -> 'CyFont': ...


class CyCamera3D:

    def __init__(self): ...


class CyCamera2D:

    def __init__(self): ...


class CyMesh:

    def __init__(self): ...


class CyShader:

    def __init__(self): ...


class CyMaterialMap:

    def __init__(self): ...


class CyMaterial:

    def __init__(self): ...


class CyTransform:

    def __init__(self): ...


class CyBoneInfo:

    def __init__(self): ...


class CyModel:

    def __init__(self): ...


class CyModelAnimation:

    def __init__(self): ...


class CyRay:

    def __init__(self): ...


class CyRayCollision:

    def __init__(self): ...


class CyBoundingBox:

    def __init__(self): ...


class CyWave:

    def __init__(self): ...


class CyAudioStream:

    def __init__(self): ...


class CySound:

    def __init__(self): ...


class CyMusic:

    def __init__(self): ...


class CyVrDeviceInfo:

    def __init__(self): ...


class CyVrStereoConfig:

    def __init__(self): ...
    @staticmethod
    def load_vr_stereo_config(device: CyVrDeviceInfo) -> 'CyVrStereoConfig': ...
    def unload_vr_stereo_config(self) -> None: ...


class CyFilePathList:

    def __init__(self): ...


class CyAutomationEvent:

    def __init__(self): ...


class CyAutomationEventList:

    def __init__(self): ...


class CyPixel:
    def __init__(self, pos: raymath.CyVector2, color: CyColor): ...
    def draw(self) -> None: ...


class CyLine:
    def __init__(self, p1: raymath.CyVector2, p2: raymath.CyVector2, color: CyColor, thickness: float = 1.0): ...
    def draw_line(self) -> None: ...


class CyLineStrip:
    def __init__(self, points: np.ndarray[raymath.CyVector2], color: CyColor): ...
    def draw(self) -> None: ...
    def set_point(self, index: int, vec: raymath.CyVector2) -> None: ...


class CyText:

    def __init__(self, text: str, pos: raymath.CyVector2, font_size: int, color: CyColor): ...
    def update_text(self, new_text: bytes) -> None: ...
    def get_text(self) -> str: ...
    def update_pos(self, pos: raymath.CyVector2) -> None: ...
    def draw(self) -> None: ...


class CyLine3D:
    ...


class CyPoint3D:
    ...


class CyCircle3D:
    ...


class CyTriangle3D:
    ...


class CyTriangleStrip3D:
    ...


class CyCube:
    ...


class CySphere:
    ...


class CyCylinder:
    ...


class CyCapsule:
    ...


class CyPlane:
    ...


class CyGrid:
    ...


class CyAudioDeviceManager:
    ...

########## General ###########


def init_window(width: int, height: int, title: str) -> None: ...
def close_window() -> None: ...
def window_should_close() -> bool: ...
def is_window_ready() -> bool: ...
def is_window_fullscreen() -> bool: ...
def is_window_hidden() -> bool: ...
def is_window_minimized() -> bool: ...
def is_window_maximized() -> bool: ...
def is_window_focused() -> bool: ...
def is_window_resized() -> bool: ...
def is_window_state(flag: int) -> bool: ...
def set_window_state(flags: int) -> None: ...
def clear_window_state(flags: int) -> None: ...
def toggle_fullscreen() -> None: ...
def toggle_borderless_window() -> None: ...
def maximize_window() -> None: ...
def minimize_window() -> None: ...
def restore_window() -> None: ...
def set_window_icon(image: CyImage) -> None: ...
def set_windows_icons(images: list[CyImage]) -> None: ...
def set_window_title(title: str) -> None: ...
def set_window_position(x: int, y: int) -> None: ...
def set_window_monitor(monitor: int) -> None: ...
def set_window_min_size(width: int, height: int) -> None: ...
def set_window_max_size(width: int, height: int) -> None: ...
def set_window_size(width: int, height: int) -> None: ...
def set_window_opacity(opacity: float) -> None: ...
def set_window_focused() -> None: ...
def get_window_handle() -> int: ...
def get_screen_width() -> int: ...
def get_screen_height() -> int: ...
def get_render_width() -> int: ...
def get_render_height() -> int: ...
def get_monitor_count() -> int: ...
def get_current_monitor() -> int: ...
def get_monitor_position(monitor: int) -> raymath.CyVector2: ...
def get_monitor_width(monitor: int) -> int: ...
def get_monitor_height(monitor: int) -> int: ...
def get_monitor_physical_width(monitor: int) -> int: ...
def get_monitor_physical_height(monitor: int) -> int: ...
def get_monitor_refresh_rate(monitor: int) -> int: ...
def get_window_position() -> raymath.CyVector2: ...
def get_window_scale_dpi() -> raymath.CyVector2: ...
def get_monitor_name(monitor: int) -> bytes: ...
def set_clipboard_text(text: str) -> None: ...
def get_clipboard_text() -> bytes: ...
def enable_event_waiting() -> None: ...
def disable_event_waiting() -> None: ...
def set_target_fps(fps: int) -> None: ...
def get_delta_time() -> float: ...
def get_frame_time() -> float: ...
def get_time() -> float: ...
def get_fps() -> int: ...
def show_cursor() -> None: ...
def hide_cursor() -> None: ...
def is_cursor_hidden() -> int: ...
def enable_cursor() -> None: ...
def disable_cursor() -> None: ...
def is_cursor_on_screen() -> int: ...
def begin_drawing() -> None: ...
def end_drawing() -> None: ...
def begin_mode_2D(camera: CyCamera2D) -> None: ...
def end_mode_2d() -> None: ...
def begin_mode_3d(camera: CyCamera3D) -> None: ...
def end_mode_3d() -> None: ...
def begin_texture_mode(target: CyRenderTexture2D) -> None: ...
def end_texture_mode() -> None: ...
def begin_shader_mode(shader: CyShader) -> None: ...
def end_shader_mode() -> None: ...
def begin_blend_mode(mode: int) -> None: ...
def end_blend_mode() -> None: ...
def begin_scissor_mode(x: int, y: int, width: int, height: int) -> None: ...
def end_scissor_mode() -> None: ...
def begin_vr_stereo_mode(config: CyVrStereoConfig) -> None: ...
def end_vr_stereo_mode() -> None: ...

########### INPUT ############


def get_mouse_x() -> int: ...
def get_mouse_y() -> int: ...
def get_mouse_position() -> raymath.CyVector2: ...
def get_mouse_delta() -> raymath.CyVector2: ...
def set_mouse_position(x: int, y: int) -> None: ...
def set_mouse_offset(offset_x: int, offset_y: int) -> None: ...
def set_mouse_scale(scale_x: float, scale_y: float) -> None: ...
def get_mouse_wheel_move() -> float: ...
def get_mouse_wheel_move_vector() -> raymath.CyVector2: ...
def set_mouse_cursor(cursor: int) -> None: ...
########### DRAWING ############


def clear_background(color: CyColor) -> None: ...
def draw_fps(x: int, y: int) -> None: ...
