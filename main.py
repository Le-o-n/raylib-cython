
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
    q: raymath.CyMatrix = raymath.CyMatrix()

    q.set_element(0, 0, 69.0)

    f16: raymath.CyFloat16 = q.to_float16()

    for i in range(16):
        print(f16.get_float(i))


if __name__ == "__main__":
    main()
