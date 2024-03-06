
#
from raylib_cython import raylib
from raylib_cython import raymath
import numpy as np
        
    
def main():

    raylib.Window.init_window(1000, 900, "Hello World")
    
    while not raylib.Window.window_should_close():
        raylib.Drawing.clear_background(raylib.CyColor.black())
        
        raylib.Window.begin_drawing()
        
        m: raymath.CyVector2 = raylib.Input.get_mouse_position()
        
        raylib.Drawing.draw_line_ex(raymath.CyVector2(0,0),m, 3, raylib.CyColor.green())
        raylib.Window.end_drawing()

    raylib.Window.close_window()


if __name__ == "__main__":
    main()
