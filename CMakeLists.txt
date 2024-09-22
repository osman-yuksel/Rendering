cmake_minimum_required(VERSION 3.23)
project(Rendering VERSION 1.0.0 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_compile_definitions(
  # Exclude unnecessary APIs.
  WIN32_LEAN_AND_MEAN
  # Use Unicode charset.
  UNICODE
  _UNICODE
)

add_compile_options(
  $<$<BOOL:MSVC>:/external:I${PROJECT_SOURCE_DIR}/deps>
  $<$<BOOL:MSVC>:/external:W0>
)

add_executable(${PROJECT_NAME} 
  src/main.cpp
  deps/glad/src/glad.c
)

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})

include(IncludeGLFW)
include(IncludeGLAD)