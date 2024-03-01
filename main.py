
from raylib_cython import raylib


def main():

    raylib.CyWindow.init_window(1000, 500, "Hello World")

    while not raylib.CyWindow.window_should_close():
        raylib.CyMode.begin_drawing()

        raylib.CyMode.end_drawing()

    raylib.CyWindow.close_window()


if __name__ == "__main__":
    main()
