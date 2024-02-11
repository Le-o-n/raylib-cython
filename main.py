import timeit
from raylib_cython import raymath


def main():
    vec: raymath.CyVector3 = raymath.CyVector3(1, 2, 3)
    vec2: raymath.CyVector3 = raymath.CyVector3(2, 3, 4)
    f = vec2.length()
    print(f)

    # code_to_time1 = "vec.move_towards_inplace(tar, f)"
    # code_to_time2 = "vec.move_towards(tar, f)"
    # setup_code = "from raylib_cython import raymath\nvec = raymath.CyVector2(5, 5)\ntar = raymath.CyVector2(10, 10)\nf = 0.1"

    # execution_time1 = timeit.timeit(code_to_time1, setup=setup_code, number=10000000)
    # execution_time2 = timeit.timeit(code_to_time2, setup=setup_code, number=10000000)

    # print(f"Time taken: {execution_time1} seconds")
    # print(f"Time taken: {execution_time2} seconds")


if __name__ == "__main__":
    main()
