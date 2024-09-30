add_subdirectory(deps/glfw)
set_target_properties(glfw PROPERTIES FOLDER "Dependencies")

find_package(OpenGL REQUIRED)