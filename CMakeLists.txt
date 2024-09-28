cmake_minimum_required(VERSION 3.23)
project(Rendering VERSION 1.0.0)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

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

file(GLOB SRC_FILES CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/src/*.cpp" "${CMAKE_SOURCE_DIR}/src/*.h" "${CMAKE_SOURCE_DIR}/src/*.hpp")

add_executable(${PROJECT_NAME} 
  ${SRC_FILES}
  ${CMAKE_SOURCE_DIR}/deps/glad/src/glad.c
)

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})

include(IncludeGLFW)
include(IncludeGLAD)