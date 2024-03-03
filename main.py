
from raylib_cython import raylib
from raylib_cython import raymath
import numpy as np


def main():

    
    
    
    
    
    raylib.Window.init_window(1000, 500, "Hello World")

    while not raylib.Window.window_should_close():
        raylib.Drawing.clear_background(raylib.CyColor.black())
        
        raylib.Mode.begin_drawing()
        m: raymath.CyVector2 =raylib.Input.get_mouse_position()
        p1 = raylib.CyVector2(0, 0)
        p2 = raylib.CyVector2(500, 100)
        p3 = raylib.Input.get_mouse_position()
        
        points = [p1, p2, p3]
        
        p_list = np.ascontiguousarray(points)
        raylib.Drawing.draw_line_strip(p_list, raylib.CyColor.green())
        
        raylib.Mode.end_drawing()

    raylib.Window.close_window()


if __name__ == "__main__":
    main()
