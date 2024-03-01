from libc.stdlib cimport malloc, free
from libc.string cimport memcpy
from cpython.bytes cimport PyBytes_AsString


#
#    # Vector2, 2 components
#    ctypedef struct Vector2:
#        float x                 # Vector x component
#        float y                 # Vector y component


cdef class CyVector2:
    cdef Vector2 _vector

    def __cinit__(self, float x = 0.0, float y = 0.0):
        self._vector.x = x
        self._vector.y = y

#    # Vector3, 3 components
#    ctypedef struct Vector3:
#        float x                 # Vector x component
#        float y                 # Vector y component
#        float z                 # Vector z component

cdef class CyVector3:
    cdef Vector3 _vector

    def __cinit__(self, float x = 0.0, float y = 0.0, float z = 0.0):
        self._vector.x = x
        self._vector.y = y
        self._vector.z = z

#    # Quaternion, 4 components (Vector4 alias)
#    ctypedef Vector4 Quaternion


cdef class CyQuaternion:
    cdef Vector4 _vector

    def __cinit__(self, float x = 0.0, float y = 0.0, float z = 0.0, float w = 0.0):
        self._vector.x = 0.0
        self._vector.y = 0.0
        self._vector.z = 0.0
        self._vector.w = 0.0

#    # Vector4, 4 components
#    ctypedef struct Vector4:
#        float x                 # Vector x component
#        float y                 # Vector y component
#        float z                 # Vector z component
#        float w                 # Vector w component
#

cdef class CyVector4(CyQuaternion):
    pass

#    # Matrix, 4x4 components, column major, OpenGL style, right-handed
#    ctypedef struct Matrix:
#        float m0, m4, m8, m12   # Matrix first row (4 components)
#        float m1, m5, m9, m13   # Matrix second row (4 components)
#        float m2, m6, m10, m14  # Matrix third row (4 components)
#        float m3, m7, m11, m15  # Matrix fourth row (4 components)


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

#    # Color, 4 components, R8G8B8A8 (32bit)
#    ctypedef struct Color:
#        uint8_t r               # Color red value
#        uint8_t g               # Color green value
#        uint8_t b               # Color blue value
#        uint8_t a               # Color alpha value

cdef class CyColor:
    
    cdef Color _color

    def __cinit__(self, uint8_t r = 0, uint8_t g = 0, uint8_t b = 0, uint8_t a = 0):
        self._color.r = r
        self._color.g = g
        self._color.b = b
        self._color.a = a

    @staticmethod
    def lightgray() -> 'CyColor':
        return _LIGHTGRAY
    
    @staticmethod
    def gray() -> 'CyColor':
        return _GRAY
    
    @staticmethod
    def darkgray() -> 'CyColor':
        return _DARKGRAY
    
    @staticmethod
    def yellow() -> 'CyColor':
        return _YELLOW
    
    @staticmethod
    def gold() -> 'CyColor':
        return _GOLD
    
    @staticmethod
    def orange() -> 'CyColor':
        return _ORANGE
    
    @staticmethod
    def pink() -> 'CyColor':
        return _PINK
    
    @staticmethod
    def red() -> 'CyColor':
        return _RED
    
    @staticmethod
    def maroon() -> 'CyColor':
        return _MAROON
    
    @staticmethod
    def green() -> 'CyColor':
        return _GREEN
    
    @staticmethod
    def lime() -> 'CyColor':
        return _LIME

    @staticmethod
    def darkgreen() -> 'CyColor':
        return _DARKGREEN
    
    @staticmethod
    def skyblue() -> 'CyColor':
        return _SKYBLUE
    
    @staticmethod
    def blue() -> 'CyColor':
        return _BLUE
    
    @staticmethod
    def darkblue() -> 'CyColor':
        return _DARKBLUE
    
    @staticmethod
    def purple() -> 'CyColor':
        return _PURPLE
    
    @staticmethod
    def violet() -> 'CyColor':
        return _VIOLET
    
    @staticmethod
    def darkpurple() -> 'CyColor':
        return _DARKPURPLE
    
    @staticmethod
    def beige() -> 'CyColor':
        return _BEIGE

    @staticmethod
    def brown() -> 'CyColor':
        return _BROWN
    
    @staticmethod
    def darkbrown() -> 'CyColor':
        return _DARKBROWN
    
    @staticmethod
    def white() -> 'CyColor':
        return _WHITE
    
    @staticmethod
    def black() -> 'CyColor':
        return _BLACK
    
    @staticmethod
    def blank() -> 'CyColor':
        return _BLANK
    
    @staticmethod
    def magenta() -> 'CyColor':
        return _MAGENTA
    
    @staticmethod
    def raywhite() -> 'CyColor':
        return _RAYWHITE
    
    
    ## Color/pixel related functions
    #cdef Color Fade(Color color, float alpha)                                 # Get color with alpha applied, alpha goes from 0.0f to 1.0f
    #cdef int ColorToInt(Color color)                                          # Get hexadecimal value for a Color
    #cdef Vector4 ColorNormalize(Color color)                                  # Get Color normalized as float [0..1]
    #cdef Color ColorFromNormalized(Vector4 normalized)                        # Get Color from normalized values [0..1]
    #cdef Vector3 ColorToHSV(Color color)                                      # Get HSV values for a Color, hue [0..360], saturation/value [0..1]
    #cdef Color ColorFromHSV(float hue, float saturation, float value)         # Get a Color from HSV values, hue [0..360], saturation/value [0..1]
    #cdef Color ColorTint(Color color, Color tint)                             # Get color multiplied with another color
    #cdef Color ColorBrightness(Color color, float factor)                     # Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
    #cdef Color ColorContrast(Color color, float contrast)                     # Get color with contrast correction, contrast values between -1.0f and 1.0f
    #cdef Color ColorAlpha(Color color, float alpha)                           # Get color with alpha applied, alpha goes from 0.0f to 1.0f
    #cdef Color ColorAlphaBlend(Color dst, Color src, Color tint)              # Get src alpha-blended into dst color with tint
    #cdef Color GetColor(unsigned int hexValue)                                # Get Color structure from hexadecimal value
    #cdef Color GetPixelColor(void *srcPtr, int format)                        # Get Color from a source pixel pointer of certain format
    #cdef void SetPixelColor(void *dstPtr, Color color, int format)            # Set color formatted into destination pixel pointer
    #cdef int GetPixelDataSize(int width, int height, int format)              # Get pixel data size in bytes for certain format
#

cdef CyColor _LIGHTGRAY = CyColor(200, 200, 200, 255)
cdef CyColor _GRAY      = CyColor(130, 130, 130, 255)
cdef CyColor _DARKGRAY  = CyColor(80, 80, 80, 255   )
cdef CyColor _YELLOW    = CyColor(253, 249, 0, 255  )
cdef CyColor _GOLD      = CyColor(255, 203, 0, 255  )
cdef CyColor _ORANGE    = CyColor(255, 161, 0, 255  )
cdef CyColor _PINK      = CyColor(255, 109, 194, 255)
cdef CyColor _RED       = CyColor(230, 41, 55, 255  )
cdef CyColor _MAROON    = CyColor(190, 33, 55, 255  )
cdef CyColor _GREEN     = CyColor(0, 228, 48, 255   )
cdef CyColor _LIME      = CyColor(0, 158, 47, 255   )
cdef CyColor _DARKGREEN = CyColor(0, 117, 44, 255   )
cdef CyColor _SKYBLUE   = CyColor(102, 191, 255, 255)
cdef CyColor _BLUE      = CyColor(0, 121, 241, 255  )
cdef CyColor _DARKBLUE  = CyColor(0, 82, 172, 255   )
cdef CyColor _PURPLE    = CyColor(200, 122, 255, 255)
cdef CyColor _VIOLET    = CyColor(135, 60, 190, 255 )
cdef CyColor _DARKPURPLE= CyColor(112, 31, 126, 255 )
cdef CyColor _BEIGE     = CyColor(211, 176, 131, 255)
cdef CyColor _BROWN     = CyColor(127, 106, 79, 255 )
cdef CyColor _DARKBROWN = CyColor(76, 63, 47, 255   )
cdef CyColor _WHITE     = CyColor(255, 255, 255, 255)
cdef CyColor _BLACK     = CyColor(0, 0, 0, 255      )
cdef CyColor _BLANK     = CyColor(0, 0, 0, 0        )
cdef CyColor _MAGENTA   = CyColor(255, 0, 255, 255  )
cdef CyColor _RAYWHITE  = CyColor(245, 245, 245, 255)


#    # Rectangle, 4 components
#    ctypedef struct Rectangle:
#        float x                 # Rectangle top-left corner position x
#        float y                 # Rectangle top-left corner position y
#        float width             # Rectangle width
#        float height            # Rectangle height

cdef class CyRectangle:
    cdef Rectangle _rect

    def __cinit__(self, float x = 0.0, float y = 0.0, float width = 0.0, float height = 0.0):
        self._rect.x = x
        self._rect.y = y
        self._rect.height = height
        self._rect.width = width
    
    @property
    def x(self) -> float:
        return self._rect.x

    @x.setter
    def x(self, value: float) -> None:
        self._rect.x = <float>value

    @property
    def y(self) -> float:
        return self._rect.y 
          
    @y.setter
    def y(self, value: float) -> None:
        self._rect.y = <float>value
    
    @property
    def height(self) -> float:
        return self._rect.height 
          
    @height.setter
    def height(self, value: float) -> None:
        self._rect.height = <float>value
    
    @property
    def width(self) -> float:
        return self._rect.y 
          
    @width.setter
    def width(self, value: float) -> None:
        self._rect.width = <float>value
    

    
#    # Image, pixel data stored in CPU memory (RAM)
#    ctypedef struct Image:
#        void *data              # Image raw data
#        int width               # Image base width
#        int height              # Image base height
#        int mipmaps             # Mipmap levels, 1 by default
#        int format              # Data format (PixelFormat type)

# Define your Cython class
cdef class CyImage:
    cdef Image _image

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
    
    ## Image loading functions
    ## NOTE: These functions do not require GPU access
    #cdef Image LoadImage(const char *fileName)                                                             # Load image from file into CPU memory (RAM)
    #cdef Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize)       # Load image from RAW file data
    #cdef Image LoadImageSvg(const char *fileNameOrString, int width, int height)                           # Load image from SVG file data or string with specified size
    #cdef Image LoadImageAnim(const char *fileName, int *frames)                                            # Load image sequence from file (frames appended to image.data)
    #cdef Image LoadImageAnimFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int *frames) # Load image sequence from memory buffer
    #cdef Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize)      # Load image from memory buffer, fileType refers to extension: i.e. '.png'
    #cdef Image LoadImageFromTexture(Texture2D texture)                                                     # Load image from GPU texture data
    #cdef Image LoadImageFromScreen()                                                                   # Load image from screen buffer and (screenshot)
    #cdef bint IsImageReady(Image image)                                                                    # Check if an image is ready
    #cdef void UnloadImage(Image image)                                                                     # Unload image from CPU memory (RAM)
    #cdef bint ExportImage(Image image, const char *fileName)                                               # Export image data to file, returns true on success
    #cdef unsigned char *ExportImageToMemory(Image image, const char *fileType, int *fileSize)              # Export image to memory buffer
    #cdef bint ExportImageAsCode(Image image, const char *fileName)                                         # Export image as code file defining an array of bytes, returns true on success
#
    ## Image generation functions
    #cdef Image GenImageColor(int width, int height, Color color)                                           # Generate image: plain color
    #cdef Image GenImageGradientLinear(int width, int height, int direction, Color start, Color end)        # Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
    #cdef Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer)      # Generate image: radial gradient
    #cdef Image GenImageGradientSquare(int width, int height, float density, Color inner, Color outer)      # Generate image: square gradient
    #cdef Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2)    # Generate image: checked
    #cdef Image GenImageWhiteNoise(int width, int height, float factor)                                     # Generate image: white noise
    #cdef Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale)           # Generate image: perlin noise
    #cdef Image GenImageCellular(int width, int height, int tileSize)                                       # Generate image: cellular algorithm, bigger tileSize means bigger cells
    #cdef Image GenImageText(int width, int height, const char *text)                                       # Generate image: grayscale image from text data
#
    ## Image manipulation functions
    #cdef Image ImageCopy(Image image)                                                                      # Create an image duplicate (useful for transformations)
    #cdef Image ImageFromImage(Image image, Rectangle rec)                                                  # Create an image from another image piece
    #cdef Image ImageText(const char *text, int fontSize, Color color)                                      # Create an image from text (default font)
    #cdef Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint)         # Create an image from text (custom sprite font)
    #cdef void ImageFormat(Image *image, int newFormat)                                                     # Convert image data to desired format
    #cdef void ImageToPOT(Image *image, Color fill)                                                         # Convert image to POT (power-of-two)
    #cdef void ImageCrop(Image *image, Rectangle crop)                                                      # Crop an image to a defined rectangle
    #cdef void ImageAlphaCrop(Image *image, float threshold)                                                # Crop image depending on alpha value
    #cdef void ImageAlphaClear(Image *image, Color color, float threshold)                                  # Clear alpha channel to desired color
    #cdef void ImageAlphaMask(Image *image, Image alphaMask)                                                # Apply alpha mask to image
    #cdef void ImageAlphaPremultiply(Image *image)                                                          # Premultiply alpha channel
    #cdef void ImageBlurGaussian(Image *image, int blurSize)                                                # Apply Gaussian blur using a box blur approximation
    #cdef void ImageKernelConvolution(Image *image, float* kernel, int kernelSize)                         # Apply Custom Square image convolution kernel
    #cdef void ImageResize(Image *image, int newWidth, int newHeight)                                       # Resize image (Bicubic scaling algorithm)
    #cdef void ImageResizeNN(Image *image, int newWidth,int newHeight)                                      # Resize image (Nearest-Neighbor scaling algorithm)
    #cdef void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill)  # Resize canvas and fill with color
    #cdef void ImageMipmaps(Image *image)                                                                   # Compute all mipmap levels for a provided image
    #cdef void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp)                            # Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    #cdef void ImageFlipVertical(Image *image)                                                              # Flip image vertically
    #cdef void ImageFlipHorizontal(Image *image)                                                            # Flip image horizontally
    #cdef void ImageRotate(Image *image, int degrees)                                                       # Rotate image by input angle in degrees (-359 to 359)
    #cdef void ImageRotateCW(Image *image)                                                                  # Rotate image clockwise 90deg
    #cdef void ImageRotateCCW(Image *image)                                                                 # Rotate image counter-clockwise 90deg
    #cdef void ImageColorTint(Image *image, Color color)                                                    # Modify image color: tint
    #cdef void ImageColorInvert(Image *image)                                                               # Modify image color: invert
    #cdef void ImageColorGrayscale(Image *image)                                                            # Modify image color: grayscale
    #cdef void ImageColorContrast(Image *image, float contrast)                                             # Modify image color: contrast (-100 to 100)
    #cdef void ImageColorBrightness(Image *image, int brightness)                                           # Modify image color: brightness (-255 to 255)
    #cdef void ImageColorReplace(Image *image, Color color, Color replace)                                  # Modify image color: replace color
    #cdef Color *LoadImageColors(Image image)                                                               # Load color data from image as a Color array (RGBA - 32bit)
    #cdef Color *LoadImagePalette(Image image, int maxPaletteSize, int *colorCount)                         # Load colors palette from image as a Color array (RGBA - 32bit)
    #cdef void UnloadImageColors(Color *colors)                                                             # Unload color data loaded with LoadImageColors()
    #cdef void UnloadImagePalette(Color *colors)                                                            # Unload colors palette loaded with LoadImagePalette()
    #cdef Rectangle GetImageAlphaBorder(Image image, float threshold)                                       # Get image alpha border rectangle
    #cdef Color GetImageColor(Image image, int x, int y)                                                    # Get image pixel color at (x, y) position
#
    ## Image drawing functions
    ## NOTE: Image software-rendering functions (CPU)
    #cdef void ImageClearBackground(Image *dst, Color color)                                                # Clear image background with given color
    #cdef void ImageDrawPixel(Image *dst, int posX, int posY, Color color)                                  # Draw pixel within an image
    #cdef void ImageDrawPixelV(Image *dst, Vector2 position, Color color)                                   # Draw pixel within an image (Vector version)
    #cdef void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color) # Draw line within an image
    #cdef void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color)                          # Draw line within an image (Vector version)
    #cdef void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color)               # Draw a filled circle within an image
    #cdef void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color)                        # Draw a filled circle within an image (Vector version)
    #cdef void ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, Color color)          # Draw circle outline within an image
    #cdef void ImageDrawCircleLinesV(Image *dst, Vector2 center, int radius, Color color)                   # Draw circle outline within an image (Vector version)
    #cdef void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color)       # Draw rectangle within an image
    #cdef void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color)                 # Draw rectangle within an image (Vector version)
    #cdef void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color)                                # Draw rectangle within an image
    #cdef void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color)                   # Draw rectangle lines within an image
    #cdef void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint)             # Draw a source image within a destination image (tint applied to source)
    #cdef void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color)   # Draw text (using default font) within an image (destination)
    #cdef void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint) # Draw text (custom sprite font) within an image (destination)
#

#    # Texture, tex data stored in GPU memory (VRAM)
#    ctypedef struct Texture:
#        unsigned int id         # OpenGL texture id
#        int width               # Texture base width
#        int height              # Texture base height
#        int mipmaps             # Mipmap levels, 1 by default
#        int format              # Data format (PixelFormat type)

cdef class CyTexture:
    cdef Texture _texture

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    
    ## Texture loading functions
    ## NOTE: These functions require GPU access
    #cdef Texture2D LoadTexture(const char *fileName)                                                       # Load texture from file into GPU memory (VRAM)
    #cdef Texture2D LoadTextureFromImage(Image image)                                                       # Load texture from image data
    #cdef TextureCubemap LoadTextureCubemap(Image image, int layout)                                        # Load cubemap from image, multiple image cubemap layouts supported
    #cdef RenderTexture2D LoadRenderTexture(int width, int height)                                          # Load texture for rendering (framebuffer)
    #cdef bint IsTextureReady(Texture2D texture)                                                            # Check if a texture is ready
    #cdef void UnloadTexture(Texture2D texture)                                                             # Unload texture from GPU memory (VRAM)
    #cdef bint IsRenderTextureReady(RenderTexture2D target)                                                 # Check if a render texture is ready
    #cdef void UnloadRenderTexture(RenderTexture2D target)                                                  # Unload render texture from GPU memory (VRAM)
    #cdef void UpdateTexture(Texture2D texture, const void *pixels)                                         # Update GPU texture with new data
    #cdef void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels)                       # Update GPU texture rectangle with new data
#
    ## Texture configuration functions
    #cdef void GenTextureMipmaps(Texture2D *texture)                                                        # Generate GPU mipmaps for a texture
    #cdef void SetTextureFilter(Texture2D texture, int filter)                                              # Set texture scaling filter mode
    #cdef void SetTextureWrap(Texture2D texture, int wrap)                                                  # Set texture wrapping mode
#
    ## Texture drawing functions
    #cdef void DrawTexture(Texture2D texture, int posX, int posY, Color tint)                               # Draw a Texture2D
    #cdef void DrawTextureV(Texture2D texture, Vector2 position, Color tint)                                # Draw a Texture2D with position defined as Vector2
    #cdef void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint)  # Draw a Texture2D with extended parameters
    #cdef void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint)            # Draw a part of a texture defined by a rectangle
    #cdef void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint) # Draw a part of a texture defined by a rectangle with 'pro' parameters
    #cdef void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint) # Draws a texture (or part of it) that stretches or shrinks nicely
#

#    # Texture2D, same as Texture
#    ctypedef Texture Texture2D

cdef class CyTexture2D(CyTexture):
    pass

#    ctypedef Texture TextureCubemap

cdef class CyTextureCubemap(CyTexture):
    pass

#    # RenderTexture, fbo for texture rendering
#    ctypedef struct RenderTexture:
#        unsigned int id         # OpenGL framebuffer object id
#        Texture texture         # Color buffer attachment texture
#        Texture depth           # Depth buffer attachment texture

cdef class CyRenderTexture:
    cdef RenderTexture _render_texture

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        

#    # RenderTexture2D, same as RenderTexture
#    ctypedef RenderTexture RenderTexture2D
#

cdef class CyRenderTexture2D(CyRenderTexture):
    pass

#    # NPatchInfo, n-patch layout info
#    ctypedef struct NPatchInfo:
#        Rectangle source        # Texture source rectangle
#        int left                # Left border offset
#        int top                 # Top border offset
#        int right               # Right border offset
#        int bottom              # Bottom border offset
#        int layout              # Layout of the n-patch: 3x3, 1x3 or 3x1

cdef class CyNPatchInfo:
    cdef NPatchInfo _n_patch_info

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        

#    # GlyphInfo, font characters glyphs info
#    ctypedef struct GlyphInfo:
#        int value               # Character value (Unicode)
#        int offsetX             # Character offset X when drawing
#        int offsetY             # Character offset Y when drawing
#        int advanceX            # Character advance position X
#        Image image             # Character image data
#

cdef class CyGlyphInfo:
    cdef GlyphInfo _glyph_info

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        



cdef class CyFont:
    cdef Font _font
    #    # Font, font texture and GlyphInfo array data
    #    ctypedef struct Font:
    #        int baseSize            # Base size (default chars height)
    #        int glyphCount          # Number of glyph characters
    #        int glyphPadding        # Padding around the glyph characters
    #        Texture2D texture       # Texture atlas containing the glyphs
    #        Rectangle *recs         # Rectangles in texture for the glyphs
    #        GlyphInfo *glyphs       # Glyphs info data
    #
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    
    @staticmethod
    def load_font(self, str path) -> 'CyFont':
        raise NotImplementedError("Not Implemented Yet!")
        

    @staticmethod
    cdef CyFont c_load_font(self, str path):
        raise NotImplementedError("Not Implemented Yet!")
        
    ## Font loading/unloading functions
    #cdef Font GetFontDefault()                                                            # Get the default Font
    #cdef Font LoadFont(const char *fileName)                                                  # Load font from file into GPU memory (VRAM)
    #cdef Font LoadFontEx(const char *fileName, int fontSize, int *codepoints, int codepointCount)  # Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set
    #cdef Font LoadFontFromImage(Image image, Color key, int firstChar)                        # Load font from Image (XNA style)
    #cdef Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount) # Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
    #cdef bint IsFontReady(Font font)                                                          # Check if a font is ready
    #cdef GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount, int type) # Load font data for further use
    #cdef Image GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod) # Generate image font atlas using chars info
    #cdef void UnloadFontData(GlyphInfo *glyphs, int glyphCount)                               # Unload font chars info data (RAM)
    #cdef void UnloadFont(Font font)                                                           # Unload font from GPU memory (VRAM)
    #cdef bint ExportFontAsCode(Font font, const char *fileName)                               # Export font as code file, returns true on success
#

    ## Text font info functions
    #cdef void SetTextLineSpacing(int spacing)                                                 # Set vertical line spacing when drawing with line-breaks
    #cdef int MeasureText(const char *text, int fontSize)                                      # Measure string width for default font
    #cdef Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing)    # Measure string size for Font
    #cdef int GetGlyphIndex(Font font, int codepoint)                                          # Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
    #cdef GlyphInfo GetGlyphInfo(Font font, int codepoint)                                     # Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
    #cdef Rectangle GetGlyphAtlasRec(Font font, int codepoint)                                 # Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
#
    ## Text codepoints management functions (unicode characters)
    #cdef char *LoadUTF8(const int *codepoints, int length)                # Load UTF-8 text encoded from codepoints array
    #cdef void UnloadUTF8(char *text)                                      # Unload UTF-8 text encoded from codepoints array
    #cdef int *LoadCodepoints(const char *text, int *count)                # Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
    #cdef void UnloadCodepoints(int *codepoints)                           # Unload codepoints data from memory
    #cdef int GetCodepointCount(const char *text)                          # Get total number of codepoints in a UTF-8 encoded string
    #cdef int GetCodepoint(const char *text, int *codepointSize)           # Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
    #cdef int GetCodepointNext(const char *text, int *codepointSize)       # Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
    #cdef int GetCodepointPrevious(const char *text, int *codepointSize)   # Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
    #cdef const char *CodepointToUTF8(int codepoint, int *utf8Size)        # Encode one codepoint into UTF-8 byte array (array length returned as parameter)
#

    ## Text strings management functions (no UTF-8 strings, only byte chars)
    ## NOTE: Some strings allocate memory internally for returned strings, just be careful!
    #cdef int TextCopy(char *dst, const char *src)                                             # Copy one string to another, returns bytes copied
    #cdef bint TextIsEqual(const char *text1, const char *text2)                               # Check if two text string are equal
    #cdef unsigned int TextLength(const char *text)                                            # Get text length, checks for '\0' ending
    #cdef const char *TextFormat(const char *text, ...)                                        # Text formatting with variables (sprintf() style)
    #cdef const char *TextSubtext(const char *text, int position, int length)                  # Get a piece of a text string
    #cdef char *TextReplace(const char *text, const char *replace, const char *by)             # Replace text string (WARNING: memory must be freed!)
    #cdef char *TextInsert(const char *text, const char *insert, int position)                 # Insert text in a position (WARNING: memory must be freed!)
    #cdef const char *TextJoin(const char **textList, int count, const char *delimiter)        # Join text strings with delimiter
    #cdef const char **TextSplit(const char *text, char delimiter, int *count)                 # Split text into multiple strings
    #cdef void TextAppend(char *text, const char *append, int *position)                       # Append text at specific position and move cursor!
    #cdef int TextFindIndex(const char *text, const char *find)                                # Find first text occurrence within a string
    #cdef const char *TextToUpper(const char *text)                      # Get upper case version of provided string
    #cdef const char *TextToLower(const char *text)                      # Get lower case version of provided string
    #cdef const char *TextToPascal(const char *text)                     # Get Pascal case notation version of provided string
    #cdef int TextToInteger(const char *text)                            # Get integer value from text (negative values not supported)
    #cdef float TextToFloat(const char *text)                            # Get float value from text (negative values not supported)
#


cdef class CyCamera3D:
    
    #    # Camera, defines position/orientation in 3d space
    #    ctypedef struct Camera3D:
    #        Vector3 position        # Camera position
    #        Vector3 target          # Camera target it looks-at
    #        Vector3 up              # Camera up vector (rotation over its axis)
    #        float fovy              # Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
    #        int projection          # Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    #
    #    ctypedef Camera3D Camera    # Camera type fallback, defaults to Camera3D

    cdef Camera3D _camera_3d

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        

#    # Camera2D, defines position/orientation in 2d space
#    ctypedef struct Camera2D:
#        Vector2 offset          # Camera offset (displacement from target)
#        Vector2 target          # Camera target (rotation and zoom origin)
#        float rotation          # Camera rotation in degrees
#        float zoom              # Camera zoom (scaling), should be 1.0f by default
#

cdef class CyCamera2D:
    cdef Camera2D _camera_2d

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        

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

cdef class CyMesh:
    cdef Mesh _mesh

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    ## Mesh management functions
    #cdef void UploadMesh(Mesh *mesh, bint dynamic)                                            # Upload mesh vertex data in GPU and provide VAO/VBO ids
    #cdef void UpdateMeshBuffer(Mesh mesh, int index, const void *data, int dataSize, int offset) # Update mesh vertex data in GPU for a specific buffer index
    #cdef void UnloadMesh(Mesh mesh)                                                           # Unload mesh data from CPU and GPU
    #cdef void DrawMesh(Mesh mesh, Material material, Matrix transform)                        # Draw a 3d mesh with material and transform
    #cdef void DrawMeshInstanced(Mesh mesh, Material material, const Matrix *transforms, int instances) # Draw multiple mesh instances with material and different transforms
    #cdef BoundingBox GetMeshBoundingBox(Mesh mesh)                                            # Compute mesh bounding box limits
    #cdef void GenMeshTangents(Mesh *mesh)                                                     # Compute mesh tangents
    #cdef bint ExportMesh(Mesh mesh, const char *fileName)                                     # Export mesh data to file, returns true on success
    #cdef bint ExportMeshAsCode(Mesh mesh, const char *fileName)                               # Export mesh as code file (.h) defining multiple arrays of vertex attributes
#
    ## Mesh generation functions
    #cdef Mesh GenMeshPoly(int sides, float radius)                                            # Generate polygonal mesh
    #cdef Mesh GenMeshPlane(float width, float length, int resX, int resZ)                     # Generate plane mesh (with subdivisions)
    #cdef Mesh GenMeshCube(float width, float height, float length)                            # Generate cuboid mesh
    #cdef Mesh GenMeshSphere(float radius, int rings, int slices)                              # Generate sphere mesh (standard sphere)
    #cdef Mesh GenMeshHemiSphere(float radius, int rings, int slices)                          # Generate half-sphere mesh (no bottom cap)
    #cdef Mesh GenMeshCylinder(float radius, float height, int slices)                         # Generate cylinder mesh
    #cdef Mesh GenMeshCone(float radius, float height, int slices)                             # Generate cone/pyramid mesh
    #cdef Mesh GenMeshTorus(float radius, float size, int radSeg, int sides)                   # Generate torus mesh
    #cdef Mesh GenMeshKnot(float radius, float size, int radSeg, int sides)                    # Generate trefoil knot mesh
    #cdef Mesh GenMeshHeightmap(Image heightmap, Vector3 size)                                 # Generate heightmap mesh from image data
    #cdef Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize)                               # Generate cubes-based map mesh from image data
#

#    # Shader
#    ctypedef struct Shader:
#        unsigned int id         # Shader program id
#        int *locs               # Shader locations array (RL_MAX_SHADER_LOCATIONS)

cdef class CyShader:
    cdef Shader _shader

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    #cdef Shader LoadShader(const char *vsFileName, const char *fsFileName)     
    #cdef Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode) 
    #cdef bint IsShaderReady(Shader shader)                                   
    #cdef int GetShaderLocation(Shader shader, const char *uniformName)       
    #cdef int GetShaderLocationAttrib(Shader shader, const char *attribName)  
    #cdef void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType)               
    #cdef void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count)   
    #cdef void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat)         
    #cdef void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture) 
    #cdef void UnloadShader(Shader shader)     



#    # MaterialMap
#    ctypedef struct MaterialMap:
#        Texture2D texture       # Material map texture
#        Color color             # Material map color
#        float value             # Material map value

cdef class CyMaterialMap:
    cdef MaterialMap _material_map

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    
 


cdef class CyMaterial:
    cdef Material _material
    #    # Material, includes shader and maps
    #    ctypedef struct Material:
    #        Shader shader           # Material shader
    #        MaterialMap *maps       # Material maps array (MAX_MATERIAL_MAPS)
    #        float params[4]         # Material generic parameters (if required)

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
    ## Material loading/unloading functions
    #cdef Material *LoadMaterials(const char *fileName, int *materialCount)                    # Load materials from model file
    #cdef Material LoadMaterialDefault()                                                   # Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    #cdef bint IsMaterialReady(Material material)                                              # Check if a material is ready
    #cdef void UnloadMaterial(Material material)                                               # Unload material from GPU memory (VRAM)
    #cdef void SetMaterialTexture(Material *material, int mapType, Texture2D texture)          # Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
    #cdef void SetModelMeshMaterial(Model *model, int meshId, int materialId)                  # Set material for a mesh
#   


cdef class CyTransform:
    cdef Transform _transform

    #    # Transform, vertex transformation data
    #    ctypedef struct Transform:
    #        Vector3 translation     # Translation
    #        Quaternion rotation     # Rotation
    #        Vector3 scale           # Scale


    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        


cdef class CyBoneInfo:
    cdef BoneInfo _bone_info
    #    
    #    # Bone, skeletal animation bone
    #    ctypedef struct BoneInfo:
    #        char name[32]          # Bone name
    #        int parent             # Bone parent


    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        



cdef class CyModel:
    cdef Model _model
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
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    #
        ## Model management functions
        #cdef Model LoadModel(const char *fileName)                                                # Load model from files (meshes and materials)
        #cdef Model LoadModelFromMesh(Mesh mesh)                                                   # Load model from generated mesh (default material)
        #cdef bint IsModelReady(Model model)                                                       # Check if a model is ready
        #cdef void UnloadModel(Model model)                                                        # Unload model (including meshes) from memory (RAM and/or VRAM)
        #cdef BoundingBox GetModelBoundingBox(Model model)                                         # Compute model bounding box limits (considers all meshes)
    #


cdef class CyModelAnimation:
    cdef ModelAnimation _model_animation
    #    # ModelAnimation
    #    ctypedef struct ModelAnimation:
    #        int boneCount          # Number of bones
    #        int frameCount         # Number of animation frames
    #        BoneInfo *bones        # Bones information (skeleton)
    #        Transform **framePoses # Poses array by frame
    #        char name[32]          # Animation name

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    ## Model animations loading/unloading functions
    #cdef ModelAnimation *LoadModelAnimations(const char *fileName, int *animCount)            # Load model animations from file
    #cdef void UpdateModelAnimation(Model model, ModelAnimation anim, int frame)               # Update model animation pose
    #cdef void UnloadModelAnimation(ModelAnimation anim)                                       # Unload animation data
    #cdef void UnloadModelAnimations(ModelAnimation *animations, int animCount)                # Unload animation array data
    #cdef bint IsModelAnimationValid(Model model, ModelAnimation anim)                         # Check model animation skeleton match
#


cdef class CyRay:
    cdef Ray _ray
    #
    #    # Ray, ray for raycasting
    #    ctypedef struct Ray:
    #        Vector3 position       # Ray position (origin)
    #        Vector3 direction      # Ray direction
    #
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        


cdef class CyRayCollision:
    cdef RayCollision _ray_collision
    #        
    #    # RayCollision, ray hit information
    #    ctypedef struct RayCollision:
    #        bint hit               # Did the ray hit something?
    #        float distance         # Distance to the nearest hit
    #        Vector3 point          # Point of the nearest hit
    #        Vector3 normal         # Surface normal of hit
    #

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        




cdef class CyBoundingBox:
    cdef BoundingBox _bounding_box
    #
    #    # BoundingBox
    #    ctypedef struct BoundingBox:
    #        Vector3 min            # Minimum vertex box-corner
    #        Vector3 max            # Maximum vertex box-corner
    #
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        


cdef class CyWave:
    cdef Wave _wave
    #
    #    # Wave, audio wave data
    #    ctypedef struct Wave:
    #        unsigned int frameCount    # Total number of frames (considering channels)
    #        unsigned int sampleRate    # Frequency (samples per second)
    #        unsigned int sampleSize    # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    #        unsigned int channels      # Number of channels (1-mono, 2-stereo, raise NotImplementedError("Not Implemented Yet!")
            
    #        void *data                 # Buffer data pointer
    #    
    #
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    
    ## Wave/Sound loading/unloading functions
    #cdef Wave LoadWave(const char *fileName)                            # Load wave data from file
    #cdef Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize) # Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
    #cdef bint IsWaveReady(Wave wave)                                    # Checks if wave data is ready
    #cdef Sound LoadSound(const char *fileName)                          # Load sound from file
    #cdef Sound LoadSoundFromWave(Wave wave)                             # Load sound from wave data
    #cdef Sound LoadSoundAlias(Sound source)                             # Create a new sound that shares the same sample data as the source sound, does not own the sound data
    #cdef bint IsSoundReady(Sound sound)                                 # Checks if a sound is ready
    #cdef void UpdateSound(Sound sound, const void *data, int sampleCount) # Update sound buffer with new data
    #cdef void UnloadWave(Wave wave)                                     # Unload wave data
    #cdef void UnloadSound(Sound sound)                                  # Unload sound
    #cdef void UnloadSoundAlias(Sound alias)                             # Unload a sound alias (does not deallocate sample data)
    #cdef bint ExportWave(Wave wave, const char *fileName)               # Export wave data to file, returns true on success
    #cdef bint ExportWaveAsCode(Wave wave, const char *fileName)         # Export wave sample data to code (.h), returns true on success
#


cdef class CyAudioStream:
    cdef AudioStream _audio_stream
    #    # AudioStream, custom audio stream
    #    ctypedef struct AudioStream:
    #        rAudioBuffer *buffer       # Pointer to internal data used by the audio system
    #        rAudioProcessor *processor # Pointer to internal data processor, useful for audio effects
    #
    #        unsigned int sampleRate    # Frequency (samples per second)
    #        unsigned int sampleSize    # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    #        unsigned int channels      # Number of channels (1-mono, 2-stereo, ...)
    #    

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")

    ## AudioStream management functions
    #cdef AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels) # Load audio stream (to stream raw audio pcm data)
    #cdef bint IsAudioStreamReady(AudioStream stream)                    # Checks if an audio stream is ready
    #cdef void UnloadAudioStream(AudioStream stream)                     # Unload audio stream and free memory
    #cdef void UpdateAudioStream(AudioStream stream, const void *data, int frameCount) # Update audio stream buffers with data
    #cdef bint IsAudioStreamProcessed(AudioStream stream)                # Check if any audio stream buffers requires refill
    #cdef void PlayAudioStream(AudioStream stream)                       # Play audio stream
    #cdef void PauseAudioStream(AudioStream stream)                      # Pause audio stream
    #cdef void ResumeAudioStream(AudioStream stream)                     # Resume audio stream
    #cdef bint IsAudioStreamPlaying(AudioStream stream)                  # Check if audio stream is playing
    #cdef void StopAudioStream(AudioStream stream)                       # Stop audio stream
    #cdef void SetAudioStreamVolume(AudioStream stream, float volume)    # Set volume for audio stream (1.0 is max level)
    #cdef void SetAudioStreamPitch(AudioStream stream, float pitch)      # Set pitch for audio stream (1.0 is base level)
    #cdef void SetAudioStreamPan(AudioStream stream, float pan)          # Set pan for audio stream (0.5 is centered)
    #cdef void SetAudioStreamBufferSizeDefault(int size)                 # Default size for new audio streams
    #cdef void SetAudioStreamCallback(AudioStream stream, AudioCallback callback) # Audio thread callback to request new data
#
    
    #cdef void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor) # Attach audio stream processor to stream, receives the samples as <float>s
    #cdef void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor) # Detach audio stream processor from stream
#
    #cdef void AttachAudioMixedProcessor(AudioCallback processor) # Attach audio stream processor to the entire audio pipeline, receives the samples as <float>s
    #cdef void DetachAudioMixedProcessor(AudioCallback processor) # Detach audio stream processor from the entire audio pipeline
   



cdef class CySound:
    cdef Sound _sound
    #    # Sound
    #    ctypedef struct Sound:
    #        AudioStream stream         # Audio stream
    #        unsigned int frameCount    # Total number of frames (considering channels)
    #
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")

    ## Wave/Sound management functions
    #cdef void PlaySound(Sound sound)                                    # Play a sound
    #cdef void StopSound(Sound sound)                                    # Stop playing a sound
    #cdef void PauseSound(Sound sound)                                   # Pause a sound
    #cdef void ResumeSound(Sound sound)                                  # Resume a paused sound
    #cdef bint IsSoundPlaying(Sound sound)                               # Check if a sound is currently playing
    #cdef void SetSoundVolume(Sound sound, float volume)                 # Set volume for a sound (1.0 is max level)
    #cdef void SetSoundPitch(Sound sound, float pitch)                   # Set pitch for a sound (1.0 is base level)
    #cdef void SetSoundPan(Sound sound, float pan)                       # Set pan for a sound (0.5 is center)
    #cdef Wave WaveCopy(Wave wave)                                       # Copy a wave to a new wave
    #cdef void WaveCrop(Wave *wave, int initSample, int finalSample)     # Crop a wave to defined samples range
    #cdef void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels) # Convert wave data to desired format
    #cdef float *LoadWaveSamples(Wave wave)                              # Load samples data from wave as a 32bit float data array
    #cdef void UnloadWaveSamples(float *samples)                         # Unload samples data loaded with LoadWaveSamples()
#


cdef class CyMusic:
    cdef Music _music
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
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        
    ## Music management functions
    #cdef Music LoadMusicStream(const char *fileName)                    # Load music stream from file
    #cdef Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize) # Load music stream from data
    #cdef bint IsMusicReady(Music music)                                 # Checks if a music stream is ready
    #cdef void UnloadMusicStream(Music music)                            # Unload music stream
    #cdef void PlayMusicStream(Music music)                              # Start music playing
    #cdef bint IsMusicStreamPlaying(Music music)                         # Check if music is playing
    #cdef void UpdateMusicStream(Music music)                            # Updates buffers for music streaming
    #cdef void StopMusicStream(Music music)                              # Stop music playing
    #cdef void PauseMusicStream(Music music)                             # Pause music playing
    #cdef void ResumeMusicStream(Music music)                            # Resume playing paused music
    #cdef void SeekMusicStream(Music music, float position)              # Seek music to a position (in seconds)
    #cdef void SetMusicVolume(Music music, float volume)                 # Set volume for music (1.0 is max level)
    #cdef void SetMusicPitch(Music music, float pitch)                   # Set pitch for a music (1.0 is base level)
    #cdef void SetMusicPan(Music music, float pan)                       # Set pan for a music (0.5 is center)
    #cdef float GetMusicTimeLength(Music music)                          # Get music time length (in seconds)
    #cdef float GetMusicTimePlayed(Music music)                          # Get current music time played (in seconds)
#


cdef class CyVrDeviceInfo:
    cdef VrDeviceInfo _vr_device_info
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
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        

 
cdef class CyVrStereoConfig:
    cdef VrStereoConfig _vr_stereo_config
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
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
    
    @staticmethod
    def load_vr_stereo_config(CyVrDeviceInfo device) -> 'CyVrStereoConfig':
        cdef CyVrStereoConfig stereo_config = CyVrStereoConfig.__new__(CyVrStereoConfig)
        stereo_config._vr_stereo_config = LoadVrStereoConfig(device._vr_device_info)
        return stereo_config
    
    
    def unload_vr_stereo_config(self) -> None:
        UnloadVrStereoConfig(self._vr_stereo_config)
        del self
    


cdef class CyFilePathList:
    cdef FilePathList _file_path_list
    #    # File path list
    #    ctypedef struct FilePathList:
    #        unsigned int capacity          # Filepaths max entries
    #        unsigned int count             # Filepaths entries count
    #        char **paths                   # Filepaths entries
    #    
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        


cdef class CyAutomationEvent:
    cdef AutomationEvent _automation_event
    #    # Automation event
    #    ctypedef struct AutomationEvent:
    #        unsigned int frame             # Event frame
    #        unsigned int type              # Event type (AutomationEventType)
    #        int params[4]                  # Event parameters (if required)
    #    

    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        



cdef class CyAutomationEventList:
    cdef AutomationEventList _automation_event_list
    #    # Automation event list
    #    ctypedef struct AutomationEventList:
    #        unsigned int capacity          # Events max entries (MAX_AUTOMATION_EVENTS)
    #        unsigned int count             # Events entries count
    #        AutomationEvent *events        # Events entries
    #    
    def __cinit__(self):
        raise NotImplementedError("Not Implemented Yet!")
        


cdef class CyWindow:

    @staticmethod
    def init_window(width: int, height: int, title: str) -> None:
        InitWindow(width, height, str.encode(title))
    
    @staticmethod
    def close_window() -> None:
        CloseWindow()
    
    @staticmethod
    def window_should_close() -> bool:
        return WindowShouldClose()
    
    @staticmethod
    def is_window_ready() -> bool:
        return IsWindowReady() 
    
    @staticmethod
    def is_window_fullscreen() -> bool:
        return IsWindowFullscreen()
    
    @staticmethod
    def is_window_hidden() -> bool:
        return IsWindowHidden()    

    @staticmethod
    def is_window_minimized() -> bool:
        return IsWindowMinimized()

    @staticmethod
    def is_window_maximized() -> bool:
        return IsWindowMaximized()

    @staticmethod
    def is_window_focused() -> bool:
        return IsWindowFocused()

    @staticmethod
    def is_window_resized() -> bool:
        return IsWindowResized()
    
    @staticmethod
    def is_window_state(flag: int) -> bool:
        return IsWindowState(flag)

    @staticmethod
    def set_window_state(flags: int) -> None:
        SetWindowState(flags)

    @staticmethod
    def clear_window_state(flags: int) -> None:
        ClearWindowState(flags)

    @staticmethod
    def toggle_fullscreen() -> None:
        ToggleFullscreen()
    
    @staticmethod
    def toggle_borderless_window() -> None:
        ToggleBorderlessWindowed()
    
    @staticmethod
    def maximize_window() -> None:
        MaximizeWindow()

    @staticmethod
    def minimize_window() -> None:
        MinimizeWindow()

    @staticmethod
    def restore_window() -> None:
        RestoreWindow()

    @staticmethod
    def set_window_icon(image: CyImage) -> None:
        SetWindowIcon(image._image)

    @staticmethod
    def set_windows_icons(images: list[CyImage]) -> None:
        return
        #cdef int count = len(images)
        
        # Allocate memory for an array of Image objects
        #cdef Image* image_array = <Image*>malloc(count * sizeof(Image))
        #if not image_array:
        #    raise MemoryError("Failed to allocate memory for Image array")
       # 
        #try:
        #    # Populate the Image array with CyImage _image attributes
        #    for i in range(count):
        #        image_array[i] = <Image>images[i]._image
        #    
        #    # Call the C function with the Image array
        #    SetWindowIcons(image_array, count)
       # 
        #finally:
        #    # Free the allocated memory
        #    free(image_array)

    @staticmethod
    def set_window_title(title: str) -> None:
        SetWindowTitle(str.encode(title))
    
    @staticmethod
    def set_window_position(x: int, y: int) -> None:
        SetWindowPosition(x, y)
    
    @staticmethod
    def set_window_monitor(monitor: int) -> None:
        SetWindowMonitor(monitor)
    
    @staticmethod
    def set_window_min_size(width: int, height: int) -> None:
        SetWindowMinSize(width, height)
    
    @staticmethod
    def set_window_max_size(width: int, height: int) -> None:
        SetWindowMaxSize(width, height)
    
    @staticmethod
    def set_window_size(width: int, height: int) -> None:
        SetWindowSize(width, height)
    
    @staticmethod
    def set_window_opacity(opacity: float) -> None:
        SetWindowOpacity(<float>opacity)
    
    @staticmethod
    def set_window_focused() -> None:
        SetWindowFocused()

    @staticmethod
    def get_window_handle() -> int:
        return <long>GetWindowHandle()

    @staticmethod
    def get_screen_width() -> int:
        return GetScreenWidth()
    
    @staticmethod
    def get_screen_height() -> int:
        return GetScreenHeight()
    
    @staticmethod
    def get_render_width() -> int:
        return GetRenderWidth()
    
    @staticmethod
    def get_render_height() -> int:
        return GetRenderHeight()
    
    @staticmethod
    def get_monitor_count() -> int:
        return GetMonitorCount()

    @staticmethod
    def get_current_monitor() -> int:
        return GetCurrentMonitor()
    
    @staticmethod
    def get_monitor_position(int monitor) -> CyVector2:
        cdef CyVector2 _vec = CyVector2.__new__(CyVector2)
        _vec._vector = GetMonitorPosition(monitor)
        return _vec

    @staticmethod
    def get_monitor_width(int monitor) -> int:
        return GetMonitorWidth(monitor)
    
    @staticmethod
    def get_monitor_height(int monitor) -> int:
        return GetMonitorHeight(monitor)

    @staticmethod
    def get_monitor_physical_width(int monitor) -> int:
        return GetMonitorPhysicalWidth(monitor)
    
    @staticmethod
    def get_monitor_physical_height(int monitor) -> int:
        return GetMonitorPhysicalHeight(monitor)      

    @staticmethod
    def get_monitor_refresh_rate(int monitor) -> int:
        return GetMonitorRefreshRate(monitor)      

    @staticmethod
    def get_window_position() -> CyVector2:
        cdef CyVector2 _vec = CyVector2.__new__(CyVector2)
        _vec._vector = GetWindowPosition()
        return _vec  
    
    @staticmethod
    def get_window_scale_dpi() -> CyVector2:
        cdef CyVector2 _vec = CyVector2.__new__(CyVector2)
        _vec._vector = GetWindowScaleDPI()
        return _vec  

    @staticmethod
    def get_monitor_name(int monitor) -> bytes:
        return GetMonitorName(monitor)   

    @staticmethod
    def set_clipboard_text(str text) -> None:
        SetClipboardText(text)

    @staticmethod
    def get_clipboard_text() -> bytes:
        return GetClipboardText()

    @staticmethod
    def enable_event_waiting() -> None:
        EnableEventWaiting()

    @staticmethod
    def disable_event_waiting() -> None:
        DisableEventWaiting()

cdef class CyCursor:
    @staticmethod
    def show_cursor() -> None:
        ShowCursor()
    
    @staticmethod
    def hide_cursor() -> None:
        HideCursor()
    
    @staticmethod
    def is_cursor_hidden() -> bint:
        return IsCursorHidden()
    
    @staticmethod
    def enable_cursor() -> None:
        EnableCursor()
    
    @staticmethod
    def disable_cursor() -> None:
        DisableCursor()

    @staticmethod
    def is_cursor_on_screen() -> bint:
        return IsCursorOnScreen()                             

    @staticmethod
    def set_target_fps(int fps) -> None:
        SetTargetFPS(fps)
    
    @staticmethod
    def get_frame_time() -> float:
        return GetFrameTime()
    
    @staticmethod
    def get_time() -> float:
        return GetTime()
    
    @staticmethod
    def get_fps() -> int:
        return GetFPS()


cdef class CyMode:

    @staticmethod
    def clear_background(CyColor color) -> None:
        ClearBackground(color._color)
    
    @staticmethod
    def begin_drawing() -> None:
        BeginDrawing()
    
    @staticmethod
    def end_drawing() -> None:
        EndDrawing()

    @staticmethod
    def begin_mode_2D(CyCamera2D camera) -> None:
        BeginMode2D(camera._camera_2d)

    @staticmethod
    def end_mode_2d() -> None:
        EndMode2D()

    @staticmethod
    def begin_mode_3d(CyCamera3D camera) -> None:
        BeginMode3D(camera._camera_3d) 

    @staticmethod
    def end_mode_3d() -> None:
        EndMode3D()

    @staticmethod
    def begin_texture_mode(CyRenderTexture2D target) -> None:
        BeginTextureMode(target._render_texture) 
                                        
    @staticmethod
    def end_texture_mode() -> None:
        EndTextureMode()

    @staticmethod
    def begin_shader_mode(CyShader shader) -> None:
        BeginShaderMode(shader._shader)

    @staticmethod
    def end_shader_mode() -> None:
        EndShaderMode()

    @staticmethod
    def begin_blend_mode(int mode) -> None:
        BeginBlendMode(mode)

    @staticmethod
    def end_blend_mode() -> None:
        EndBlendMode()                            

    @staticmethod
    def begin_scissor_mode(int x, int y, int width, int height) -> None:
        BeginScissorMode(x, y, width, height)
    
    @staticmethod
    def end_scissor_mode() -> None:
        EndScissorMode()

    @staticmethod
    def begin_vr_stereo_mode(CyVrStereoConfig config) -> None:
        BeginVrStereoMode(config._vr_stereo_config)

    @staticmethod
    def end_vr_stereo_mode() -> None:
        EndVrStereoMode()

    
# NAMESPACES                               
cdef class World3D:
    ...
    
    #cdef Ray GetMouseRay(Vector2 mousePosition, Camera camera)      
    #cdef Matrix GetCameraMatrix(Camera camera)                      
    #cdef Matrix GetCameraMatrix2D(Camera2D camera)                  
    #cdef Vector2 GetWorldToScreen(Vector3 position, Camera camera)  
    #cdef Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera) 
    #cdef Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height) 
    #cdef Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera) 


cdef class Screen:  
    ...                              
    #cdef void SwapScreenBuffer()                                
    #cdef void PollInputEvents()                                 
    #cdef void WaitTime(double seconds)                              
    #cdef void TakeScreenshot(const char *fileName)                  
    #cdef void SetConfigFlags(unsigned int flags) 

cdef class Random:
    ...
    #cdef void SetRandomSeed(unsigned int seed)                      
    #cdef int GetRandomValue(int min, int max)                       
    #cdef int *LoadRandomSequence(unsigned int count, int min, int max) 
    #cdef void UnloadRandomSequence(int *sequence)                   


                       
cdef class Log:
    ...
    #cdef void TraceLog(int logLevel, const char *text, ...)         
    #cdef void SetTraceLogLevel(int logLevel)

cdef class Memory:  
    ...                    
    #cdef void *MemAlloc(unsigned int size)                          
    #cdef void *MemRealloc(void *ptr, unsigned int size)             
    #cdef void MemFree(void *ptr)                                    

    

cdef class Callback:
    ...
    #cdef void SetTraceLogCallback(TraceLogCallback callback)         
    #cdef void SetLoadFileDataCallback(LoadFileDataCallback callback) 
    #cdef void SetSaveFileDataCallback(SaveFileDataCallback callback) 
    #cdef void SetLoadFileTextCallback(LoadFileTextCallback callback) 
    #cdef void SetSaveFileTextCallback(SaveFileTextCallback callback) 

cdef class OS: 
    ...
    #cdef unsigned char *LoadFileData(const char *fileName, int *dataSize) 
    #cdef void UnloadFileData(unsigned char *data)                   
    #cdef bint SaveFileData(const char *fileName, void *data, int dataSize) 
    #cdef bint ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName) 
    #cdef char *LoadFileText(const char *fileName)                   '\0' terminated string
    #cdef void UnloadFileText(char *text)                            
    #cdef bint SaveFileText(const char *fileName, char *text)        '\0' terminated, returns true on success
    #cdef void OpenURL(const char *url)   
    #cdef bint FileExists(const char *fileName)                      
    #cdef bint DirectoryExists(const char *dirPath)                  
    #cdef bint IsFileExtension(const char *fileName, const char *ext) 
    #cdef int GetFileLength(const char *fileName)                    
    #cdef const char *GetFileExtension(const char *fileName)         '.png')
    #cdef const char *GetFileName(const char *filePath)              
    #cdef const char *GetFileNameWithoutExt(const char *filePath)    
    #cdef const char *GetDirectoryPath(const char *filePath)         
    #cdef const char *GetPrevDirectoryPath(const char *dirPath)      
    #cdef const char *GetWorkingDirectory()                      
    #cdef const char *GetApplicationDirectory()                  
    #cdef bint ChangeDirectory(const char *dir)                      
    #cdef bint IsPathFile(const char *path)                          
    #cdef FilePathList LoadDirectoryFiles(const char *dirPath)       
    #cdef FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, bint scanSubdirs) 
    #cdef void UnloadDirectoryFiles(FilePathList files)              
    #cdef bint IsFileDropped()                                   
    #cdef FilePathList LoadDroppedFiles()                        
    #cdef void UnloadDroppedFiles(FilePathList files)                
    #cdef long GetFileModTime(const char *fileName)                  
    #cdef unsigned char *CompressData(const unsigned char *data, int dataSize, int *compDataSize)        
    #cdef unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize)  
    #cdef char *EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize)               
    #cdef unsigned char *DecodeDataBase64(const unsigned char *data, int *outputSize)                    

    
cdef class Event:
    ...
    #cdef AutomationEventList LoadAutomationEventList(const char *fileName)                = MAX_AUTOMATION_EVENTS
    #cdef void UnloadAutomationEventList(AutomationEventList list)                        
    #cdef bint ExportAutomationEventList(AutomationEventList list, const char *fileName)   
    #cdef void SetAutomationEventList(AutomationEventList *list)                           
    #cdef void SetAutomationEventBaseFrame(int frame)                                      
    #cdef void StartAutomationEventRecording()                                         
    #cdef void StopAutomationEventRecording()                                          
    #cdef void PlayAutomationEvent(AutomationEvent event)                                  

    
    #------------------------------------------------------------------------------------
    # Input Handling Functions (Module: core)
    #------------------------------------------------------------------------------------

cdef class Input:
    ...
    # Input-related functions: keyboard
    #cdef bint IsKeyPressed(int key)                             # Check if a key has been pressed once
    #cdef bint IsKeyPressedRepeat(int key)                       # Check if a key has been pressed again (Only PLATFORM_DESKTOP)
    #cdef bint IsKeyDown(int key)                                # Check if a key is being pressed
    #cdef bint IsKeyReleased(int key)                            # Check if a key has been released once
    #cdef bint IsKeyUp(int key)                                  # Check if a key is NOT being pressed
    #cdef int GetKeyPressed()                                # Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
    #cdef int GetCharPressed()                               # Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
    #cdef void SetExitKey(int key)                               # Set a custom key to exit program (default is ESC)
#
    ## Input-related functions: gamepads
    #cdef bint IsGamepadAvailable(int gamepad)                   # Check if a gamepad is available
    #cdef const char *GetGamepadName(int gamepad)                # Get gamepad internal name id
    #cdef bint IsGamepadButtonPressed(int gamepad, int button)   # Check if a gamepad button has been pressed once
    #cdef bint IsGamepadButtonDown(int gamepad, int button)      # Check if a gamepad button is being pressed
    #cdef bint IsGamepadButtonReleased(int gamepad, int button)  # Check if a gamepad button has been released once
    #cdef bint IsGamepadButtonUp(int gamepad, int button)        # Check if a gamepad button is NOT being pressed
    #cdef int GetGamepadButtonPressed()                      # Get the last gamepad button pressed
    #cdef int GetGamepadAxisCount(int gamepad)                   # Get gamepad axis count for a gamepad
    #cdef float GetGamepadAxisMovement(int gamepad, int axis)    # Get axis movement value for a gamepad axis
    #cdef int SetGamepadMappings(const char *mappings)           # Set internal gamepad mappings (SDL_GameControllerDB)
#
    ## Input-related functions: mouse
    #cdef bint IsMouseButtonPressed(int button)                  # Check if a mouse button has been pressed once
    #cdef bint IsMouseButtonDown(int button)                     # Check if a mouse button is being pressed
    #cdef bint IsMouseButtonReleased(int button)                 # Check if a mouse button has been released once
    #cdef bint IsMouseButtonUp(int button)                       # Check if a mouse button is NOT being pressed
    #cdef int GetMouseX()                                    # Get mouse position X
    #cdef int GetMouseY()                                    # Get mouse position Y
    #cdef Vector2 GetMousePosition()                         # Get mouse position XY
    #cdef Vector2 GetMouseDelta()                            # Get mouse delta between frames
    #cdef void SetMousePosition(int x, int y)                    # Set mouse position XY
    #cdef void SetMouseOffset(int offsetX, int offsetY)          # Set mouse offset
    #cdef void SetMouseScale(float scaleX, float scaleY)         # Set mouse scaling
    #cdef float GetMouseWheelMove()                          # Get mouse wheel movement for X or Y, whichever is larger
    #cdef Vector2 GetMouseWheelMoveV()                       # Get mouse wheel movement for both X and Y
    #cdef void SetMouseCursor(int cursor)                        # Set mouse cursor
#
    ## Input-related functions: touch
    #cdef int GetTouchX()                                    # Get touch position X for touch point 0 (relative to screen size)
    #cdef int GetTouchY()                                    # Get touch position Y for touch point 0 (relative to screen size)
    #cdef Vector2 GetTouchPosition(int index)                    # Get touch position XY for a touch point index (relative to screen size)
    #cdef int GetTouchPointId(int index)                         # Get touch point identifier for given index
    #cdef int GetTouchPointCount()                           # Get number of touch points
#
    ##------------------------------------------------------------------------------------
    ## Gestures and Touch Handling Functions (Module: rgestures)
    ##------------------------------------------------------------------------------------
    #cdef void SetGesturesEnabled(unsigned int flags)      # Enable a set of gestures using flags
    #cdef bint IsGestureDetected(unsigned int gesture)     # Check if a gesture have been detected
    #cdef int GetGestureDetected()                     # Get latest detected gesture
    #cdef float GetGestureHoldDuration()               # Get gesture hold time in milliseconds
    #cdef Vector2 GetGestureDragVector()               # Get gesture drag vector
    #cdef float GetGestureDragAngle()                  # Get gesture drag angle
    #cdef Vector2 GetGesturePinchVector()              # Get gesture pinch delta
    #cdef float GetGesturePinchAngle()                 # Get gesture pinch angle
#
    ##------------------------------------------------------------------------------------
    ## Camera System Functions (Module: rcamera)
    ##------------------------------------------------------------------------------------
    #cdef void UpdateCamera(Camera *camera, int mode)      # Update camera position for selected mode
    #cdef void UpdateCameraPro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom) # Update camera movement/rotation
#
    ##------------------------------------------------------------------------------------
    ## Basic Shapes Drawing Functions (Module: shapes)
    ##------------------------------------------------------------------------------------
    ## Set texture and rectangle to be used on shapes drawing
    ## NOTE: It can be useful when using basic shapes and one single font,
    ## defining a font char white rectangle would allow drawing everything in a single draw call
    #cdef void SetShapesTexture(Texture2D texture, Rectangle source)       # Set texture and rectangle to be used on shapes drawing
    #cdef Texture2D GetShapesTexture()                                 # Get texture that is used for shapes drawing
    #cdef Rectangle GetShapesTextureRectangle()                        # Get texture source rectangle that is used for shapes drawing
#

cdef class Drawing:
    ...
    ## Basic shapes drawing functions
    #cdef void DrawPixel(int posX, int posY, Color color)                                                   # Draw a pixel
    #cdef void DrawPixelV(Vector2 position, Color color)                                                    # Draw a pixel (Vector version)
    #cdef void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color)                # Draw a line
    #cdef void DrawLineV(Vector2 startPos, Vector2 endPos, Color color)                                     # Draw a line (using gl lines)
    #cdef void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color)                       # Draw a line (using triangles/quads)
    #cdef void DrawLineStrip(Vector2 *points, int pointCount, Color color)                                  # Draw lines sequence (using gl lines)
    #cdef void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color)                   # Draw line segment cubic-bezier in-out interpolation
    #cdef void DrawCircle(int centerX, int centerY, float radius, Color color)                              # Draw a color-filled circle
    #cdef void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color)      # Draw a piece of a circle
    #cdef void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color) # Draw circle sector outline
    #cdef void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2)       # Draw a gradient-filled circle
    #cdef void DrawCircleV(Vector2 center, float radius, Color color)                                       # Draw a color-filled circle (Vector version)
    #cdef void DrawCircleLines(int centerX, int centerY, float radius, Color color)                         # Draw circle outline
    #cdef void DrawCircleLinesV(Vector2 center, float radius, Color color)                                  # Draw circle outline (Vector version)
    #cdef void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color)             # Draw ellipse
    #cdef void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color)        # Draw ellipse outline
    #cdef void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color) # Draw ring
    #cdef void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)    # Draw ring outline
    #cdef void DrawRectangle(int posX, int posY, int width, int height, Color color)                        # Draw a color-filled rectangle
    #cdef void DrawRectangleV(Vector2 position, Vector2 size, Color color)                                  # Draw a color-filled rectangle (Vector version)
    #cdef void DrawRectangleRec(Rectangle rec, Color color)                                                 # Draw a color-filled rectangle
    #cdef void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color)                 # Draw a color-filled rectangle with pro parameters
    #cdef void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2)# Draw a vertical-gradient-filled rectangle
    #cdef void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2)# Draw a horizontal-gradient-filled rectangle
    #cdef void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4)       # Draw a gradient-filled rectangle with custom vertex colors
    #cdef void DrawRectangleLines(int posX, int posY, int width, int height, Color color)                   # Draw rectangle outline
    #cdef void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color)                            # Draw rectangle outline with extended parameters
    #cdef void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color)              # Draw rectangle with rounded edges
    #cdef void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color) # Draw rectangle with rounded edges outline
    #cdef void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color)                                # Draw a color-filled triangle (vertex in counter-clockwise order!)
    #cdef void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color)                           # Draw triangle outline (vertex in counter-clockwise order!)
    #cdef void DrawTriangleFan(Vector2 *points, int pointCount, Color color)                                # Draw a triangle fan defined by points (first vertex is the center)
    #cdef void DrawTriangleStrip(Vector2 *points, int pointCount, Color color)                              # Draw a triangle strip defined by points
    #cdef void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color)               # Draw a regular polygon (Vector version)
    #cdef void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color)          # Draw a polygon outline of n sides
    #cdef void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color) # Draw a polygon outline of n sides with extended parameters
#
    ## Splines drawing functions
    #cdef void DrawSplineLinear(Vector2 *points, int pointCount, float thick, Color color)                  # Draw spline: Linear, minimum 2 points
    #cdef void DrawSplineBasis(Vector2 *points, int pointCount, float thick, Color color)                   # Draw spline: B-Spline, minimum 4 points
    #cdef void DrawSplineCatmullRom(Vector2 *points, int pointCount, float thick, Color color)              # Draw spline: Catmull-Rom, minimum 4 points
    #cdef void DrawSplineBezierQuadratic(Vector2 *points, int pointCount, float thick, Color color)         # Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
    #cdef void DrawSplineBezierCubic(Vector2 *points, int pointCount, float thick, Color color)             # Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
    #cdef void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color)                    # Draw spline segment: Linear, 2 points
    #cdef void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) # Draw spline segment: B-Spline, 4 points
    #cdef void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) # Draw spline segment: Catmull-Rom, 4 points
    #cdef void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color) # Draw spline segment: Quadratic Bezier, 2 points, 1 control point
    #cdef void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color) # Draw spline segment: Cubic Bezier, 2 points, 2 control points
#

    ## Text drawing functions
    #cdef void DrawFPS(int posX, int posY)                                                     # Draw current FPS
    #cdef void DrawText(const char *text, int posX, int posY, int fontSize, Color color)       # Draw text (using default font)
    #cdef void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint) # Draw text using font and additional parameters
    #cdef void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint) # Draw text using Font and pro parameters (rotation)
    #cdef void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint) # Draw one character (codepoint)
    #cdef void DrawTextCodepoints(Font font, const int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint) # Draw multiple character (codepoint)
#
#
    ## Basic geometric 3D shapes drawing functions
    #cdef void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color)                                    # Draw a line in 3D world space
    #cdef void DrawPoint3D(Vector3 position, Color color)                                                   # Draw a point in 3D space, actually a small line
    #cdef void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color) # Draw a circle in 3D world space
    #cdef void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color)                              # Draw a color-filled triangle (vertex in counter-clockwise order!)
    #cdef void DrawTriangleStrip3D(Vector3 *points, int pointCount, Color color)                            # Draw a triangle strip defined by points
    #cdef void DrawCube(Vector3 position, float width, float height, float length, Color color)             # Draw cube
    #cdef void DrawCubeV(Vector3 position, Vector3 size, Color color)                                       # Draw cube (Vector version)
    #cdef void DrawCubeWires(Vector3 position, float width, float height, float length, Color color)        # Draw cube wires
    #cdef void DrawCubeWiresV(Vector3 position, Vector3 size, Color color)                                  # Draw cube wires (Vector version)
    #cdef void DrawSphere(Vector3 centerPos, float radius, Color color)                                     # Draw sphere
    #cdef void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color)            # Draw sphere with extended parameters
    #cdef void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color)         # Draw sphere wires
    #cdef void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color) # Draw a cylinder/cone
    #cdef void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color) # Draw a cylinder with base at startPos and top at endPos
    #cdef void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color) # Draw a cylinder/cone wires
    #cdef void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color) # Draw a cylinder wires with base at startPos and top at endPos
    #cdef void DrawCapsule(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color) # Draw a capsule with the center of its sphere caps at startPos and endPos
    #cdef void DrawCapsuleWires(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color) # Draw capsule wireframe with the center of its sphere caps at startPos and endPos
    #cdef void DrawPlane(Vector3 centerPos, Vector2 size, Color color)                                      # Draw a plane XZ
    #cdef void DrawRay(Ray ray, Color color)                                                                # Draw a ray line
    #cdef void DrawGrid(int slices, float spacing)                                                          # Draw a grid (centered at (0, 0, 0))
#
      ## Model drawing functions
    #cdef void DrawModel(Model model, Vector3 position, float scale, Color tint)               # Draw a model (with texture if set)
    #cdef void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint) # Draw a model with extended parameters
    #cdef void DrawModelWires(Model model, Vector3 position, float scale, Color tint)          # Draw a model wires (with texture if set)
    #cdef void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint) # Draw a model wires (with texture if set) with extended parameters
    #cdef void DrawBoundingBox(BoundingBox box, Color color)                                   # Draw bounding box (wires)
    #cdef void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint)   # Draw a billboard texture
    #cdef void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint) # Draw a billboard texture defined by source
    #cdef void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint) # Draw a billboard texture defined by source and rotation
#

cdef class Geometry2D:
    ...
    ## Spline segment point evaluation functions, for a given t [0.0f .. 1.0f]
    #cdef Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t)                           # Get (evaluate) spline point: Linear
    #cdef Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t)              # Get (evaluate) spline point: B-Spline
    #cdef Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t)         # Get (evaluate) spline point: Catmull-Rom
    #cdef Vector2 GetSplinePointBezierQuad(Vector2 p1, Vector2 c2, Vector2 p3, float t)                     # Get (evaluate) spline point: Quadratic Bezier
    #cdef Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t)        # Get (evaluate) spline point: Cubic Bezier
#
    ## Basic shapes collision detection functions
    #cdef bint CheckCollisionRecs(Rectangle rec1, Rectangle rec2)                                           # Check collision between two rectangles
    #cdef bint CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2)        # Check collision between two circles
    #cdef bint CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec)                         # Check collision between circle and rectangle
    #cdef bint CheckCollisionPointRec(Vector2 point, Rectangle rec)                                         # Check if point is inside rectangle
    #cdef bint CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius)                       # Check if point is inside circle
    #cdef bint CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3)               # Check if point is inside a triangle
    #cdef bint CheckCollisionPointPoly(Vector2 point, Vector2 *points, int pointCount)                      # Check if point is within a polygon described by array of vertices
    #cdef bint CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint) # Check the collision between two lines defined by two points each, returns collision point by reference
    #cdef bint CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold)                # Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
    #cdef Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2)                                         # Get collision rectangle for two rectangles collision
#

cdef class Geometry3D:
    ...
## Collision detection functions
    #cdef bint CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2)   # Check collision between two spheres
    #cdef bint CheckCollisionBoxes(BoundingBox box1, BoundingBox box2)                                 # Check collision between two bounding boxes
    #cdef bint CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius)                  # Check collision between box and sphere
    #cdef RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius)                    # Get collision info between ray and sphere
    #cdef RayCollision GetRayCollisionBox(Ray ray, BoundingBox box)                                    # Get collision info between ray and box
    #cdef RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform)                       # Get collision info between ray and mesh
    #cdef RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3)            # Get collision info between ray and triangle
    #cdef RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)    # Get collision info between ray and quad
#

cdef class Audio:
    ...
#
    ## Audio device management functions
    #cdef void InitAudioDevice()                                     # Initialize audio device and context
    #cdef void CloseAudioDevice()                                    # Close the audio device and context
    #cdef bint IsAudioDeviceReady()                                  # Check if audio device has been initialized successfully
    #cdef void SetMasterVolume(float volume)                             # Set master volume (listener)
    #cdef float GetMasterVolume()                                    # Get master volume (listener)
#   
    
    
    ##------------------------------------------------------------------------------------
    ## Audio Loading and Playing Functions (Module: audio)
    ##------------------------------------------------------------------------------------
    #ctypedef void (*AudioCallback)(void *bufferData, unsigned int frames)

    
    