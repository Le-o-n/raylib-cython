
#
from raylib_cython import raylib
from raylib_cython import raymath
import numpy as np


def main():

    m: raymath.CyVector2

    text: str = "My cool text!"
    text_size: float = 100
    cy_text: raylib.CyText = raylib.CyText(
        text.encode(),
        text_size,
        raylib.CyColor.green(),
        spacing=10,
        origin=raymath.CyVector2(200, 100),
    )

    raylib.init_window(1000, 900, "Hello World")

    while not raylib.window_should_close():

        m = raylib.get_mouse_position()

        raylib.clear_background(raylib.CyColor.black())
        raylib.draw_fps(0, 0)
        raylib.begin_drawing()

        cy_text.pos = m
        cy_text.rotation = m.x
        cy_text.draw_pro()
        raylib.end_drawing()

    raylib.close_window()


if __name__ == "__main__":
    main()
