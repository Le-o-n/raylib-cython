from .raylib cimport InitWindow, CloseWindow, WindowShouldClose


cpdef void run():
    print("Running test")

    InitWindow(500, 599, "Window")

    while not WindowShouldClose():
        pass
    
    CloseWindow()
    
