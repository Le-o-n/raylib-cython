from raylib cimport InitWindow, WindowShouldClose, BeginDrawing, EndDrawing, DrawText, RED, CloseWindow

InitWindow(600, 600 ,"Window")

while not WindowShouldClose():
    BeginDrawing()
    DrawText("Hello", 100, 100, 20, RED)
    EndDrawing()

CloseWindow()