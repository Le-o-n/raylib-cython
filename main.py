
#
from raylib_cython import raylib
from raylib_cython import raymath
import numpy as np


def main():

    m: raymath.CyVector2

    l: raylib.CyLineStrip = raylib.CyLineStrip(
        np.array(
            [
                raymath.CyVector2(0, 0),
                raymath.CyVector2(100, 100),
                raymath.CyVector2(0, 0)
            ]
        ),
        raylib.CyColor.red()
    )

    line_strips: list[raylib.CyLineStrip] = []

    text: str = ""

    raylib.init_window(1000, 900, "Hello World")

    while not raylib.window_should_close():
        raylib.clear_background(raylib.CyColor.black())

        raylib.begin_drawing()
        raylib.draw_fps(0, 0)

        line_strips.append(l)

        text = f"{len(line_strips)}"

        m = raylib.get_mouse_position()
        raylib.CyText(text.encode(), m.add_value_inplace(100), 20, raylib.CyColor.green()).draw()

        for line_strip in line_strips:
            line_strip.set_point(-1, m)
            line_strip.draw()

        raylib.end_drawing()

    raylib.close_window()


if __name__ == "__main__":
    main()
