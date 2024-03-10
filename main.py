
#
from raylib_cython import raylib
from raylib_cython import raymath
import numpy as np


def main():

    pos: raymath.CyVector2 = raymath.CyVector2(0, 0)

    m: raymath.CyVector2

    text: str = "1"

    cy_text: raylib.CyText = raylib.CyText(text.encode(), pos, 20, raylib.CyColor.green())

    for i in range(50):
        print(i)
        text = text + "1"
        cy_text.update_text(text.encode())
        print(cy_text.get_text())

    raylib.init_window(1000, 900, "Hello World")

    while not raylib.window_should_close():

        m = raylib.get_mouse_position()

        raylib.clear_background(raylib.CyColor.black())

        raylib.begin_drawing()

        cy_text.update_text(f"Vec2<{m.x}, {m.y}>".encode())
        cy_text.draw()
        raylib.end_drawing()

    raylib.close_window()


if __name__ == "__main__":
    main()
