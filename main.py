import timeit
from raylib_cython import raymath


def main():
    raymath.CyMatrix.scale(2, 2, 2)

if __name__ == "__main__":
    main()
