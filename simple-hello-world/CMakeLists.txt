cmake_minimum_required(VERSION 3.28)

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

project(simple-hello-world C)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)



include(cmake/RemoteDeps.cmake)
include(cmake/CommonProperties.cmake)


executable(${PROJECT_NAME} src/main.c)

target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)
