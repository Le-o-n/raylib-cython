
def main() -> int:
    ...


def InitWindow(width: int, height: int, title: str) -> None: ...    # Initialize window and OpenGL context
def CloseWindow() -> None: ...                                      # Close window and unload OpenGL context
def WindowShouldClose() -> bool: ...                                # Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
def IsWindowReady() -> bool: ...                                    # Check if window has been initialized successfully
def IsWindowFullscreen() -> bool: ...                               # Check if window is currently fullscreen
def IsWindowHidden() -> bool: ...                                   # Check if window is currently hidden (only PLATFORM_DESKTOP)
def IsWindowMinimized() -> bool: ...                                # Check if window is currently minimized (only PLATFORM_DESKTOP)
def IsWindowMaximized() -> bool: ...                                # Check if window is currently maximized (only PLATFORM_DESKTOP)


def BeginDrawing() -> None: ...                                     # Setup canvas (framebuffer) to start drawing
def EndDrawing() -> None: ...                                       # End canvas drawing and swap buffers (double buffering)
