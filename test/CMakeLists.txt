cmake_minimum_required (VERSION 3.12)
project (tests CXX)

FILE(GLOB TEST_SRC ${PROJECT_SOURCE_DIR}/*.cpp)
source_group("test" FILES ${TEST_SRC})
add_executable(raytrace_test ${TEST_SRC})
target_include_directories(raytrace_test PRIVATE ../src)
target_link_libraries(raytrace_test PRIVATE gtest gtest_main raytracelib)
