
from raylib_cython import raylib


def main():
    raylib.InitWindow(300, 300, b"Some title")

    while not raylib.WindowShouldClose():
        raylib.BeginDrawing()

        raylib.EndDrawing()

    raylib.CloseWindow()


if __name__ == "__main__":
    main()
