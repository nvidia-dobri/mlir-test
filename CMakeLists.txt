cmake_minimum_required(VERSION 3.20)
project(mlir-table-test LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Allow selecting MLIR version
if(NOT DEFINED MLIR_DIR)
  message(FATAL_ERROR "MLIR_DIR must be specified")
endif()

find_package(MLIR REQUIRED CONFIG)
message(STATUS "Using MLIR version: ${MLIR_VERSION}")

# Include MLIR CMake modules
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
include(TableGen)
include(AddMLIR)
include(AddLLVM)

# Include LLVM headers
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)
add_definitions(${MLIR_DEFINITIONS})

# Add our custom dialect
add_subdirectory(include)
add_subdirectory(lib)
add_subdirectory(tools)
