
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
    vec: raymath.CyVector2 = raymath.CyVector2()
    vec2: raymath.CyVector2 = raymath.CyVector2()

    vec.set_x(10)
    vec.set_y(10)
    vec2.set_x(1)
    vec2.set_y(2)

    for i in range(20):
        vec.add_inplace(vec2)
        print(vec.get_x())
        print(vec.get_y())
        print("---")


if __name__ == "__main__":
    main()
