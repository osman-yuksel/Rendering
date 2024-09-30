cmake_minimum_required(VERSION 3.23)
project(Rendering VERSION 1.0.0)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

if(MSVC)
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
endif()

if(UNIX)
  add_custom_target(run
    COMMAND ${PROJECT_NAME}
    DEPENDS ${PROJECT_NAME}
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running the application..."
  )
endif()

include(IncludeGLFW)
include(IncludeGLAD)
include(IncludeImGui)

add_subdirectory(src)