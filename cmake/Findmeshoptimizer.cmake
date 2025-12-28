if(TARGET meshoptimizer::meshoptimizer)
    return()
endif()

message(STATUS "Fetching mesh optimizer")
include(CPM)
CPMAddPackage(
    NAME meshoptimizer
    GIT_REPOSITORY https://github.com/zeux/meshoptimizer.git
    GIT_TAG v1.0
    OPTIONS "MESHOPT_BUILD_DEMO OFF" "MESHOPT_BUILD_GLTFPACK OFF" "MESHOPT_BUILD_SHARED_LIBS OFF"
)
set(meshoptimizer_FOUND TRUE)
add_library(meshoptimizer::meshoptimizer ALIAS meshoptimizer)