cmake_minimum_required(VERSION 2.8)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

project("MK4SDK")

set(MK4SDK_VERSION_MAJOR 1)
set(MK4SDK_VERSION_MINOR 0)
set(MK4SDK_VERSION ${MK4SDK_VERSION_MAJOR}.${MK4SDK_VERSION_MINOR})

find_package(SysUtils   REQUIRED)
find_package(MK4Strip   REQUIRED)
find_package(Alter3D    REQUIRED)
find_package(MK4Toolkit REQUIRED)

include(cmake/CompilerConfig.cmake  REQUIRED)
include_directories(include)
add_subdirectory(src/mk4tr)

add_executable (transp
    include/mk4sdk/decl.h
    include/mk4sdk/types.h
    include/transp/bmp.h
    src/transp/main.cpp
    src/transp/bmp.cpp
    )

add_executable (asefix
    src/asefix/main.cpp
    )

add_executable (injection
    src/injection/main.cpp
    )
