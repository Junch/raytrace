cmake_minimum_required (VERSION 3.12)
project (raytracelib CXX)

FILE(GLOB SRC ${PROJECT_SOURCE_DIR}/*.cpp)
source_group("src" FILES ${SRC})
add_library(raytracelib ${SRC})
