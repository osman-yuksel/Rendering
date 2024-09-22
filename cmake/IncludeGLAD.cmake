# Add GLAD
add_library(glad STATIC
  ${CMAKE_CURRENT_SOURCE_DIR}/deps/glad/src/glad.c
)
set_target_properties(glad PROPERTIES FOLDER "Dependencies")

target_include_directories(glad PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/deps/glad/include
)

target_link_libraries(${PROJECT_NAME} PRIVATE
  glad
)