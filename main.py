import timeit
from raylib_cython import raymath


def main():
    
    x: raymath.CyQuaternion
    
    z = raymath.CyQuaternion.identity()
    print(type(z))
    z = z.add(z)
    print(type(z))
    print(z.get_x())
    print(z.get_y())
    print(z.get_z())
    print(z.get_w())    
if __name__ == "__main__":
    main()
