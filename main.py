
from raylib_cython import raylib, raymath


def main():
    # raylib.InitWindow(300, 300, b"Some title")
    #
    # while not raylib.WindowShouldClose():
    #    raylib.BeginDrawing()
    #
    #    raylib.EndDrawing()
    #
    # raylib.CloseWindow()
    vec: raymath.CyVector2 = raymath.CyVector2(60, 222)
    vec2: raymath.CyVector2 = raymath.CyVector2(55, 1231)

    print(vec.get_x())
    print(vec.get_y())
    print(vec2.get_x())
    print(vec2.get_y())


if __name__ == "__main__":
    main()
