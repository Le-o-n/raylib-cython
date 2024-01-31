from libc.stdint cimport uint8_t

cdef extern from "../raylib5/raylib.h":
    
    cdef double PI

    cdef double DEG2RAD

    cdef double RAD2DEG

    cdef void* RL_MALLOC(size_t sz)
    cdef void* RL_CALLOC(size_t n, size_t sz)
    cdef void* RL_REALLOC(void* ptr, size_t sz)
    cdef void RL_FREE(void* ptr)

    
    # Vector2, 2 components
    ctypedef struct Vector2:
        float x                 # Vector x component
        float y                 # Vector y component

    # Vector3, 3 components
    ctypedef struct Vector3:
        float x                 # Vector x component
        float y                 # Vector y component
        float z                 # Vector z component

    # Vector4, 4 components
    ctypedef struct Vector4:
        float x                 # Vector x component
        float y                 # Vector y component
        float z                 # Vector z component
        float w                 # Vector w component

    # Quaternion, 4 components (Vector4 alias)
    ctypedef Vector4 Quaternion

    # Matrix, 4x4 components, column major, OpenGL style, right-handed
    ctypedef struct Matrix:
        float m0, m4, m8, m12   # Matrix first row (4 components)
        float m1, m5, m9, m13   # Matrix second row (4 components)
        float m2, m6, m10, m14  # Matrix third row (4 components)
        float m3, m7, m11, m15  # Matrix fourth row (4 components)

    # Color, 4 components, R8G8B8A8 (32bit)
    ctypedef struct Color:
        uint8_t r               # Color red value
        uint8_t g               # Color green value
        uint8_t b               # Color blue value
        uint8_t a               # Color alpha value

    cdef Color LIGHTGRAY = {200, 200, 200, 255} # Light Gray
    cdef Color GRAY      = {130, 130, 130, 255} # Gray
    cdef Color DARKGRAY  = {80, 80, 80, 255   } # Dark Gray
    cdef Color YELLOW    = {253, 249, 0, 255  } # Yellow
    cdef Color GOLD      = {255, 203, 0, 255  } # Gold
    cdef Color ORANGE    = {255, 161, 0, 255  } # Orange
    cdef Color PINK      = {255, 109, 194, 255} # Pink
    cdef Color RED       = {230, 41, 55, 255  } # Red
    cdef Color MAROON    = {190, 33, 55, 255  } # Maroon
    cdef Color GREEN     = {0, 228, 48, 255   } # Green
    cdef Color LIME      = {0, 158, 47, 255   } # Lime
    cdef Color DARKGREEN = {0, 117, 44, 255   } # Dark Green
    cdef Color SKYBLUE   = {102, 191, 255, 255} # Sky Blue
    cdef Color BLUE      = {0, 121, 241, 255  } # Blue
    cdef Color DARKBLUE  = {0, 82, 172, 255   } # Dark Blue
    cdef Color PURPLE    = {200, 122, 255, 255} # Purple
    cdef Color VIOLET    = {135, 60, 190, 255 } # Violet
    cdef Color DARKPURPLE= {112, 31, 126, 255 } # Dark Purple
    cdef Color BEIGE     = {211, 176, 131, 255} # Beige
    cdef Color BROWN     = {127, 106, 79, 255 } # Brown
    cdef Color DARKBROWN = {76, 63, 47, 255   } # Dark Brown
    cdef Color WHITE     = {255, 255, 255, 255} # White
    cdef Color BLACK     = {0, 0, 0, 255      } # Black
    cdef Color BLANK     = {0, 0, 0, 0        } # Blank (Transparent)
    cdef Color MAGENTA   = {255, 0, 255, 255  } # Magenta
    cdef Color RAYWHITE  = {245, 245, 245, 255} # My own White (raylib logo)

    # Rectangle, 4 components
    ctypedef struct Rectangle:
        float x                 # Rectangle top-left corner position x
        float y                 # Rectangle top-left corner position y
        float width             # Rectangle width
        float height            # Rectangle height
    
    # Image, pixel data stored in CPU memory (RAM)
    ctypedef struct Image:
        void *data              # Image raw data
        int width               # Image base width
        int height              # Image base height
        int mipmaps             # Mipmap levels, 1 by default
        int format              # Data format (PixelFormat type)
    
    # Texture, tex data stored in GPU memory (VRAM)
    ctypedef struct Texture:
        unsigned int id         # OpenGL texture id
        int width               # Texture base width
        int height              # Texture base height
        int mipmaps             # Mipmap levels, 1 by default
        int format              # Data format (PixelFormat type)

    # Texture2D, same as Texture
    ctypedef Texture Texture2D

    # RenderTexture, fbo for texture rendering
    ctypedef struct RenderTexture:
        unsigned int id         # OpenGL framebuffer object id
        Texture texture         # Color buffer attachment texture
        Texture depth           # Depth buffer attachment texture
    
    # RenderTexture2D, same as RenderTexture
    ctypedef RenderTexture RenderTexture2D

    
    # NPatchInfo, n-patch layout info
    ctypedef struct NPatchInfo:
        Rectangle source        # Texture source rectangle
        int left                # Left border offset
        int top                 # Top border offset
        int right               # Right border offset
        int bottom              # Bottom border offset
        int layout              # Layout of the n-patch: 3x3, 1x3 or 3x1

    # GlyphInfo, font characters glyphs info
    ctypedef struct GlyphInfo:
        int value               # Character value (Unicode)
        int offsetX             # Character offset X when drawing
        int offsetY             # Character offset Y when drawing
        int advanceX            # Character advance position X
        Image image             # Character image data
    
    # Font, font texture and GlyphInfo array data
    ctypedef struct Font:
        int baseSize            # Base size (default chars height)
        int glyphCount          # Number of glyph characters
        int glyphPadding        # Padding around the glyph characters
        Texture2D texture       # Texture atlas containing the glyphs
        Rectangle *recs         # Rectangles in texture for the glyphs
        GlyphInfo *glyphs       # Glyphs info data

    # Camera, defines position/orientation in 3d space
    ctypedef struct Camera3D:
        Vector3 position        # Camera position
        Vector3 target          # Camera target it looks-at
        Vector3 up              # Camera up vector (rotation over its axis)
        float fovy              # Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
        int projection          # Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC

    ctypedef Camera3D Camera    # Camera type fallback, defaults to Camera3D

    
    # Mesh, vertex data and vao/vbo
    ctypedef struct Mesh:
        int vertexCount         # Number of vertices stored in arrays
        int triangleCount       # Number of triangles stored (indexed or not)

        # Vertex attributes data
        float *vertices         # Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
        float *texcoords        # Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
        float *texcoords2       # Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
        float *normals          # Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
        float *tangents         # Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
        unsigned char *colors       # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
        unsigned short *indices     # Vertex indices (in case vertex data comes indexed)

        # Animation vertex data
        float *animVertices     # Animated vertex positions (after bones transformations)
        float *animNormals      # Animated normals (after bones transformations)
        unsigned char *boneIds  # Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
        float *boneWeights      # Vertex bone weight, up to 4 bones influence by vertex (skinning)

        # OpenGL identifiers
        unsigned int vaoId      # OpenGL Vertex Array Object id
        unsigned int *vboId     # OpenGL Vertex Buffer Objects id (default vertex data)
    
    # Shader
    ctypedef struct Shader:
        unsigned int id         # Shader program id
        int *locs               # Shader locations array (RL_MAX_SHADER_LOCATIONS)
    
    # MaterialMap
    ctypedef struct MaterialMap:
        Texture2D texture       # Material map texture
        Color color             # Material map color
        float value             # Material map value

    # Material, includes shader and maps
    ctypedef struct Material:
        Shader shader           # Material shader
        MaterialMap *maps       # Material maps array (MAX_MATERIAL_MAPS)
        float params[4]         # Material generic parameters (if required)
    
    # Transform, vertex transformation data
    ctypedef struct Transform:
        Vector3 translation     # Translation
        Quaternion rotation     # Rotation
        Vector3 scale           # Scale

    
    # Bone, skeletal animation bone
    ctypedef struct BoneInfo:
        char name[32]          # Bone name
        int parent             # Bone parent
    

    # Model, meshes, materials and animation data
    ctypedef struct Model:
        Matrix transform       # Local transform matrix

        int meshCount          # Number of meshes
        int materialCount      # Number of materials
        Mesh *meshes           # Meshes array
        Material *materials    # Materials array
        int *meshMaterial      # Mesh material number

        # Animation data
        int boneCount          # Number of bones
        BoneInfo *bones        # Bones information (skeleton)
        Transform *bindPose    # Bones base transformation (pose)
    

    # ModelAnimation
    ctypedef struct ModelAnimation:
        int boneCount          # Number of bones
        int frameCount         # Number of animation frames
        BoneInfo *bones        # Bones information (skeleton)
        Transform **framePoses # Poses array by frame
        char name[32]          # Animation name
    

    # Ray, ray for raycasting
    ctypedef struct Ray:
        Vector3 position       # Ray position (origin)
        Vector3 direction      # Ray direction
    
        
    # RayCollision, ray hit information
    ctypedef struct RayCollision:
        bint hit               # Did the ray hit something?
        float distance         # Distance to the nearest hit
        Vector3 point          # Point of the nearest hit
        Vector3 normal         # Surface normal of hit
    

    # BoundingBox
    ctypedef struct BoundingBox:
        Vector3 min            # Minimum vertex box-corner
        Vector3 max            # Maximum vertex box-corner
    

    # Wave, audio wave data
    ctypedef struct Wave:
        unsigned int frameCount    # Total number of frames (considering channels)
        unsigned int sampleRate    # Frequency (samples per second)
        unsigned int sampleSize    # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
        unsigned int channels      # Number of channels (1-mono, 2-stereo, ...)
        void *data                 # Buffer data pointer
    

    # Opaque structs declaration
    # NOTE: Actual structs are defined internally in raudio module
    #ctypedef struct rAudioBuffer rAudioBuffer
    #ctypedef struct rAudioProcessor rAudioProcessor
    ctypedef struct rAudioProcessor
    ctypedef struct rAudioBuffer

    # AudioStream, custom audio stream
    ctypedef struct AudioStream:
        rAudioBuffer *buffer       # Pointer to internal data used by the audio system
        rAudioProcessor *processor # Pointer to internal data processor, useful for audio effects

        unsigned int sampleRate    # Frequency (samples per second)
        unsigned int sampleSize    # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
        unsigned int channels      # Number of channels (1-mono, 2-stereo, ...)
    

    # Sound
    ctypedef struct Sound:
        AudioStream stream         # Audio stream
        unsigned int frameCount    # Total number of frames (considering channels)
    

    # Music, audio stream, anything longer than ~10 seconds should be streamed
    ctypedef struct Music:
        AudioStream stream         # Audio stream
        unsigned int frameCount    # Total number of frames (considering channels)
        bint looping               # Music looping enable

        int ctxType                # Type of music context (audio filetype)
        void *ctxData              # Audio context data, depends on type
    

    # VrDeviceInfo, Head-Mounted-Display device parameters
    ctypedef struct VrDeviceInfo:
        int hResolution                # Horizontal resolution in pixels
        int vResolution                # Vertical resolution in pixels
        float hScreenSize              # Horizontal size in meters
        float vScreenSize              # Vertical size in meters
        float eyeToScreenDistance      # Distance between eye and display in meters
        float lensSeparationDistance   # Lens separation distance in meters
        float interpupillaryDistance   # IPD (distance between pupils) in meters
        float lensDistortionValues[4]  # Lens distortion constant parameters
        float chromaAbCorrection[4]    # Chromatic aberration correction parameters
    

    # VrStereoConfig, VR stereo rendering configuration for simulator
    ctypedef struct VrStereoConfig:
        Matrix projection[2]           # VR projection matrices (per eye)
        Matrix viewOffset[2]           # VR view offset matrices (per eye)
        float leftLensCenter[2]        # VR left lens center
        float rightLensCenter[2]       # VR right lens center
        float leftScreenCenter[2]      # VR left screen center
        float rightScreenCenter[2]     # VR right screen center
        float scale[2]                 # VR distortion scale
        float scaleIn[2]               # VR distortion scale in
    

    # File path list
    ctypedef struct FilePathList:
        unsigned int capacity          # Filepaths max entries
        unsigned int count             # Filepaths entries count
        char **paths                   # Filepaths entries
    

    # Automation event
    ctypedef struct AutomationEvent:
        unsigned int frame             # Event frame
        unsigned int type              # Event type (AutomationEventType)
        int params[4]                  # Event parameters (if required)
    

    # Automation event list
    ctypedef struct AutomationEventList:
        unsigned int capacity          # Events max entries (MAX_AUTOMATION_EVENTS)
        unsigned int count             # Events entries count
        AutomationEvent *events        # Events entries
    

    # ----------------------------------------------------------------------------------
    #  Enumerators Definition
    # ----------------------------------------------------------------------------------
    #  System/Window config flags
    #  NOTE: Every bit registers one state (use it with bit masks)
    #  By default all flags are set to 0
    ctypedef enum ConfigFlags:
        FLAG_VSYNC_HINT         = 0x00000040,   # Set to try enabling V-Sync on GPU
        FLAG_FULLSCREEN_MODE    = 0x00000002,   # Set to run program in fullscreen
        FLAG_WINDOW_RESIZABLE   = 0x00000004,   # Set to allow resizable window
        FLAG_WINDOW_UNDECORATED = 0x00000008,   # Set to disable window decoration (frame and buttons)
        FLAG_WINDOW_HIDDEN      = 0x00000080,   # Set to hide window
        FLAG_WINDOW_MINIMIZED   = 0x00000200,   # Set to minimize window (iconify)
        FLAG_WINDOW_MAXIMIZED   = 0x00000400,   # Set to maximize window (expanded to monitor)
        FLAG_WINDOW_UNFOCUSED   = 0x00000800,   # Set to window non focused
        FLAG_WINDOW_TOPMOST     = 0x00001000,   # Set to window always on top
        FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,   # Set to allow windows running while minimized
        FLAG_WINDOW_TRANSPARENT = 0x00000010,   # Set to allow transparent framebuffer
        FLAG_WINDOW_HIGHDPI     = 0x00002000,   # Set to support HighDPI
        FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000, # Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
        FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, # Set to run program in borderless windowed mode
        FLAG_MSAA_4X_HINT       = 0x00000020,   # Set to try enabling MSAA 4X
        FLAG_INTERLACED_HINT    = 0x00010000    # Set to try enabling interlaced video format (for V3D)
    
    
    # Trace log level
    # NOTE: Organized by priority level
    ctypedef enum TraceLogLevel:
        LOG_ALL = 0,        # Display all logs
        LOG_TRACE,          # Trace logging, intended for internal use only
        LOG_DEBUG,          # Debug logging, used for internal debugging, it should be disabled on release builds
        LOG_INFO,           # Info logging, used for program execution info
        LOG_WARNING,        # Warning logging, used on recoverable failures
        LOG_ERROR,          # Error logging, used on unrecoverable failures
        LOG_FATAL,          # Fatal logging, used to abort program: exit(EXIT_FAILURE)
        LOG_NONE            # Disable logging
    
        
    # Keyboard keys (US keyboard layout)
    # NOTE: Use GetKeyPressed() to allow redefining
    # required keys for alternative layouts
    ctypedef enum KeyboardKey:
        KEY_NULL            = 0,        # Key: NULL, used for no key pressed
        # Alphanumeric keys
        KEY_APOSTROPHE      = 39,       # Key: '
        KEY_COMMA           = 44,       # Key: ,
        KEY_MINUS           = 45,       # Key: -
        KEY_PERIOD          = 46,       # Key: .
        KEY_SLASH           = 47,       # Key: /
        KEY_ZERO            = 48,       # Key: 0
        KEY_ONE             = 49,       # Key: 1
        KEY_TWO             = 50,       # Key: 2
        KEY_THREE           = 51,       # Key: 3
        KEY_FOUR            = 52,       # Key: 4
        KEY_FIVE            = 53,       # Key: 5
        KEY_SIX             = 54,       # Key: 6
        KEY_SEVEN           = 55,       # Key: 7
        KEY_EIGHT           = 56,       # Key: 8
        KEY_NINE            = 57,       # Key: 9
        KEY_SEMICOLON       = 59,       # Key: ;
        KEY_EQUAL           = 61,       # Key: =
        KEY_A               = 65,       # Key: A | a
        KEY_B               = 66,       # Key: B | b
        KEY_C               = 67,       # Key: C | c
        KEY_D               = 68,       # Key: D | d
        KEY_E               = 69,       # Key: E | e
        KEY_F               = 70,       # Key: F | f
        KEY_G               = 71,       # Key: G | g
        KEY_H               = 72,       # Key: H | h
        KEY_I               = 73,       # Key: I | i
        KEY_J               = 74,       # Key: J | j
        KEY_K               = 75,       # Key: K | k
        KEY_L               = 76,       # Key: L | l
        KEY_M               = 77,       # Key: M | m
        KEY_N               = 78,       # Key: N | n
        KEY_O               = 79,       # Key: O | o
        KEY_P               = 80,       # Key: P | p
        KEY_Q               = 81,       # Key: Q | q
        KEY_R               = 82,       # Key: R | r
        KEY_S               = 83,       # Key: S | s
        KEY_T               = 84,       # Key: T | t
        KEY_U               = 85,       # Key: U | u
        KEY_V               = 86,       # Key: V | v
        KEY_W               = 87,       # Key: W | w
        KEY_X               = 88,       # Key: X | x
        KEY_Y               = 89,       # Key: Y | y
        KEY_Z               = 90,       # Key: Z | z
        KEY_LEFT_BRACKET    = 91,       # Key: [
        KEY_BACKSLASH       = 92,       # Key: '\'
        KEY_RIGHT_BRACKET   = 93,       # Key: ]
        KEY_GRAVE           = 96,       # Key: `
        # Function keys
        KEY_SPACE           = 32,       # Key: Space
        KEY_ESCAPE          = 256,      # Key: Esc
        KEY_ENTER           = 257,      # Key: Enter
        KEY_TAB             = 258,      # Key: Tab
        KEY_BACKSPACE       = 259,      # Key: Backspace
        KEY_INSERT          = 260,      # Key: Ins
        KEY_DELETE          = 261,      # Key: Del
        KEY_RIGHT           = 262,      # Key: Cursor right
        KEY_LEFT            = 263,      # Key: Cursor left
        KEY_DOWN            = 264,      # Key: Cursor down
        KEY_UP              = 265,      # Key: Cursor up
        KEY_PAGE_UP         = 266,      # Key: Page up
        KEY_PAGE_DOWN       = 267,      # Key: Page down
        KEY_HOME            = 268,      # Key: Home
        KEY_END             = 269,      # Key: End
        KEY_CAPS_LOCK       = 280,      # Key: Caps lock
        KEY_SCROLL_LOCK     = 281,      # Key: Scroll down
        KEY_NUM_LOCK        = 282,      # Key: Num lock
        KEY_PRINT_SCREEN    = 283,      # Key: Print screen
        KEY_PAUSE           = 284,      # Key: Pause
        KEY_F1              = 290,      # Key: F1
        KEY_F2              = 291,      # Key: F2
        KEY_F3              = 292,      # Key: F3
        KEY_F4              = 293,      # Key: F4
        KEY_F5              = 294,      # Key: F5
        KEY_F6              = 295,      # Key: F6
        KEY_F7              = 296,      # Key: F7
        KEY_F8              = 297,      # Key: F8
        KEY_F9              = 298,      # Key: F9
        KEY_F10             = 299,      # Key: F10
        KEY_F11             = 300,      # Key: F11
        KEY_F12             = 301,      # Key: F12
        KEY_LEFT_SHIFT      = 340,      # Key: Shift left
        KEY_LEFT_CONTROL    = 341,      # Key: Control left
        KEY_LEFT_ALT        = 342,      # Key: Alt left
        KEY_LEFT_SUPER      = 343,      # Key: Super left
        KEY_RIGHT_SHIFT     = 344,      # Key: Shift right
        KEY_RIGHT_CONTROL   = 345,      # Key: Control right
        KEY_RIGHT_ALT       = 346,      # Key: Alt right
        KEY_RIGHT_SUPER     = 347,      # Key: Super right
        KEY_KB_MENU         = 348,      # Key: KB menu
        # Keypad keys
        KEY_KP_0            = 320,      # Key: Keypad 0
        KEY_KP_1            = 321,      # Key: Keypad 1
        KEY_KP_2            = 322,      # Key: Keypad 2
        KEY_KP_3            = 323,      # Key: Keypad 3
        KEY_KP_4            = 324,      # Key: Keypad 4
        KEY_KP_5            = 325,      # Key: Keypad 5
        KEY_KP_6            = 326,      # Key: Keypad 6
        KEY_KP_7            = 327,      # Key: Keypad 7
        KEY_KP_8            = 328,      # Key: Keypad 8
        KEY_KP_9            = 329,      # Key: Keypad 9
        KEY_KP_DECIMAL      = 330,      # Key: Keypad .
        KEY_KP_DIVIDE       = 331,      # Key: Keypad /
        KEY_KP_MULTIPLY     = 332,      # Key: Keypad *
        KEY_KP_SUBTRACT     = 333,      # Key: Keypad -
        KEY_KP_ADD          = 334,      # Key: Keypad +
        KEY_KP_ENTER        = 335,      # Key: Keypad Enter
        KEY_KP_EQUAL        = 336,      # Key: Keypad =
        # Android key buttons
        KEY_BACK            = 4,        # Key: Android back button
        KEY_MENU            = 5,        # Key: Android menu button
        KEY_VOLUME_UP       = 24,       # Key: Android volume up button
        KEY_VOLUME_DOWN     = 25        # Key: Android volume down button

    # Add backwards compatibility support for deprecated names
    #define MOUSE_LEFT_BUTTON   MOUSE_BUTTON_LEFT
    #define MOUSE_RIGHT_BUTTON  MOUSE_BUTTON_RIGHT
    #define MOUSE_MIDDLE_BUTTON MOUSE_BUTTON_MIDDLE

    # Mouse buttons
    ctypedef enum MouseButton:
        MOUSE_BUTTON_LEFT    = 0,       # Mouse button left
        MOUSE_BUTTON_RIGHT   = 1,       # Mouse button right
        MOUSE_BUTTON_MIDDLE  = 2,       # Mouse button middle (pressed wheel)
        MOUSE_BUTTON_SIDE    = 3,       # Mouse button side (advanced mouse device)
        MOUSE_BUTTON_EXTRA   = 4,       # Mouse button extra (advanced mouse device)
        MOUSE_BUTTON_FORWARD = 5,       # Mouse button forward (advanced mouse device)
        MOUSE_BUTTON_BACK    = 6,       # Mouse button back (advanced mouse device)

    # Mouse cursor
    ctypedef enum MouseCursor:
        MOUSE_CURSOR_DEFAULT       = 0,     # Default pointer shape
        MOUSE_CURSOR_ARROW         = 1,     # Arrow shape
        MOUSE_CURSOR_IBEAM         = 2,     # Text writing cursor shape
        MOUSE_CURSOR_CROSSHAIR     = 3,     # Cross shape
        MOUSE_CURSOR_POINTING_HAND = 4,     # Pointing hand cursor
        MOUSE_CURSOR_RESIZE_EW     = 5,     # Horizontal resize/move arrow shape
        MOUSE_CURSOR_RESIZE_NS     = 6,     # Vertical resize/move arrow shape
        MOUSE_CURSOR_RESIZE_NWSE   = 7,     # Top-left to bottom-right diagonal resize/move arrow shape
        MOUSE_CURSOR_RESIZE_NESW   = 8,     # The top-right to bottom-left diagonal resize/move arrow shape
        MOUSE_CURSOR_RESIZE_ALL    = 9,     # The omnidirectional resize/move cursor shape
        MOUSE_CURSOR_NOT_ALLOWED   = 10     # The operation-not-allowed shape

    # Gamepad buttons
    ctypedef enum GamepadButton:
        GAMEPAD_BUTTON_UNKNOWN = 0,         # Unknown button, just for error checking
        GAMEPAD_BUTTON_LEFT_FACE_UP,        # Gamepad left DPAD up button
        GAMEPAD_BUTTON_LEFT_FACE_RIGHT,     # Gamepad left DPAD right button
        GAMEPAD_BUTTON_LEFT_FACE_DOWN,      # Gamepad left DPAD down button
        GAMEPAD_BUTTON_LEFT_FACE_LEFT,      # Gamepad left DPAD left button
        GAMEPAD_BUTTON_RIGHT_FACE_UP,       # Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
        GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,    # Gamepad right button right (i.e. PS3: Square, Xbox: X)
        GAMEPAD_BUTTON_RIGHT_FACE_DOWN,     # Gamepad right button down (i.e. PS3: Cross, Xbox: A)
        GAMEPAD_BUTTON_RIGHT_FACE_LEFT,     # Gamepad right button left (i.e. PS3: Circle, Xbox: B)
        GAMEPAD_BUTTON_LEFT_TRIGGER_1,      # Gamepad top/back trigger left (first), it could be a trailing button
        GAMEPAD_BUTTON_LEFT_TRIGGER_2,      # Gamepad top/back trigger left (second), it could be a trailing button
        GAMEPAD_BUTTON_RIGHT_TRIGGER_1,     # Gamepad top/back trigger right (one), it could be a trailing button
        GAMEPAD_BUTTON_RIGHT_TRIGGER_2,     # Gamepad top/back trigger right (second), it could be a trailing button
        GAMEPAD_BUTTON_MIDDLE_LEFT,         # Gamepad center buttons, left one (i.e. PS3: Select)
        GAMEPAD_BUTTON_MIDDLE,              # Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
        GAMEPAD_BUTTON_MIDDLE_RIGHT,        # Gamepad center buttons, right one (i.e. PS3: Start)
        GAMEPAD_BUTTON_LEFT_THUMB,          # Gamepad joystick pressed button left
        GAMEPAD_BUTTON_RIGHT_THUMB          # Gamepad joystick pressed button right

    # Gamepad axis
    ctypedef enum GamepadAxis:
        GAMEPAD_AXIS_LEFT_X        = 0,     # Gamepad left stick X axis
        GAMEPAD_AXIS_LEFT_Y        = 1,     # Gamepad left stick Y axis
        GAMEPAD_AXIS_RIGHT_X       = 2,     # Gamepad right stick X axis
        GAMEPAD_AXIS_RIGHT_Y       = 3,     # Gamepad right stick Y axis
        GAMEPAD_AXIS_LEFT_TRIGGER  = 4,     # Gamepad back trigger left, pressure level: [1..-1]
        GAMEPAD_AXIS_RIGHT_TRIGGER = 5      # Gamepad back trigger right, pressure level: [1..-1]

    # Material map index
    ctypedef enum MaterialMapIndex:
        MATERIAL_MAP_ALBEDO = 0,        # Albedo material (same as: MATERIAL_MAP_DIFFUSE)
        MATERIAL_MAP_METALNESS,         # Metalness material (same as: MATERIAL_MAP_SPECULAR)
        MATERIAL_MAP_NORMAL,            # Normal material
        MATERIAL_MAP_ROUGHNESS,         # Roughness material
        MATERIAL_MAP_OCCLUSION,         # Ambient occlusion material
        MATERIAL_MAP_EMISSION,          # Emission material
        MATERIAL_MAP_HEIGHT,            # Heightmap material
        MATERIAL_MAP_CUBEMAP,           # Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        MATERIAL_MAP_IRRADIANCE,        # Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        MATERIAL_MAP_PREFILTER,         # Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        MATERIAL_MAP_BRDF               # Brdf material

    #define MATERIAL_MAP_DIFFUSE      MATERIAL_MAP_ALBEDO
    #define MATERIAL_MAP_SPECULAR     MATERIAL_MAP_METALNESS

    # Shader location index
    ctypedef enum ShaderLocationIndex:
        SHADER_LOC_VERTEX_POSITION = 0, # Shader location: vertex attribute: position
        SHADER_LOC_VERTEX_TEXCOORD01,   # Shader location: vertex attribute: texcoord01
        SHADER_LOC_VERTEX_TEXCOORD02,   # Shader location: vertex attribute: texcoord02
        SHADER_LOC_VERTEX_NORMAL,       # Shader location: vertex attribute: normal
        SHADER_LOC_VERTEX_TANGENT,      # Shader location: vertex attribute: tangent
        SHADER_LOC_VERTEX_COLOR,        # Shader location: vertex attribute: color
        SHADER_LOC_MATRIX_MVP,          # Shader location: matrix uniform: model-view-projection
        SHADER_LOC_MATRIX_VIEW,         # Shader location: matrix uniform: view (camera transform)
        SHADER_LOC_MATRIX_PROJECTION,   # Shader location: matrix uniform: projection
        SHADER_LOC_MATRIX_MODEL,        # Shader location: matrix uniform: model (transform)
        SHADER_LOC_MATRIX_NORMAL,       # Shader location: matrix uniform: normal
        SHADER_LOC_VECTOR_VIEW,         # Shader location: vector uniform: view
        SHADER_LOC_COLOR_DIFFUSE,       # Shader location: vector uniform: diffuse color
        SHADER_LOC_COLOR_SPECULAR,      # Shader location: vector uniform: specular color
        SHADER_LOC_COLOR_AMBIENT,       # Shader location: vector uniform: ambient color
        SHADER_LOC_MAP_ALBEDO,          # Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
        SHADER_LOC_MAP_METALNESS,       # Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
        SHADER_LOC_MAP_NORMAL,          # Shader location: sampler2d texture: normal
        SHADER_LOC_MAP_ROUGHNESS,       # Shader location: sampler2d texture: roughness
        SHADER_LOC_MAP_OCCLUSION,       # Shader location: sampler2d texture: occlusion
        SHADER_LOC_MAP_EMISSION,        # Shader location: sampler2d texture: emission
        SHADER_LOC_MAP_HEIGHT,          # Shader location: sampler2d texture: height
        SHADER_LOC_MAP_CUBEMAP,         # Shader location: samplerCube texture: cubemap
        SHADER_LOC_MAP_IRRADIANCE,      # Shader location: samplerCube texture: irradiance
        SHADER_LOC_MAP_PREFILTER,       # Shader location: samplerCube texture: prefilter
        SHADER_LOC_MAP_BRDF             # Shader location: sampler2d texture: brdf

    #define SHADER_LOC_MAP_DIFFUSE      SHADER_LOC_MAP_ALBEDO
    #define SHADER_LOC_MAP_SPECULAR     SHADER_LOC_MAP_METALNESS

    # Shader uniform data type
    ctypedef enum ShaderUniformDataType:
        SHADER_UNIFORM_FLOAT = 0,       # Shader uniform type: float
        SHADER_UNIFORM_VEC2,            # Shader uniform type: vec2 (2 float)
        SHADER_UNIFORM_VEC3,            # Shader uniform type: vec3 (3 float)
        SHADER_UNIFORM_VEC4,            # Shader uniform type: vec4 (4 float)
        SHADER_UNIFORM_INT,             # Shader uniform type: int
        SHADER_UNIFORM_IVEC2,           # Shader uniform type: ivec2 (2 int)
        SHADER_UNIFORM_IVEC3,           # Shader uniform type: ivec3 (3 int)
        SHADER_UNIFORM_IVEC4,           # Shader uniform type: ivec4 (4 int)
        SHADER_UNIFORM_SAMPLER2D        # Shader uniform type: sampler2d

    # Shader attribute data types
    ctypedef enum ShaderAttributeDataType:
        SHADER_ATTRIB_FLOAT = 0,        # Shader attribute type: float
        SHADER_ATTRIB_VEC2,             # Shader attribute type: vec2 (2 float)
        SHADER_ATTRIB_VEC3,             # Shader attribute type: vec3 (3 float)
        SHADER_ATTRIB_VEC4              # Shader attribute type: vec4 (4 float)

    # Pixel formats
    # NOTE: Support depends on OpenGL version and platform
    ctypedef enum PixelFormat:
        PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1, # 8 bit per pixel (no alpha)
        PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,    # 8*2 bpp (2 channels)
        PIXELFORMAT_UNCOMPRESSED_R5G6B5,        # 16 bpp
        PIXELFORMAT_UNCOMPRESSED_R8G8B8,        # 24 bpp
        PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,      # 16 bpp (1 bit alpha)
        PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,      # 16 bpp (4 bit alpha)
        PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,      # 32 bpp
        PIXELFORMAT_UNCOMPRESSED_R32,           # 32 bpp (1 channel - float)
        PIXELFORMAT_UNCOMPRESSED_R32G32B32,     # 32*3 bpp (3 channels - float)
        PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,  # 32*4 bpp (4 channels - float)
        PIXELFORMAT_UNCOMPRESSED_R16,           # 16 bpp (1 channel - half float)
        PIXELFORMAT_UNCOMPRESSED_R16G16B16,     # 16*3 bpp (3 channels - half float)
        PIXELFORMAT_UNCOMPRESSED_R16G16B16A16,  # 16*4 bpp (4 channels - half float)
        PIXELFORMAT_COMPRESSED_DXT1_RGB,        # 4 bpp (no alpha)
        PIXELFORMAT_COMPRESSED_DXT1_RGBA,       # 4 bpp (1 bit alpha)
        PIXELFORMAT_COMPRESSED_DXT3_RGBA,       # 8 bpp
        PIXELFORMAT_COMPRESSED_DXT5_RGBA,       # 8 bpp
        PIXELFORMAT_COMPRESSED_ETC1_RGB,        # 4 bpp
        PIXELFORMAT_COMPRESSED_ETC2_RGB,        # 4 bpp
        PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,   # 8 bpp
        PIXELFORMAT_COMPRESSED_PVRT_RGB,        # 4 bpp
        PIXELFORMAT_COMPRESSED_PVRT_RGBA,       # 4 bpp
        PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,   # 8 bpp
        PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA    # 2 bpp

    # Texture parameters: filter mode
    # NOTE 1: Filtering considers mipmaps if available in the texture
    # NOTE 2: Filter is accordingly set for minification and magnification
    ctypedef enum TextureFilter:
        TEXTURE_FILTER_POINT = 0,               # No filter, just pixel approximation
        TEXTURE_FILTER_BILINEAR,                # Linear filtering
        TEXTURE_FILTER_TRILINEAR,               # Trilinear filtering (linear with mipmaps)
        TEXTURE_FILTER_ANISOTROPIC_4X,          # Anisotropic filtering 4x
        TEXTURE_FILTER_ANISOTROPIC_8X,          # Anisotropic filtering 8x
        TEXTURE_FILTER_ANISOTROPIC_16X,         # Anisotropic filtering 16x


    # Texture parameters: wrap mode
    ctypedef enum TextureWrap:
        TEXTURE_WRAP_REPEAT = 0,                # Repeats texture in tiled mode
        TEXTURE_WRAP_CLAMP,                     # Clamps texture to edge pixel in tiled mode
        TEXTURE_WRAP_MIRROR_REPEAT,             # Mirrors and repeats the texture in tiled mode
        TEXTURE_WRAP_MIRROR_CLAMP               # Mirrors and clamps to border the texture in tiled mode

    # Cubemap layouts
    ctypedef enum CubemapLayout:
        CUBEMAP_LAYOUT_AUTO_DETECT = 0,         # Automatically detect layout type
        CUBEMAP_LAYOUT_LINE_VERTICAL,           # Layout is defined by a vertical line with faces
        CUBEMAP_LAYOUT_LINE_HORIZONTAL,         # Layout is defined by a horizontal line with faces
        CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,     # Layout is defined by a 3x4 cross with cubemap faces
        CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE,     # Layout is defined by a 4x3 cross with cubemap faces
        CUBEMAP_LAYOUT_PANORAMA                 # Layout is defined by a panorama image (equirrectangular map)

    # Font type, defines generation method
    ctypedef enum FontType:
        FONT_DEFAULT = 0,               # Default font generation, anti-aliased
        FONT_BITMAP,                    # Bitmap font generation, no anti-aliasing
        FONT_SDF                        # SDF font generation, requires external shader

    # Color blending modes (pre-defined)
    ctypedef enum BlendMode:
        BLEND_ALPHA = 0,                # Blend textures considering alpha (default)
        BLEND_ADDITIVE,                 # Blend textures adding colors
        BLEND_MULTIPLIED,               # Blend textures multiplying colors
        BLEND_ADD_COLORS,               # Blend textures adding colors (alternative)
        BLEND_SUBTRACT_COLORS,          # Blend textures subtracting colors (alternative)
        BLEND_ALPHA_PREMULTIPLY,        # Blend premultiplied textures considering alpha
        BLEND_CUSTOM,                   # Blend textures using custom src/dst factors (use rlSetBlendFactors())
        BLEND_CUSTOM_SEPARATE           # Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())

    # Gesture
    # NOTE: Provided as bit-wise flags to enable only desired gestures
    ctypedef enum Gesture:
        GESTURE_NONE        = 0,        # No gesture
        GESTURE_TAP         = 1,        # Tap gesture
        GESTURE_DOUBLETAP   = 2,        # Double tap gesture
        GESTURE_HOLD        = 4,        # Hold gesture
        GESTURE_DRAG        = 8,        # Drag gesture
        GESTURE_SWIPE_RIGHT = 16,       # Swipe right gesture
        GESTURE_SWIPE_LEFT  = 32,       # Swipe left gesture
        GESTURE_SWIPE_UP    = 64,       # Swipe up gesture
        GESTURE_SWIPE_DOWN  = 128,      # Swipe down gesture
        GESTURE_PINCH_IN    = 256,      # Pinch in gesture
        GESTURE_PINCH_OUT   = 512       # Pinch out gesture

    # Camera system modes
    ctypedef enum CameraMode:
        CAMERA_CUSTOM = 0,              # Custom camera
        CAMERA_FREE,                    # Free camera
        CAMERA_ORBITAL,                 # Orbital camera
        CAMERA_FIRST_PERSON,            # First person camera
        CAMERA_THIRD_PERSON             # Third person camera

    # Camera projection
    ctypedef enum CameraProjection:
        CAMERA_PERSPECTIVE = 0,         # Perspective projection
        CAMERA_ORTHOGRAPHIC             # Orthographic projection


    # N-patch layout
    ctypedef enum NPatchLayout:
        NPATCH_NINE_PATCH = 0,          # Npatch layout: 3x3 tiles
        NPATCH_THREE_PATCH_VERTICAL,    # Npatch layout: 1x3 tiles
        NPATCH_THREE_PATCH_HORIZONTAL   # Npatch layout: 3x1 tiles