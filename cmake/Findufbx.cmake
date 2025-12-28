if(TARGET ufbx::ufbx)
    return()
endif()

message(STATUS "Fetching ufbx")
include(CPM)
CPMAddPackage(
    NAME ufbx
    GIT_REPOSITORY https://github.com/ufbx/ufbx.git
    GIT_TAG v0.21.2
)

if(NOT ufbx_SOURCE_DIR)
  set(ufbx_FOUND FALSE)
  return()
endif()

add_library(ufbx STATIC "${ufbx_SOURCE_DIR}/ufbx.c")
add_library(ufbx::ufbx ALIAS ufbx)

target_include_directories(ufbx PUBLIC "${ufbx_SOURCE_DIR}")

set_target_properties(ufbx PROPERTIES
  C_STANDARD 99
  C_STANDARD_REQUIRED YES
)

set(ufbx_FOUND TRUE)