
cdef extern from "./libs/rlgl.h":

    cdef int RL_DEFAULT_BATCH_BUFFERS
    cdef int RL_DEFAULT_BATCH_DRAWCALLS
    cdef int RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS
    cdef int RL_MAX_MATRIX_STACK_SIZE
    cdef int RL_CULL_DISTANCE_NEAR
    cdef int RL_CULL_DISTANCE_FAR
    cdef int RL_TEXTURE_WRAP_S
    cdef int RL_TEXTURE_WRAP_T                    
    cdef int RL_TEXTURE_MAG_FILTER                
    cdef int RL_TEXTURE_MIN_FILTER                
    cdef int RL_TEXTURE_FILTER_NEAREST            
    cdef int RL_TEXTURE_FILTER_LINEAR             
    cdef int RL_TEXTURE_FILTER_MIP_NEAREST        
    cdef int RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR 
    cdef int RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST 
    cdef int RL_TEXTURE_FILTER_MIP_LINEAR         
    cdef int RL_TEXTURE_FILTER_ANISOTROPIC        
    cdef int RL_TEXTURE_MIPMAP_BIAS_RATIO         
    cdef int RL_TEXTURE_WRAP_REPEAT               
    cdef int RL_TEXTURE_WRAP_CLAMP                
    cdef int RL_TEXTURE_WRAP_MIRROR_REPEAT        
    cdef int RL_TEXTURE_WRAP_MIRROR_CLAMP
    cdef int RL_MODELVIEW
    cdef int RL_PROJECTION
    cdef int RL_TEXTURE
    cdef int RL_LINES
    cdef int RL_TRIANGLES
    cdef int RL_QUADS
    cdef int RL_UNSIGNED_BYTE
    cdef int RL_FLOAT
    cdef int RL_STREAM_DRAW                
    cdef int RL_STREAM_READ                
    cdef int RL_STREAM_COPY                
    cdef int RL_STATIC_DRAW                
    cdef int RL_STATIC_READ                
    cdef int RL_STATIC_COPY                
    cdef int RL_DYNAMIC_DRAW               
    cdef int RL_DYNAMIC_READ               
    cdef int RL_DYNAMIC_COPY
    cdef int RL_FRAGMENT_SHADER            
    cdef int RL_VERTEX_SHADER              
    cdef int RL_COMPUTE_SHADER
    cdef int RL_ZERO                       
    cdef int RL_ONE                        
    cdef int RL_SRC_COLOR                  
    cdef int RL_ONE_MINUS_SRC_COLOR        
    cdef int RL_SRC_ALPHA                  
    cdef int RL_ONE_MINUS_SRC_ALPHA        
    cdef int RL_DST_ALPHA                  
    cdef int RL_ONE_MINUS_DST_ALPHA        
    cdef int RL_DST_COLOR                  
    cdef int RL_ONE_MINUS_DST_COLOR        
    cdef int RL_SRC_ALPHA_SATURATE         
    cdef int RL_CONSTANT_COLOR             
    cdef int RL_ONE_MINUS_CONSTANT_COLOR   
    cdef int RL_CONSTANT_ALPHA             
    cdef int RL_ONE_MINUS_CONSTANT_ALPHA
    cdef int RL_FUNC_ADD
    cdef int RL_MIN
    cdef int RL_MAX                        
    cdef int RL_FUNC_SUBTRACT              
    cdef int RL_FUNC_REVERSE_SUBTRACT      
    cdef int RL_BLEND_EQUATION             
    cdef int RL_BLEND_EQUATION_RGB         
    cdef int RL_BLEND_EQUATION_ALPHA       
    cdef int RL_BLEND_DST_RGB              
    cdef int RL_BLEND_SRC_RGB              
    cdef int RL_BLEND_DST_ALPHA            
    cdef int RL_BLEND_SRC_ALPHA            
    cdef int RL_BLEND_COLOR

    ctypedef struct Matrix:
        float m0, m4, m8, m12       # Matrix first row (4 components)
        float m1, m5, m9, m13       # Matrix second row (4 components)
        float m2, m6, m10, m14      # Matrix third row (4 components)
        float m3, m7, m11, m15      # Matrix fourth row (4 components)
    
    ctypedef struct rlVertexBuffer:
        int elementCount           # Number of elements in the buffer (QUADS)

        float *vertices            # Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
        float *texcoords           # Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
        unsigned char *colors      # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    
        unsigned int *indices      # Vertex indices (in case vertex data comes indexed) (6 indices per quad)
    
        unsigned int vaoId         # OpenGL Vertex Array Object id
        unsigned int vboId[4]      # OpenGL Vertex Buffer Objects id (4 types of vertex data)
    
    ctypedef struct rlDrawCall:
        int mode                   # Drawing mode: LINES, TRIANGLES, QUADS
        int vertexCount            # Number of vertex of the draw
        int vertexAlignment        # Number of vertex required for index alignment (LINES, TRIANGLES)
        #unsigned int vaoId        # Vertex array id to be used on the draw -> Using RLGL.currentBatch->vertexBuffer.vaoId
        #unsigned int shaderId     # Shader id to be used on the draw -> Using RLGL.currentShaderId
        unsigned int textureId     # Texture id to be used on the draw -> Use to create new draw call if changes

        #Matrix projection         # Projection matrix for this draw -> Using RLGL.projection by default
        #Matrix modelview          # Modelview matrix for this draw -> Using RLGL.modelview by default
    
    ctypedef struct rlRenderBatch:
        int bufferCount             # Number of vertex buffers (multi-buffering support)
        int currentBuffer           # Current buffer tracking in case of multi-buffering
        rlVertexBuffer *vertexBuffer  # Dynamic buffer(s) for vertex data

        rlDrawCall *draws           # Draw calls array, depends on textureId
        int drawCounter             # Draw calls counter
        float currentDepth          # Current depth value for next draw 

    # OpenGL version
    ctypedef enum rlGlVersion:
        RL_OPENGL_11 = 1,           # OpenGL 1.1
        RL_OPENGL_21 = 2,           # OpenGL 2.1 (GLSL 120)
        RL_OPENGL_33 = 3,           # OpenGL 3.3 (GLSL 330)
        RL_OPENGL_43 = 4,           # OpenGL 4.3 (using GLSL 330)
        RL_OPENGL_ES_20 = 5,        # OpenGL ES 2.0 (GLSL 100)
        RL_OPENGL_ES_30 = 6         # OpenGL ES 3.0 (GLSL 300 es)

    # Trace log level
    # NOTE: Organized by priority level
    ctypedef enum rlTraceLogLevel:
        RL_LOG_ALL = 0,             # Display all logs
        RL_LOG_TRACE = 1,           # Trace logging, intended for internal use only
        RL_LOG_DEBUG = 2,           # Debug logging, used for internal debugging, it should be disabled on release builds
        RL_LOG_INFO = 3,            # Info logging, used for program execution info
        RL_LOG_WARNING = 4,         # Warning logging, used on recoverable failures
        RL_LOG_ERROR = 5,           # Error logging, used on unrecoverable failures
        RL_LOG_FATAL = 6,           # Fatal logging, used to abort program: exit(EXIT_FAILURE)
        RL_LOG_NONE = 7             # Disable logging

    # Texture pixel formats
    # NOTE: Support depends on OpenGL version
    ctypedef enum rlPixelFormat:
        RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,     # 8 bit per pixel (no alpha)
        RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2,    # 8*2 bpp (2 channels)
        RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3,        # 16 bpp
        RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4,        # 24 bpp
        RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5,      # 16 bpp (1 bit alpha)
        RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6,      # 16 bpp (4 bit alpha)
        RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7,      # 32 bpp
        RL_PIXELFORMAT_UNCOMPRESSED_R32 = 8,           # 32 bpp (1 channel - float)
        RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9,     # 32*3 bpp (3 channels - float)
        RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10, # 32*4 bpp (4 channels - float)
        RL_PIXELFORMAT_UNCOMPRESSED_R16 = 11,          # 16 bpp (1 channel - half float)
        RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12,    # 16*3 bpp (3 channels - half float)
        RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13, # 16*4 bpp (4 channels - half float)
        RL_PIXELFORMAT_COMPRESSED_DXT1_RGB = 14,       # 4 bpp (no alpha)
        RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15,      # 4 bpp (1 bit alpha)
        RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16,      # 8 bpp
        RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17,      # 8 bpp
        RL_PIXELFORMAT_COMPRESSED_ETC1_RGB = 18,       # 4 bpp
        RL_PIXELFORMAT_COMPRESSED_ETC2_RGB = 19,       # 4 bpp
        RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20,  # 8 bpp
        RL_PIXELFORMAT_COMPRESSED_PVRT_RGB = 21,       # 4 bpp
        RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22,      # 4 bpp
        RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 23,  # 8 bpp
        RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 24   # 2 bpp

    # Texture parameters: filter mode
    # NOTE 1: Filtering considers mipmaps if available in the texture
    # NOTE 2: Filter is accordingly set for minification and magnification
    ctypedef enum rlTextureFilter:
        RL_TEXTURE_FILTER_POINT = 0,            # No filter, just pixel approximation
        RL_TEXTURE_FILTER_BILINEAR = 1,         # Linear filtering
        RL_TEXTURE_FILTER_TRILINEAR = 2,        # Trilinear filtering (linear with mipmaps)
        RL_TEXTURE_FILTER_ANISOTROPIC_4X = 3,   # Anisotropic filtering 4x
        RL_TEXTURE_FILTER_ANISOTROPIC_8X = 4,   # Anisotropic filtering 8x
        RL_TEXTURE_FILTER_ANISOTROPIC_16X = 5,  # Anisotropic filtering 16x


    # Color blending modes (pre-defined)
    ctypedef enum rlBlendMode :
        RL_BLEND_ALPHA = 0,                 # Blend textures considering alpha (default)
        RL_BLEND_ADDITIVE = 1,              # Blend textures adding colors
        RL_BLEND_MULTIPLIED = 2,            # Blend textures multiplying colors
        RL_BLEND_ADD_COLORS = 3,            # Blend textures adding colors (alternative)
        RL_BLEND_SUBTRACT_COLORS = 4,       # Blend textures subtracting colors (alternative)
        RL_BLEND_ALPHA_PREMULTIPLY = 5,     # Blend premultiplied textures considering alpha
        RL_BLEND_CUSTOM = 6,                # Blend textures using custom src/dst factors (use rlSetBlendFactors())
        RL_BLEND_CUSTOM_SEPARATE = 7        # Blend textures using custom src/dst factors (use rlSetBlendFactorsSeparate())

    # Shader location point type
    ctypedef enum rlShaderLocationIndex:
        RL_SHADER_LOC_VERTEX_POSITION = 0,  # Shader location: vertex attribute: position
        RL_SHADER_LOC_VERTEX_TEXCOORD01 = 1,# Shader location: vertex attribute: texcoord01
        RL_SHADER_LOC_VERTEX_TEXCOORD02 = 2,# Shader location: vertex attribute: texcoord02
        RL_SHADER_LOC_VERTEX_NORMAL = 3,    # Shader location: vertex attribute: normal
        RL_SHADER_LOC_VERTEX_TANGENT = 4,   # Shader location: vertex attribute: tangent
        RL_SHADER_LOC_VERTEX_COLOR = 5,     # Shader location: vertex attribute: color
        RL_SHADER_LOC_MATRIX_MVP = 6,       # Shader location: matrix uniform: model-view-projection
        RL_SHADER_LOC_MATRIX_VIEW = 7,      # Shader location: matrix uniform: view (camera transform)
        RL_SHADER_LOC_MATRIX_PROJECTION = 8,# Shader location: matrix uniform: projection
        RL_SHADER_LOC_MATRIX_MODEL = 9,     # Shader location: matrix uniform: model (transform)
        RL_SHADER_LOC_MATRIX_NORMAL = 10,   # Shader location: matrix uniform: normal
        RL_SHADER_LOC_VECTOR_VIEW = 11,     # Shader location: vector uniform: view
        RL_SHADER_LOC_COLOR_DIFFUSE = 12,   # Shader location: vector uniform: diffuse color
        RL_SHADER_LOC_COLOR_SPECULAR = 13,  # Shader location: vector uniform: specular color
        RL_SHADER_LOC_COLOR_AMBIENT = 14,   # Shader location: vector uniform: ambient color
        RL_SHADER_LOC_MAP_ALBEDO = 15,      # Shader location: sampler2d texture: albedo (same as: RL_SHADER_LOC_MAP_DIFFUSE)
        RL_SHADER_LOC_MAP_METALNESS = 16,   # Shader location: sampler2d texture: metalness (same as: RL_SHADER_LOC_MAP_SPECULAR)
        RL_SHADER_LOC_MAP_NORMAL = 17,      # Shader location: sampler2d texture: normal
        RL_SHADER_LOC_MAP_ROUGHNESS = 18,   # Shader location: sampler2d texture: roughness
        RL_SHADER_LOC_MAP_OCCLUSION = 19,   # Shader location: sampler2d texture: occlusion
        RL_SHADER_LOC_MAP_EMISSION = 20,    # Shader location: sampler2d texture: emission
        RL_SHADER_LOC_MAP_HEIGHT = 21,      # Shader location: sampler2d texture: height
        RL_SHADER_LOC_MAP_CUBEMAP = 22,     # Shader location: samplerCube texture: cubemap
        RL_SHADER_LOC_MAP_IRRADIANCE = 23,  # Shader location: samplerCube texture: irradiance
        RL_SHADER_LOC_MAP_PREFILTER = 24,   # Shader location: samplerCube texture: prefilter
        RL_SHADER_LOC_MAP_BRDF = 25         # Shader location: sampler2d texture: brdf

    #define RL_SHADER_LOC_MAP_DIFFUSE       RL_SHADER_LOC_MAP_ALBEDO
    #define RL_SHADER_LOC_MAP_SPECULAR      RL_SHADER_LOC_MAP_METALNESS

    # Shader uniform data type
    ctypedef enum rlShaderUniformDataType:
        RL_SHADER_UNIFORM_FLOAT = 0,        # Shader uniform type: float
        RL_SHADER_UNIFORM_VEC2 = 1,         # Shader uniform type: vec2 (2 float)
        RL_SHADER_UNIFORM_VEC3 = 2,         # Shader uniform type: vec3 (3 float)
        RL_SHADER_UNIFORM_VEC4 = 3,         # Shader uniform type: vec4 (4 float)
        RL_SHADER_UNIFORM_INT = 4,          # Shader uniform type: int
        RL_SHADER_UNIFORM_IVEC2 = 5,        # Shader uniform type: ivec2 (2 int)
        RL_SHADER_UNIFORM_IVEC3 = 6,        # Shader uniform type: ivec3 (3 int)
        RL_SHADER_UNIFORM_IVEC4 = 7,        # Shader uniform type: ivec4 (4 int)
        RL_SHADER_UNIFORM_SAMPLER2D = 8     # Shader uniform type: sampler2d

    # Shader attribute data types
    ctypedef enum rlShaderAttributeDataType:
        RL_SHADER_ATTRIB_FLOAT = 0,         # Shader attribute type: float
        RL_SHADER_ATTRIB_VEC2 = 1,          # Shader attribute type: vec2 (2 float)
        RL_SHADER_ATTRIB_VEC3 = 2,          # Shader attribute type: vec3 (3 float)
        RL_SHADER_ATTRIB_VEC4 = 3           # Shader attribute type: vec4 (4 float)

    # Framebuffer attachment type
    # NOTE: By default up to 8 color channels defined, but it can be more
    ctypedef enum rlFramebufferAttachType :
        RL_ATTACHMENT_COLOR_CHANNEL0 = 0,       # Framebuffer attachment type: color 0
        RL_ATTACHMENT_COLOR_CHANNEL1 = 1,       # Framebuffer attachment type: color 1
        RL_ATTACHMENT_COLOR_CHANNEL2 = 2,       # Framebuffer attachment type: color 2
        RL_ATTACHMENT_COLOR_CHANNEL3 = 3,       # Framebuffer attachment type: color 3
        RL_ATTACHMENT_COLOR_CHANNEL4 = 4,       # Framebuffer attachment type: color 4
        RL_ATTACHMENT_COLOR_CHANNEL5 = 5,       # Framebuffer attachment type: color 5
        RL_ATTACHMENT_COLOR_CHANNEL6 = 6,       # Framebuffer attachment type: color 6
        RL_ATTACHMENT_COLOR_CHANNEL7 = 7,       # Framebuffer attachment type: color 7
        RL_ATTACHMENT_DEPTH = 100,              # Framebuffer attachment type: depth
        RL_ATTACHMENT_STENCIL = 200,            # Framebuffer attachment type: stencil

    # Framebuffer texture attachment type
    ctypedef enum rlFramebufferAttachTextureType:
        RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0,   # Framebuffer texture attachment type: cubemap, +X side
        RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1,   # Framebuffer texture attachment type: cubemap, -X side
        RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2,   # Framebuffer texture attachment type: cubemap, +Y side
        RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3,   # Framebuffer texture attachment type: cubemap, -Y side
        RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4,   # Framebuffer texture attachment type: cubemap, +Z side
        RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5,   # Framebuffer texture attachment type: cubemap, -Z side
        RL_ATTACHMENT_TEXTURE2D = 100,          # Framebuffer texture attachment type: texture2d
        RL_ATTACHMENT_RENDERBUFFER = 200,       # Framebuffer texture attachment type: renderbuffer

    # Face culling mode
    ctypedef enum rlCullMode:
        RL_CULL_FACE_FRONT = 0,
        RL_CULL_FACE_BACK = 1
    
    # ------------------------------------------------------------------------------------
    #  Functions Declaration - Matrix operations
    # ------------------------------------------------------------------------------------


    cdef void rlMatrixMode(int mode)                    # Choose the current matrix to be transformed
    cdef void rlPushMatrix()                            # Push the current matrix to stack
    cdef void rlPopMatrix()                             # Pop latest inserted matrix from stack
    cdef void rlLoadIdentity()                          # Reset current matrix to identity matrix
    cdef void rlTranslatef(float x, float y, float z)   # Multiply the current matrix by a translation matrix
    cdef void rlRotatef(float angle, float x, float y, float z)  # Multiply the current matrix by a rotation matrix
    cdef void rlScalef(float x, float y, float z)       # Multiply the current matrix by a scaling matrix
    cdef void rlMultMatrixf(const float *matf)          # Multiply the current matrix by another matrix
    cdef void rlFrustum(double left, double right, double bottom, double top, double znear, double zfar)
    cdef void rlOrtho(double left, double right, double bottom, double top, double znear, double zfar)
    cdef void rlViewport(int x, int y, int width, int height) # Set the viewport area

    
    # ------------------------------------------------------------------------------------
    #  Functions Declaration - Vertex level operations
    # ------------------------------------------------------------------------------------
    cdef void rlBegin(int mode)                         # Initialize drawing mode (how to organize vertex)
    cdef void rlEnd()                                   # Finish vertex providing
    cdef void rlVertex2i(int x, int y)                  # Define one vertex (position) - 2 int
    cdef void rlVertex2f(float x, float y)              # Define one vertex (position) - 2 float
    cdef void rlVertex3f(float x, float y, float z)     # Define one vertex (position) - 3 float
    cdef void rlTexCoord2f(float x, float y)            # Define one vertex (texture coordinate) - 2 float
    cdef void rlNormal3f(float x, float y, float z)     # Define one vertex (normal) - 3 float
    cdef void rlColor4ub(unsigned char r, unsigned char g, unsigned char b, unsigned char a)  # Define one vertex (color) - 4 byte
    cdef void rlColor3f(float x, float y, float z)          # Define one vertex (color) - 3 float
    cdef void rlColor4f(float x, float y, float z, float w) # Define one vertex (color) - 4 float

    
    #------------------------------------------------------------------------------------
    # Functions Declaration - OpenGL style functions (common to 1.1, 3.3+, ES2)
    # NOTE: This functions are used to completely abstract raylib code from OpenGL layer,
    # some of them are direct wrappers over OpenGL calls, some others are custom
    #------------------------------------------------------------------------------------

    # Vertex buffers state
    cdef bint rlEnableVertexArray(unsigned int vaoId)     # Enable vertex array (VAO, if supported)
    cdef void rlDisableVertexArray()                  # Disable vertex array (VAO, if supported)
    cdef void rlEnableVertexBuffer(unsigned int id)       # Enable vertex buffer (VBO)
    cdef void rlDisableVertexBuffer()                 # Disable vertex buffer (VBO)
    cdef void rlEnableVertexBufferElement(unsigned int id)# Enable vertex buffer element (VBO element)
    cdef void rlDisableVertexBufferElement()          # Disable vertex buffer element (VBO element)
    cdef void rlEnableVertexAttribute(unsigned int index) # Enable vertex attribute index
    cdef void rlDisableVertexAttribute(unsigned int index)# Disable vertex attribute index
    #if defined(GRAPHICS_API_OPENGL_11)
    cdef void rlEnableStatePointer(int vertexAttribType, void *buffer)    # Enable attribute state pointer
    cdef void rlDisableStatePointer(int vertexAttribType)                 # Disable attribute state pointer
    #endif

    # Textures state
    cdef void rlActiveTextureSlot(int slot)               # Select and active a texture slot
    cdef void rlEnableTexture(unsigned int id)            # Enable texture
    cdef void rlDisableTexture()                      # Disable texture
    cdef void rlEnableTextureCubemap(unsigned int id)     # Enable texture cubemap
    cdef void rlDisableTextureCubemap()               # Disable texture cubemap
    cdef void rlTextureParameters(unsigned int id, int param, int value) # Set texture parameters (filter, wrap)
    cdef void rlCubemapParameters(unsigned int id, int param, int value) # Set cubemap parameters (filter, wrap)

    # Shader state
    cdef void rlEnableShader(unsigned int id)             # Enable shader program
    cdef void rlDisableShader()                       # Disable shader program

    # Framebuffer state
    cdef void rlEnableFramebuffer(unsigned int id)        # Enable render texture (fbo)
    cdef void rlDisableFramebuffer()                  # Disable render texture (fbo), return to default framebuffer
    cdef void rlActiveDrawBuffers(int count)              # Activate multiple draw color buffers
    cdef void rlBlitFramebuffer(int srcX, int srcY, int srcWidth, int srcHeight, int dstX, int dstY, int dstWidth, int dstHeight, int bufferMask) # Blit active framebuffer to main framebuffer

    # General render state
    cdef void rlEnableColorBlend()                     # Enable color blending
    cdef void rlDisableColorBlend()                   # Disable color blending
    cdef void rlEnableDepthTest()                     # Enable depth test
    cdef void rlDisableDepthTest()                    # Disable depth test
    cdef void rlEnableDepthMask()                     # Enable depth write
    cdef void rlDisableDepthMask()                    # Disable depth write
    cdef void rlEnableBackfaceCulling()               # Enable backface culling
    cdef void rlDisableBackfaceCulling()              # Disable backface culling
    cdef void rlSetCullFace(int mode)                     # Set face culling mode
    cdef void rlEnableScissorTest()                   # Enable scissor test
    cdef void rlDisableScissorTest()                  # Disable scissor test
    cdef void rlScissor(int x, int y, int width, int height) # Scissor test
    cdef void rlEnableWireMode()                      # Enable wire mode
    cdef void rlEnablePointMode()                     #  Enable point mode
    cdef void rlDisableWireMode()                     # Disable wire mode ( and point ) maybe rename
    cdef void rlSetLineWidth(float width)                 # Set the line drawing width
    cdef float rlGetLineWidth()                       # Get the line drawing width
    cdef void rlEnableSmoothLines()                   # Enable line aliasing
    cdef void rlDisableSmoothLines()                  # Disable line aliasing
    cdef void rlEnableStereoRender()                  # Enable stereo rendering
    cdef void rlDisableStereoRender()                 # Disable stereo rendering
    cdef bint rlIsStereoRenderEnabled()               # Check if stereo render is enabled

    cdef void rlClearColor(unsigned char r, unsigned char g, unsigned char b, unsigned char a) # Clear color buffer with color
    cdef void rlClearScreenBuffers()                  # Clear used screen buffers (color and depth)
    cdef void rlCheckErrors()                         # Check and log OpenGL error codes
    cdef void rlSetBlendMode(int mode)                    # Set blending mode
    cdef void rlSetBlendFactors(int glSrcFactor, int glDstFactor, int glEquation) # Set blending mode factor and equation (using OpenGL factors)
    cdef void rlSetBlendFactorsSeparate(int glSrcRGB, int glDstRGB, int glSrcAlpha, int glDstAlpha, int glEqRGB, int glEqAlpha) # Set blending mode factors and equations separately (using OpenGL factors)

    #------------------------------------------------------------------------------------
    # Functions Declaration - rlgl functionality
    #------------------------------------------------------------------------------------
    # rlgl initialization functions
    cdef void rlglInit(int width, int height)             # Initialize rlgl (buffers, shaders, textures, states)
    cdef void rlglClose()                             # De-initialize rlgl (buffers, shaders, textures)
    cdef void rlLoadExtensions(void *loader)              # Load OpenGL extensions (loader function required)
    cdef int rlGetVersion()                           # Get current OpenGL version
    cdef void rlSetFramebufferWidth(int width)            # Set current framebuffer width
    cdef int rlGetFramebufferWidth()                  # Get default framebuffer width
    cdef void rlSetFramebufferHeight(int height)          # Set current framebuffer height
    cdef int rlGetFramebufferHeight()                 # Get default framebuffer height

    cdef unsigned int rlGetTextureIdDefault()         # Get default texture id
    cdef unsigned int rlGetShaderIdDefault()          # Get default shader id
    cdef int *rlGetShaderLocsDefault()                # Get default shader locations

    # Render batch management
    # NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode
    # but this render batch API is exposed in case of custom batches are required
    cdef rlRenderBatch rlLoadRenderBatch(int numBuffers, int bufferElements)  # Load a render batch system
    cdef void rlUnloadRenderBatch(rlRenderBatch batch)                        # Unload render batch system
    cdef void rlDrawRenderBatch(rlRenderBatch *batch)                         # Draw render batch data (Update->Draw->Reset)
    cdef void rlSetRenderBatchActive(rlRenderBatch *batch)                    # Set the active render batch for rlgl (NULL for default internal)
    cdef void rlDrawRenderBatchActive()                                   # Update and draw internal render batch
    cdef bint rlCheckRenderBatchLimit(int vCount)                             # Check internal buffer overflow for a given number of vertex

    cdef void rlSetTexture(unsigned int id)               # Set current texture for render batch and check buffers limits

    #------------------------------------------------------------------------------------------------------------------------

    # Vertex buffers management
    cdef unsigned int rlLoadVertexArray()                               # Load vertex array (vao) if supported
    cdef unsigned int rlLoadVertexBuffer(const void *buffer, int size, bint dynamic)            # Load a vertex buffer attribute
    cdef unsigned int rlLoadVertexBufferElement(const void *buffer, int size, bint dynamic)     # Load a new attributes element buffer
    cdef void rlUpdateVertexBuffer(unsigned int bufferId, const void *data, int dataSize, int offset)     # Update GPU buffer with new data
    cdef void rlUpdateVertexBufferElements(unsigned int id, const void *data, int dataSize, int offset)   # Update vertex buffer elements with new data
    cdef void rlUnloadVertexArray(unsigned int vaoId)
    cdef void rlUnloadVertexBuffer(unsigned int vboId)
    cdef void rlSetVertexAttribute(unsigned int index, int compSize, int type, bint normalized, int stride, const void *pointer)
    cdef void rlSetVertexAttributeDivisor(unsigned int index, int divisor)
    cdef void rlSetVertexAttributeDefault(int locIndex, const void *value, int attribType, int count) # Set vertex attribute default value
    cdef void rlDrawVertexArray(int offset, int count)
    cdef void rlDrawVertexArrayElements(int offset, int count, const void *buffer)
    cdef void rlDrawVertexArrayInstanced(int offset, int count, int instances)
    cdef void rlDrawVertexArrayElementsInstanced(int offset, int count, const void *buffer, int instances)

    # Textures management
    cdef unsigned int rlLoadTexture(const void *data, int width, int height, int format, int mipmapCount) # Load texture in GPU
    cdef unsigned int rlLoadTextureDepth(int width, int height, bint useRenderBuffer)               # Load depth texture/renderbuffer (to be attached to fbo)
    cdef unsigned int rlLoadTextureCubemap(const void *data, int size, int format)                        # Load texture cubemap
    cdef void rlUpdateTexture(unsigned int id, int offsetX, int offsetY, int width, int height, int format, const void *data)  # Update GPU texture with new data
    cdef void rlGetGlTextureFormats(int format, unsigned int *glInternalFormat, unsigned int *glFormat, unsigned int *glType)  # Get OpenGL internal formats
    cdef const char *rlGetPixelFormatName(unsigned int format)              # Get name string for pixel format
    cdef void rlUnloadTexture(unsigned int id)                              # Unload texture from GPU memory
    cdef void rlGenTextureMipmaps(unsigned int id, int width, int height, int format, int *mipmaps) # Generate mipmap data for selected texture
    cdef void *rlReadTexturePixels(unsigned int id, int width, int height, int format)              # Read texture pixel data
    cdef unsigned char *rlReadScreenPixels(int width, int height)           # Read screen pixel data (color buffer)

    # Framebuffer management (fbo)
    cdef unsigned int rlLoadFramebuffer(int width, int height)              # Load an empty framebuffer
    cdef void rlFramebufferAttach(unsigned int fboId, unsigned int texId, int attachType, int texType, int mipLevel)  # Attach texture/renderbuffer to a framebuffer
    cdef bint rlFramebufferComplete(unsigned int id)                        # Verify framebuffer is complete
    cdef void rlUnloadFramebuffer(unsigned int id)                          # Delete framebuffer from GPU

    # Shaders management
    cdef unsigned int rlLoadShaderCode(const char *vsCode, const char *fsCode)    # Load shader from code strings
    cdef unsigned int rlCompileShader(const char *shaderCode, int type)           # Compile custom shader and return shader id (type: RL_VERTEX_SHADER, RL_FRAGMENT_SHADER, RL_COMPUTE_SHADER)
    cdef unsigned int rlLoadShaderProgram(unsigned int vShaderId, unsigned int fShaderId) # Load custom shader program
    cdef void rlUnloadShaderProgram(unsigned int id)                              # Unload shader program
    cdef int rlGetLocationUniform(unsigned int shaderId, const char *uniformName) # Get shader location uniform
    cdef int rlGetLocationAttrib(unsigned int shaderId, const char *attribName)   # Get shader location attribute
    cdef void rlSetUniform(int locIndex, const void *value, int uniformType, int count)   # Set shader value uniform
    cdef void rlSetUniformMatrix(int locIndex, Matrix mat)                        # Set shader value matrix
    cdef void rlSetUniformSampler(int locIndex, unsigned int textureId)           # Set shader value sampler
    cdef void rlSetShader(unsigned int id, int *locs)                             # Set shader currently active (id and locations)

    # Compute shader management
    cdef unsigned int rlLoadComputeShaderProgram(unsigned int shaderId)           # Load compute shader program
    cdef void rlComputeShaderDispatch(unsigned int groupX, unsigned int groupY, unsigned int groupZ)  # Dispatch compute shader (equivalent to *draw* for graphics pipeline)

    # Shader buffer storage object management (ssbo)
    cdef unsigned int rlLoadShaderBuffer(unsigned int size, const void *data, int usageHint) # Load shader storage buffer object (SSBO)
    cdef void rlUnloadShaderBuffer(unsigned int ssboId)                           # Unload shader storage buffer object (SSBO)
    cdef void rlUpdateShaderBuffer(unsigned int id, const void *data, unsigned int dataSize, unsigned int offset) # Update SSBO buffer data
    cdef void rlBindShaderBuffer(unsigned int id, unsigned int index)             # Bind SSBO buffer
    cdef void rlReadShaderBuffer(unsigned int id, void *dest, unsigned int count, unsigned int offset) # Read SSBO buffer data (GPU->CPU)
    cdef void rlCopyShaderBuffer(unsigned int destId, unsigned int srcId, unsigned int destOffset, unsigned int srcOffset, unsigned int count) # Copy SSBO data between buffers
    cdef unsigned int rlGetShaderBufferSize(unsigned int id)                      # Get SSBO buffer size

    # Buffer management
    cdef void rlBindImageTexture(unsigned int id, unsigned int index, int format, bint readonly)  # Bind image texture

    # Matrix state management
    cdef Matrix rlGetMatrixModelview()                                  # Get internal modelview matrix
    cdef Matrix rlGetMatrixProjection()                                 # Get internal projection matrix
    cdef Matrix rlGetMatrixTransform()                                  # Get internal accumulated transform matrix
    cdef Matrix rlGetMatrixProjectionStereo(int eye)                        # Get internal projection matrix for stereo render (selected eye)
    cdef Matrix rlGetMatrixViewOffsetStereo(int eye)                        # Get internal view offset matrix for stereo render (selected eye)
    cdef void rlSetMatrixProjection(Matrix proj)                            # Set a custom projection matrix (replaces internal projection matrix)
    cdef void rlSetMatrixModelview(Matrix view)                             # Set a custom modelview matrix (replaces internal modelview matrix)
    cdef void rlSetMatrixProjectionStereo(Matrix right, Matrix left)        # Set eyes projection matrices for stereo rendering
    cdef void rlSetMatrixViewOffsetStereo(Matrix right, Matrix left)        # Set eyes view offsets matrices for stereo rendering

    # Quick and dirty cube/quad buffers load->draw->unload
    cdef void rlLoadDrawCube()     # Load and draw a cube
    cdef void rlLoadDrawQuad()     # Load and draw a quad
