file(GLOB SRC_FILES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/*.hpp")
add_executable(RayTracing
  ${SRC_FILES}
  ${CMAKE_SOURCE_DIR}/deps/glad/src/glad.c
)

target_include_directories(RayTracing PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(RayTracing PRIVATE ${HEADER_FILES} ${SOURCE_FILES})

target_link_libraries(RayTracing PUBLIC
  glfw
  OpenGL::GL
  glad
  imgui
)