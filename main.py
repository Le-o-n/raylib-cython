
#
from raylib_cython import raylib
from raylib_cython import raymath
import numpy as np

keyboard = raylib.CyKeyboard()
mouse = raylib.CyMouse()


def main():

    m: raymath.CyVector2

    codepoints: np.ndarray[np.int32] = np.array(
        [256, 100, 100, 99],
        dtype=np.int32
    )

    utf8_bytes: bytes = raylib.CyText.load_utf8(codepoints)

    utf8_text: raylib.CyText = raylib.CyText(
        utf8_bytes,
        100,
        raylib.CyColor.green()
    )
    raylib.init_window(1000, 900, "Hello World")
    # raylib.set_target_fps(60)

    while not raylib.window_should_close():

        m = mouse.get_mouse_position()

        raylib.clear_background(raylib.CyColor.black())
        raylib.draw_fps(0, 0)
        raylib.begin_drawing()

        utf8_text.pos = m
        if mouse.is_mouse_button_down(mouse.MOUSE_BUTTON_LEFT):
            utf8_text.draw()

        raylib.end_drawing()

    raylib.close_window()


if __name__ == "__main__":
    main()
