#cimport raylib
#
#cpdef int main():
#
#    raylib.InitWindow(600, 600 ,"Window")
#
#    cdef raylib.Vector2 mouse_pos
#     
#
#    while not raylib.WindowShouldClose():
#        raylib.BeginDrawing()
#        raylib.ClearBackground(raylib.WHITE)
#        mouse_pos = raylib.GetMousePosition()
#
#        raylib.DrawFPS(0, 0)
#        raylib.DrawText("Hello", <int>mouse_pos.x, <int>mouse_pos.y, 20, raylib.RED)
#        raylib.EndDrawing()
#
#    raylib.CloseWindow()