find_path(Ogg_INCLUDE_DIR ogg/ogg.h)
find_library(Ogg_LIBRARY NAMES ogg ogg_static libogg libogg_static)

include(FindPackageHandleStandardArgs)

if (Ogg_INCLUDE_DIR AND Ogg_LIBRARY)
    set(Ogg_FOUND TRUE)
endif()

find_package_handle_standard_args(Ogg
    FOUND_VAR
        Ogg_FOUND
    REQUIRED_VARS
        Ogg_LIBRARY
        Ogg_INCLUDE_DIR
)

if (Ogg_FOUND)
    set(Ogg_INCLUDE_DIRS ${Ogg_INCLUDE_DIR})
    set(Ogg_LIBRARIES ${Ogg_LIBRARY})
    if (NOT TARGET Ogg::ogg)
        add_library(Ogg::ogg UNKNOWN IMPORTED)
        set_target_properties(Ogg::ogg PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${Ogg_INCLUDE_DIRS}"
            IMPORTED_LOCATION "${Ogg_LIBRARIES}"
        )
    endif()
endif()
