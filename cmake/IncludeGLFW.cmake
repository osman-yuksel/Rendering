# Add GLFW
add_subdirectory(deps/glfw)
set_target_properties(glfw PROPERTIES FOLDER "Dependencies")

find_package(OpenGL REQUIRED)

target_link_libraries(${PROJECT_NAME} PRIVATE
  glfw
  OpenGL::GL
)