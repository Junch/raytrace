cmake_minimum_required (VERSION 3.12)
project (raytrace CXX)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# 设置C++标准为C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if (MSVC)
  # make the Release version create a PDB
  set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /Zi")
  # minimize the size or the resulting EXE
  set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /DEBUG /OPT:REF /OPT:ICF")
else()
  # lots of warnings and all warnings as errors
  add_compile_options(-Wall -Wextra -pedantic -Wno-unused-parameter -Wno-sign-compare -Werror)
endif()

###############################################################################
# Title: Override option in CMake subproject
# Web: https://stackoverflow.com/questions/14061605/override-option-in-cmake-subproject
##############################################################################
option(gtest_force_shared_crt "" ON)
add_subdirectory("thirdparty/googletest")

set (install_dir ${CMAKE_BINARY_DIR}/thirdparty)
include_directories(${install_dir}/include)
link_directories(${install_dir}/lib)

# add_subdirectory(src)
add_subdirectory(test)
