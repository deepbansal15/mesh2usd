cmake_minimum_required(VERSION 3.26 FATAL_ERROR)

# create project
project(mesh2usd)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# add dependencies
include(cmake/CPM.cmake)
include(cmake/compiler_config.cmake)

set(pxr_ROOT D:/projects/OpenUSD/pxr_install)
find_package(pxr REQUIRED)
find_package(OpenImageIO REQUIRED)
find_package(tinygltf REQUIRED)
find_package(meshoptimizer REQUIRED)
find_package(ufbx REQUIRED)

# add executable
add_executable(main main.cpp)

target_link_libraries(main 
PUBLIC 
    meshoptimizer::meshoptimizer
    ufbx::ufbx
    OpenImageIO::OpenImageIO
    OpenImageIO::OpenImageIO_Util
    tf
    sdf
    usd
    usdGeom
    usdLux
    usdRender
    usdSkel
    usdShade
    usdUtils
    usdVol
    hio
    arch
)

compile_config(main)

add_custom_command(TARGET main POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_directory
          "${ufbx_SOURCE_DIR}/data"
          "$<TARGET_FILE_DIR:main>/data"
  VERBATIM
)