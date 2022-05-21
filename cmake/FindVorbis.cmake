find_path(Vorbis_INCLUDE_DIR vorbis/codec.h)
find_library(Vorbis_LIBRARY NAMES vorbis vorbis_static libvorbis libvorbis_static)

find_package(Ogg)

include(FindPackageHandleStandardArgs)

if (Vorbis_INCLUDE_DIR AND Vorbis_LIBRARY)
    set(Vorbis_FOUND TRUE)
endif()

find_package_handle_standard_args(Vorbis
    FOUND_VAR
        Vorbis_FOUND
    REQUIRED_VARS
        Vorbis_LIBRARY
        Vorbis_INCLUDE_DIR
)

if (Vorbis_FOUND)
    set(Vorbis_INCLUDE_DIRS ${Vorbis_INCLUDE_DIR})
    if (Ogg_FOUND)
        set(Vorbis_LIBRARIES ${Vorbis_LIBRARY} ${Ogg_LIBRARY})
    endif()
    if (NOT TARGET Vorbis::vorbis)
        add_library(Vorbis::vorbis UNKNOWN IMPORTED)
        set_target_properties(Vorbis::vorbis PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${Vorbis_INCLUDE_DIRS}"
            IMPORTED_LOCATION "${Vorbis_LIBRARY}"
        )
        if (TARGET Ogg::ogg)
            set_target_properties(Vorbis::vorbis PROPERTIES
                INTERFACE_LINK_LIBRARIES Ogg::ogg
            )
        endif()
    endif()
endif()
