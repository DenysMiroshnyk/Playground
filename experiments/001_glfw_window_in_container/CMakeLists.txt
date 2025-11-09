add_executable(window window.cpp)

find_package(glfw3 REQUIRED)
find_package(glad REQUIRED)

target_link_libraries(window PRIVATE glfw glad::glad)
