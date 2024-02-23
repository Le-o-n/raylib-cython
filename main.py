import timeit
from raylib_cython import raymath


def main():

    x = raymath.CyVector2(69, 69)
    y = raymath.CyVector2(100, 100)

    print(y.x)


if __name__ == "__main__":
    main()
