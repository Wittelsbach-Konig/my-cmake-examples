if(NOT OUTPUT_ROOT)
  set(OUTPUT_ROOT ${CMAKE_SOURCE_DIR}/out)
endif()

message(STATUS "Build output path: ${OUTPUT_ROOT}")

set(_debug_bin "${OUTPUT_ROOT}/Debug/bin")
set(_debug_lib "${OUTPUT_ROOT}/Debug/lib")

set(_release_bin "${OUTPUT_ROOT}/Release/bin")
set(_release_lib "${OUTPUT_ROOT}/Release/lib")

function(common_properties TGT_NAME)
  set_target_properties(${TGT_NAME} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY_DEBUG ${_debug_bin}
        RUNTIME_OUTPUT_DIRECTORY_RELEASE ${_release_bin}
        ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${_debug_lib}
        ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${_release_lib}
        # When targeting Windows, we want DLLs to land next to executables
        LIBRARY_OUTPUT_DIRECTORY_DEBUG   $<IF:$<STREQUAL:$<PLATFORM_ID>,Windows>, ${_debug_bin},   ${_debug_lib}>
        LIBRARY_OUTPUT_DIRECTORY_RELEASE $<IF:$<STREQUAL:$<PLATFORM_ID>,Windows>, ${_release_bin}, ${_release_lib}>
    )
endfunction()

macro(executable TGT_NAME)
  add_executable(${TGT_NAME} ${ARGN})
  common_properties(${TGT_NAME})
endmacro()

macro(library TGT_NAME)
  add_library(${TGT_NAME} ${ARGN})
  common_properties(${TGT_NAME})
endmacro()
