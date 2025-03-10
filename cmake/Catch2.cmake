#
# Set how to find dependency Catch2.
# Option USE_BUNDLED_CATCH2:
# * ON - use Catch2 header from extern subdirectory
# * OFF - use Catch2 installed in the system
#
option(USE_BUNDLED_CATCH2 "Use bundled version of Catch2." OFF)

add_library(catch2-interface INTERFACE)

if (USE_BUNDLED_CATCH2)
    target_include_directories(catch2-interface INTERFACE ${CMAKE_SOURCE_DIR}/extern)
    return()
endif()

find_package(Catch2 REQUIRED)

target_link_libraries(catch2-interface INTERFACE Catch2::Catch2)
if (Catch2_VERSION_MAJOR GREATER_EQUAL 3)
    target_compile_definitions(catch2-interface INTERFACE CATCH2_V3)
endif()
