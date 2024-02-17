import timeit
from raylib_cython import raymath


def main():
    
    x: raymath.CyVector2 = raymath.CyVector2()
    
    x.x = 100
    x.y = 200
    print(x.x)
    print(x.y) 
    x.normalize_inplace()
    
    print(x.x)
    print(x.y)   
if __name__ == "__main__":
    main()
