cmake_minimum_required(VERSION 2.6)
include(CheckCXXSourceCompiles)

macro(CHECK_CXX_COMPILER_FLAG _FLAG _RESULT)
   set(SAFE_CMAKE_REQUIRED_DEFINITIONS "${CMAKE_REQUIRED_DEFINITIONS}")
   set(CMAKE_REQUIRED_DEFINITIONS "${_FLAG}")
   CHECK_CXX_SOURCE_COMPILES("int main() { return 0;}" ${_RESULT}
         # Some compilers do not fail with a bad flag
         FAIL_REGEX "command line option .* is valid for .* but not for C\\\\+\\\\+" # GNU
         FAIL_REGEX "unrecognized .*option"                     # GNU
         FAIL_REGEX "unknown .*option"                          # Clang
         FAIL_REGEX "invalid value"                             # Clang
         FAIL_REGEX "ignoring unknown option"                   # MSVC
         FAIL_REGEX "warning D9002"                             # MSVC, any lang
         FAIL_REGEX "option.*not supported"                     # Intel
         FAIL_REGEX "invalid argument .*option"                 # Intel
         FAIL_REGEX "ignoring option .*argument required"       # Intel
         FAIL_REGEX "[Uu]nknown option"                         # HP
         FAIL_REGEX "[Ww]arning: [Oo]ption"                     # SunPro
         FAIL_REGEX "command option .* is not recognized"       # XL
         FAIL_REGEX "not supported in this configuration; ignored" # AIX
         FAIL_REGEX "File with unknown suffix passed to linker" # PGI
         FAIL_REGEX "WARNING: unknown flag:"                    # Open64
         )
   set(CMAKE_REQUIRED_DEFINITIONS "${SAFE_CMAKE_REQUIRED_DEFINITIONS}")
endmacro(CHECK_CXX_COMPILER_FLAG)

set(CMAKE_CXX_FLAGS "-pipe -mtune=native -Wall -Wextra -pedantic -Wpointer-arith -Wcast-align -Wwrite-strings -Wredundant-decls -Winline -Wuninitialized -Wconversion -fshort-enums")
set(CMAKE_CXX_FLAGS_RELEASE "-Ofast -fmessage-length=0 -fno-rtti -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g -fmessage-length=0 -DNDEBUG")
set(CMAKE_CXX_FLAGS_DEBUG "-g -Og")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-s")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "-s")
set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "-s")

# ensure C++14 support
CHECK_CXX_COMPILER_FLAG("-std=c++14" COMPILER_SUPPORTS_CXX14)
CHECK_CXX_COMPILER_FLAG("-std=c++1y" COMPILER_SUPPORTS_CXX0X)

if(COMPILER_SUPPORTS_CXX14)
        add_definitions(-std=c++14)
elseif(COMPILER_SUPPORTS_CXX0X)
        add_definitions(-std=c++1y)
else()
        message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++14 support.")
endif()

# forced use of optimized instruction set
add_definitions(-msse -msse2 -msse3 -mavx)
