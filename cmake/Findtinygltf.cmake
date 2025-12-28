if(TARGET tinygltf::tinygltf)
    return()
endif()

message(STATUS "Fetching tiny gltf")
include(CPM)
CPMAddPackage(
    NAME tinygltf
    GIT_REPOSITORY https://github.com/syoyo/tinygltf.git
    GIT_TAG v2.9.7
    OPTIONS "TINYGLTF_BUILD_LOADER_EXAMPLE OFF" "TINYGLTF_INSTALL OFF" "TINYGLTF_HEADER_ONLY ON"
)
set(tinygltf_FOUND TRUE)
add_library(tinygltf::tinygltf ALIAS tinygltf)