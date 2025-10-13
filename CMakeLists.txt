cmake_minimum_required(VERSION 3.25)
project(Playground LANGUAGES CXX)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type" FORCE)
endif()

message(STATUS "Using build type: ${CMAKE_BUILD_TYPE}")

# -------------------------
# Conan 2.x install
# -------------------------
# Output folder for Conan
set(CONAN_OUTPUT_DIR "${CMAKE_BINARY_DIR}/conan")

# Build the Conan command
set(CONAN_CMD
    conan install "${CMAKE_SOURCE_DIR}"
    --output-folder "${CONAN_OUTPUT_DIR}"
    --build=missing
    -s build_type=${CMAKE_BUILD_TYPE}
)

message(STATUS "Running Conan install: ${CONAN_CMD}")

# Execute Conan
execute_process(
    COMMAND ${CONAN_CMD}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    RESULT_VARIABLE _conan_result
    OUTPUT_VARIABLE _conan_out
    ERROR_VARIABLE _conan_err
)

if(NOT _conan_result EQUAL 0)
    message(FATAL_ERROR "Conan install FAILED (exit ${_conan_result}).\nSTDOUT:\n${_conan_out}\nSTDERR:\n${_conan_err}")
endif()

message(STATUS "Conan install finished; generator files in: ${CONAN_OUTPUT_DIR}")

# -------------------------
# Include Conan-generated toolchain
# -------------------------
if(EXISTS "${CONAN_OUTPUT_DIR}/conan_toolchain.cmake")
    include("${CONAN_OUTPUT_DIR}/conan_toolchain.cmake")
else()
    message(FATAL_ERROR "Expected file not found: ${CONAN_OUTPUT_DIR}/conan_toolchain.cmake")
endif()

# -------------------------
# Add subdirectories
# -------------------------
add_subdirectory(experiments/000_env_check)
