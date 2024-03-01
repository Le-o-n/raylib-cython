class CyVector2:

    def __init__(self, x: float = 0.0, y: float = 0.0):
        ...
#    # Vector3, 3 components
#    ctypedef struct Vector3:
#        float x                 # Vector x component
#        float y                 # Vector y component
#        float z                 # Vector z component


class CyVector3:

    def __init__(self, x: float = 0.0, y: float = 0.0, z: float = 0.0):
        ...
#    # Quaternion, 4 components (Vector4 alias)
#    ctypedef Vector4 Quaternion


class CyQuaternion:

    def __init__(self, x: float = 0.0, y: float = 0.0, z: float = 0.0, w: float = 0.0):
        ...

#    # Vector4, 4 components
#    ctypedef struct Vector4:
#        float x                 # Vector x component
#        float y                 # Vector y component
#        float z                 # Vector z component
#        float w                 # Vector w component
#


class CyVector4(CyQuaternion):
    ...

#    # Matrix, 4x4 components, column major, OpenGL style, right-handed
#    ctypedef struct Matrix:
#        float m0, m4, m8, m12   # Matrix first row (4 components)
#        float m1, m5, m9, m13   # Matrix second row (4 components)
#        float m2, m6, m10, m14  # Matrix third row (4 components)
#        float m3, m7, m11, m15  # Matrix fourth row (4 components)


class CyMatrix:

    def __init__(self):
        ...

#    # Color, 4 components, R8G8B8A8 (32bit)
#    ctypedef struct Color:
#        uint8_t r               # Color red value
#        uint8_t g               # Color green value
#        uint8_t b               # Color blue value
#        uint8_t a               # Color alpha value


class CyColor:

    def __init__(self, r: int = 0, g: int = 0, b: int = 0, a: int = 0):
        ...

    @staticmethod
    def lightgray() -> 'CyColor':
        ...

    @staticmethod
    def gray() -> 'CyColor':
        ...

    @staticmethod
    def darkgray() -> 'CyColor':
        ...

    @staticmethod
    def yellow() -> 'CyColor':
        ...

    @staticmethod
    def gold() -> 'CyColor':
        ...

    @staticmethod
    def orange() -> 'CyColor':
        ...

    @staticmethod
    def pink() -> 'CyColor':
        ...

    @staticmethod
    def red() -> 'CyColor':
        ...

    @staticmethod
    def maroon() -> 'CyColor':
        ...

    @staticmethod
    def green() -> 'CyColor':
        ...

    @staticmethod
    def lime() -> 'CyColor':
        ...

    @staticmethod
    def darkgreen() -> 'CyColor':
        ...

    @staticmethod
    def skyblue() -> 'CyColor':
        ...

    @staticmethod
    def blue() -> 'CyColor':
        ...

    @staticmethod
    def darkblue() -> 'CyColor':
        ...

    @staticmethod
    def purple() -> 'CyColor':
        ...

    @staticmethod
    def violet() -> 'CyColor':
        ...

    @staticmethod
    def darkpurple() -> 'CyColor':
        ...

    @staticmethod
    def beige() -> 'CyColor':
        ...

    @staticmethod
    def brown() -> 'CyColor':
        ...

    @staticmethod
    def darkbrown() -> 'CyColor':
        ...

    @staticmethod
    def white() -> 'CyColor':
        ...

    @staticmethod
    def black() -> 'CyColor':
        ...

    @staticmethod
    def blank() -> 'CyColor':
        ...

    @staticmethod
    def magenta() -> 'CyColor':
        ...

    @staticmethod
    def raywhite() -> 'CyColor':
        ...


#    # Rectangle, 4 components
#    ctypedef struct Rectangle:
#        float x                 # Rectangle top-left corner position x
#        float y                 # Rectangle top-left corner position y
#        float width             # Rectangle width
#        float height            # Rectangle height

class CyRectangle:

    def __init__(self, x: float = 0.0, y: float = 0.0, width: float = 0.0, height: float = 0.0):
        ...

    @property
    def x(self) -> float:
        ...

    @x.setter
    def x(self, value: float) -> None:
        ...

    @property
    def y(self) -> float:
        ...

    @y.setter
    def y(self, value: float) -> None:
        ...

    @property
    def height(self) -> float:
        ...

    @height.setter
    def height(self, value: float) -> None:
        ...

    @property
    def width(self) -> float:
        ...

    @width.setter
    def width(self, value: float) -> None:
        ...


#    # Image, pixel data stored in CPU memory (RAM)
#    ctypedef struct Image:
#        void *data              # Image raw data
#        int width               # Image base width
#        int height              # Image base height
#        int mipmaps             # Mipmap levels, 1 by default
#        int format              # Data format (PixelFormat type)

# Define your Cython class
class CyImage:

    def __init__(self):
        ...

#    # Texture, tex data stored in GPU memory (VRAM)
#    ctypedef struct Texture:
#        unsigned int id         # OpenGL texture id
#        int width               # Texture base width
#        int height              # Texture base height
#        int mipmaps             # Mipmap levels, 1 by default
#        int format              # Data format (PixelFormat type)


class CyTexture:

    def __init__(self):
        ...


#    # Texture2D, same as Texture
#    ctypedef Texture Texture2D

class CyTexture2D(CyTexture):
    ...

#    ctypedef Texture TextureCubemap


class CyTextureCubemap(CyTexture):
    ...

#    # RenderTexture, fbo for texture rendering
#    ctypedef struct RenderTexture:
#        unsigned int id         # OpenGL framebuffer object id
#        Texture texture         # Color buffer attachment texture
#        Texture depth           # Depth buffer attachment texture


class CyRenderTexture:

    def __init__(self):
        ...

#    # RenderTexture2D, same as RenderTexture
#    ctypedef RenderTexture RenderTexture2D
#


class CyRenderTexture2D(CyRenderTexture):
    ...

#    # NPatchInfo, n-patch layout info
#    ctypedef struct NPatchInfo:
#        Rectangle source        # Texture source rectangle
#        int left                # Left border offset
#        int top                 # Top border offset
#        int right               # Right border offset
#        int bottom              # Bottom border offset
#        int layout              # Layout of the n-patch: 3x3, 1x3 or 3x1


class CyNPatchInfo:

    def __init__(self):
        ...

#    # GlyphInfo, font characters glyphs info
#    ctypedef struct GlyphInfo:
#        int value               # Character value (Unicode)
#        int offsetX             # Character offset X when drawing
#        int offsetY             # Character offset Y when drawing
#        int advanceX            # Character advance position X
#        Image image             # Character image data
#


class CyGlyphInfo:

    def __init__(self):
        ...

#    # Font, font texture and GlyphInfo array data
#    ctypedef struct Font:
#        int baseSize            # Base size (default chars height)
#        int glyphCount          # Number of glyph characters
#        int glyphPadding        # Padding around the glyph characters
#        Texture2D texture       # Texture atlas containing the glyphs
#        Rectangle *recs         # Rectangles in texture for the glyphs
#        GlyphInfo *glyphs       # Glyphs info data
#


class CyFont:

    def __init__(self):
        ...

    @staticmethod
    def load_font(self, path: str) -> 'CyFont':
        ...

    @staticmethod
    def c_load_font(self, path: str) -> 'CyFont':
        ...


#    # Camera, defines position/orientation in 3d space
#    ctypedef struct Camera3D:
#        Vector3 position        # Camera position
#        Vector3 target          # Camera target it looks-at
#        Vector3 up              # Camera up vector (rotation over its axis)
#        float fovy              # Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
#        int projection          # Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
#
#    ctypedef Camera3D Camera    # Camera type fallback, defaults to Camera3D

class CyCamera3D:

    def __init__(self):
        ...

#    # Camera2D, defines position/orientation in 2d space
#    ctypedef struct Camera2D:
#        Vector2 offset          # Camera offset (displacement from target)
#        Vector2 target          # Camera target (rotation and zoom origin)
#        float rotation          # Camera rotation in degrees
#        float zoom              # Camera zoom (scaling), should be 1.0f by default
#


class CyCamera2D:

    def __init__(self):
        ...

#    # Mesh, vertex data and vao/vbo
#    ctypedef struct Mesh:
#        int vertexCount         # Number of vertices stored in arrays
#        int triangleCount       # Number of triangles stored (indexed or not)
#
#        # Vertex attributes data
#        float *vertices         # Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
#        float *texcoords        # Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
#        float *texcoords2       # Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
#        float *normals          # Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
#        float *tangents         # Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
#        unsigned char *colors       # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
#        unsigned short *indices     # Vertex indices (in case vertex data comes indexed)
#
#        # Animation vertex data
#        float *animVertices     # Animated vertex positions (after bones transformations)
#        float *animNormals      # Animated normals (after bones transformations)
#        unsigned char *boneIds  # Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
#        float *boneWeights      # Vertex bone weight, up to 4 bones influence by vertex (skinning)
#
#        # OpenGL identifiers
#        unsigned int vaoId      # OpenGL Vertex Array Object id
#        unsigned int *vboId     # OpenGL Vertex Buffer Objects id (default vertex data)


class CyMesh:

    def __init__(self):
        ...


#    # Shader
#    ctypedef struct Shader:
#        unsigned int id         # Shader program id
#        int *locs               # Shader locations array (RL_MAX_SHADER_LOCATIONS)

class CyShader:

    def __init__(self):
        ...


#    # MaterialMap
#    ctypedef struct MaterialMap:
#        Texture2D texture       # Material map texture
#        Color color             # Material map color
#        float value             # Material map value

class CyMaterialMap:

    def __init__(self):
        ...


#    # Material, includes shader and maps
#    ctypedef struct Material:
#        Shader shader           # Material shader
#        MaterialMap *maps       # Material maps array (MAX_MATERIAL_MAPS)
#        float params[4]         # Material generic parameters (if required)

class CyMaterial:

    def __init__(self):
        ...

#    # Transform, vertex transformation data
#    ctypedef struct Transform:
#        Vector3 translation     # Translation
#        Quaternion rotation     # Rotation
#        Vector3 scale           # Scale


class CyTransform:

    def __init__(self):
        ...

#
#    # Bone, skeletal animation bone
#    ctypedef struct BoneInfo:
#        char name[32]          # Bone name
#        int parent             # Bone parent


class CyBoneInfo:

    def __init__(self):
        ...


#
#    # Model, meshes, materials and animation data
#    ctypedef struct Model:
#        Matrix transform       # Local transform matrix
#
#        int meshCount          # Number of meshes
#        int materialCount      # Number of materials
#        Mesh *meshes           # Meshes array
#        Material *materials    # Materials array
#        int *meshMaterial      # Mesh material number
#
#        # Animation data
#        int boneCount          # Number of bones
#        BoneInfo *bones        # Bones information (skeleton)
#        Transform *bindPose    # Bones base transformation (pose)
#
#
class CyModel:

    def __init__(self):
        ...


#    # ModelAnimation
#    ctypedef struct ModelAnimation:
#        int boneCount          # Number of bones
#        int frameCount         # Number of animation frames
#        BoneInfo *bones        # Bones information (skeleton)
#        Transform **framePoses # Poses array by frame
#        char name[32]          # Animation name

class CyModelAnimation:

    def __init__(self):
        ...

#
#    # Ray, ray for raycasting
#    ctypedef struct Ray:
#        Vector3 position       # Ray position (origin)
#        Vector3 direction      # Ray direction
#


class CyRay:

    def __init__(self):
        ...

#
#    # RayCollision, ray hit information
#    ctypedef struct RayCollision:
#        bint hit               # Did the ray hit something?
#        float distance         # Distance to the nearest hit
#        Vector3 point          # Point of the nearest hit
#        Vector3 normal         # Surface normal of hit
#


class CyRayCollision:

    def __init__(self):
        ...


#
#    # BoundingBox
#    ctypedef struct BoundingBox:
#        Vector3 min            # Minimum vertex box-corner
#        Vector3 max            # Maximum vertex box-corner
#

class CyBoundingBox:

    def __init__(self):
        ...

#
#    # Wave, audio wave data
#    ctypedef struct Wave:
#        unsigned int frameCount    # Total number of frames (considering channels)
#        unsigned int sampleRate    # Frequency (samples per second)
#        unsigned int sampleSize    # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
#        unsigned int channels      # Number of channels (1-mono, 2-stereo, ...)
#        void *data                 # Buffer data pointer
#
#


class CyWave:

    def __init__(self):
        ...


#    # AudioStream, custom audio stream
#    ctypedef struct AudioStream:
#        rAudioBuffer *buffer       # Pointer to internal data used by the audio system
#        rAudioProcessor *processor # Pointer to internal data processor, useful for audio effects
#
#        unsigned int sampleRate    # Frequency (samples per second)
#        unsigned int sampleSize    # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
#        unsigned int channels      # Number of channels (1-mono, 2-stereo, ...)
#

class CyAudioStream:

    def __init__(self):
        ...


#    # Sound
#    ctypedef struct Sound:
#        AudioStream stream         # Audio stream
#        unsigned int frameCount    # Total number of frames (considering channels)
#
class CySound:

    def __init__(self):
        ...

#
#    # Music, audio stream, anything longer than ~10 seconds should be streamed
#    ctypedef struct Music:
#        AudioStream stream         # Audio stream
#        unsigned int frameCount    # Total number of frames (considering channels)
#        bint looping               # Music looping enable
#
#        int ctxType                # Type of music context (audio filetype)
#        void *ctxData              # Audio context data, depends on type
#
#


class CyMusic:

    def __init__(self):
        ...


#    # VrDeviceInfo, Head-Mounted-Display device parameters
#    ctypedef struct VrDeviceInfo:
#        int hResolution                # Horizontal resolution in pixels
#        int vResolution                # Vertical resolution in pixels
#        float hScreenSize              # Horizontal size in meters
#        float vScreenSize              # Vertical size in meters
#        float eyeToScreenDistance      # Distance between eye and display in meters
#        float lensSeparationDistance   # Lens separation distance in meters
#        float interpupillaryDistance   # IPD (distance between pupils) in meters
#        float lensDistortionValues[4]  # Lens distortion constant parameters
#        float chromaAbCorrection[4]    # Chromatic aberration correction parameters
#
class CyVrDeviceInfo:

    def __init__(self):
        ...

#
#    # VrStereoConfig, VR stereo rendering configuration for simulator
#    ctypedef struct VrStereoConfig:
#        Matrix projection[2]           # VR projection matrices (per eye)
#        Matrix viewOffset[2]           # VR view offset matrices (per eye)
#        float leftLensCenter[2]        # VR left lens center
#        float rightLensCenter[2]       # VR right lens center
#        float leftScreenCenter[2]      # VR left screen center
#        float rightScreenCenter[2]     # VR right screen center
#        float scale[2]                 # VR distortion scale
#        float scaleIn[2]               # VR distortion scale in
#


class CyVrStereoConfig:

    def __init__(self):
        ...

    @staticmethod
    def load_vr_stereo_config(device: CyVrDeviceInfo) -> 'CyVrStereoConfig':
        ...

    def unload_vr_stereo_config(self) -> None:
        ...

#    # File path list
#    ctypedef struct FilePathList:
#        unsigned int capacity          # Filepaths max entries
#        unsigned int count             # Filepaths entries count
#        char **paths                   # Filepaths entries
#


class CyFilePathList:

    def __init__(self):
        ...

#    # Automation event
#    ctypedef struct AutomationEvent:
#        unsigned int frame             # Event frame
#        unsigned int type              # Event type (AutomationEventType)
#        int params[4]                  # Event parameters (if required)
#


class CyAutomationEvent:

    def __init__(self):
        ...

#    # Automation event list
#    ctypedef struct AutomationEventList:
#        unsigned int capacity          # Events max entries (MAX_AUTOMATION_EVENTS)
#        unsigned int count             # Events entries count
#        AutomationEvent *events        # Events entries
#


class CyAutomationEventList:

    def __init__(self):
        ...


class CyWindow:

    @staticmethod
    def init_window(width: int, height: int, title: str) -> None:
        ...

    @staticmethod
    def close_window() -> None:
        ...

    @staticmethod
    def window_should_close() -> bool:
        ...

    @staticmethod
    def is_window_ready() -> bool:
        ...

    @staticmethod
    def is_window_fullscreen() -> bool:
        ...

    @staticmethod
    def is_window_hidden() -> bool:
        ...

    @staticmethod
    def is_window_minimized() -> bool:
        ...

    @staticmethod
    def is_window_maximized() -> bool:
        ...

    @staticmethod
    def is_window_focused() -> bool:
        ...

    @staticmethod
    def is_window_resized() -> bool:
        ...

    @staticmethod
    def is_window_state(flag: int) -> bool:
        ...

    @staticmethod
    def set_window_state(flags: int) -> None:
        ...

    @staticmethod
    def clear_window_state(flags: int) -> None:
        ...

    @staticmethod
    def toggle_fullscreen() -> None:
        ...

    @staticmethod
    def toggle_borderless_window() -> None:
        ...

    @staticmethod
    def maximize_window() -> None:
        ...

    @staticmethod
    def minimize_window() -> None:
        ...

    @staticmethod
    def restore_window() -> None:
        ...

    @staticmethod
    def set_window_icon(image: CyImage) -> None:
        ...

    @staticmethod
    def set_windows_icons(images: list[CyImage]) -> None:
        ...

    @staticmethod
    def set_window_title(title: str) -> None:
        ...

    @staticmethod
    def set_window_position(x: int, y: int) -> None:
        ...

    @staticmethod
    def set_window_monitor(monitor: int) -> None:
        ...

    @staticmethod
    def set_window_min_size(width: int, height: int) -> None:
        ...

    @staticmethod
    def set_window_max_size(width: int, height: int) -> None:
        ...

    @staticmethod
    def set_window_size(width: int, height: int) -> None:
        ...

    @staticmethod
    def set_window_opacity(opacity: float) -> None:
        ...

    @staticmethod
    def set_window_focused() -> None:
        ...

    @staticmethod
    def get_window_handle() -> int:
        ...

    @staticmethod
    def get_screen_width() -> int:
        ...

    @staticmethod
    def get_screen_height() -> int:
        ...

    @staticmethod
    def get_render_width() -> int:
        ...

    @staticmethod
    def get_render_height() -> int:
        ...

    @staticmethod
    def get_monitor_count() -> int:
        ...

    @staticmethod
    def get_current_monitor() -> int:
        ...

    @staticmethod
    def get_monitor_position(monitor: int) -> CyVector2:
        ...

    @staticmethod
    def get_monitor_width(monitor: int) -> int:
        ...

    @staticmethod
    def get_monitor_height(monitor: int) -> int:
        ...

    @staticmethod
    def get_monitor_physical_width(monitor: int) -> int:
        ...

    @staticmethod
    def get_monitor_physical_height(monitor: int) -> int:
        ...

    @staticmethod
    def get_monitor_refresh_rate(monitor: int) -> int:
        ...

    @staticmethod
    def get_window_position() -> CyVector2:
        ...

    @staticmethod
    def get_window_scale_dpi() -> CyVector2:
        ...

    @staticmethod
    def get_monitor_name(monitor: int) -> bytes:
        ...

    @staticmethod
    def set_clipboard_text(text: str) -> None:
        ...

    @staticmethod
    def get_clipboard_text() -> bytes:
        ...

    @staticmethod
    def enable_event_waiting() -> None:
        ...

    @staticmethod
    def disable_event_waiting() -> None:
        ...

    @staticmethod
    def set_target_fps(fps: int) -> None:
        ...

    @staticmethod
    def get_frame_time() -> float:
        ...

    @staticmethod
    def get_time() -> float:
        ...

    @staticmethod
    def get_fps() -> int:
        ...


class CyCursor:
    @staticmethod
    def show_cursor() -> None:
        ...

    @staticmethod
    def hide_cursor() -> None:
        ...

    @staticmethod
    def is_cursor_hidden() -> int:
        ...

    @staticmethod
    def enable_cursor() -> None:
        ...

    @staticmethod
    def disable_cursor() -> None:
        ...

    @staticmethod
    def is_cursor_on_screen() -> int:
        ...


class CyMode:

    @staticmethod
    def clear_background(color: CyColor) -> None:
        ...

    @staticmethod
    def begin_drawing() -> None:
        ...

    @staticmethod
    def end_drawing() -> None:
        ...

    @staticmethod
    def begin_mode_2D(camera: CyCamera2D) -> None:
        ...

    @staticmethod
    def end_mode_2d() -> None:
        ...

    @staticmethod
    def begin_mode_3d(camera: CyCamera3D) -> None:
        ...

    @staticmethod
    def end_mode_3d() -> None:
        ...

    @staticmethod
    def begin_texture_mode(target: CyRenderTexture2D) -> None:
        ...

    @staticmethod
    def end_texture_mode() -> None:
        ...

    @staticmethod
    def begin_shader_mode(shader: CyShader) -> None:
        ...

    @staticmethod
    def end_shader_mode() -> None:
        ...

    @staticmethod
    def begin_blend_mode(mode: int) -> None:
        ...

    @staticmethod
    def end_blend_mode() -> None:
        ...

    @staticmethod
    def begin_scissor_mode(x: int, y: int, width: int, height: int) -> None:
        ...

    @staticmethod
    def end_scissor_mode() -> None:
        ...

    @staticmethod
    def begin_vr_stereo_mode(config: CyVrStereoConfig) -> None:
        ...

    @staticmethod
    def end_vr_stereo_mode() -> None:
        ...
