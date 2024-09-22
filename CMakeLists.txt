cmake_minimum_required(VERSION 3.13)
project(Rendering VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_compile_definitions(
  # Exclude unnecessary APIs.
  WIN32_LEAN_AND_MEAN

  # Use Unicode charset.
  UNICODE
  _UNICODE
)

add_compile_options(
  # Enable correct reporting of C++ version, see https://docs.microsoft.com/en-us/cpp/build/reference/zc-cplusplus.
  $<$<BOOL:MSVC>:/Zc:__cplusplus>

  # Mark all dependencies headers as external.
  $<$<BOOL:MSVC>:/external:I${PROJECT_SOURCE_DIR}/deps>
)

# Add GLFW
add_subdirectory(deps/glfw)

# Find OpenGL package
find_package(OpenGL REQUIRED)

# Add your project's source files
add_executable(${PROJECT_NAME} 
    src/main.cpp
)

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/deps/glfw/include
)

# Link libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
  glfw
  OpenGL::GL
)
