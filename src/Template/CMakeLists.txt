file(GLOB SRC_FILES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/*.hpp")
add_executable(Template
  ${SRC_FILES}
  ${CMAKE_SOURCE_DIR}/deps/glad/src/glad.c
)

target_include_directories(Template PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_sources(Template PRIVATE ${HEADER_FILES} ${SOURCE_FILES})

target_link_libraries(Template PUBLIC
  glfw
  OpenGL::GL
  glad
  imgui
)