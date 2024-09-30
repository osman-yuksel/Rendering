@echo off
:: Check if the build directory exists
if not exist build (
    mkdir build
    if %errorlevel% neq 0 (
        echo Failed to create the build directory.
        exit /b 1
    )
)

:: Move into the build directory
cd build
if %errorlevel% neq 0 (
    echo Failed to enter the build directory.
    exit /b 1
)

:: Run CMake
cmake ..
if %errorlevel% neq 0 (
    echo CMake configuration failed.
    exit /b 1
)

:: Provide feedback
echo CMake successfully configured.
