if (MSVC)
    add_compile_options(/utf-8)
endif()

option(USE_EMBED_LIBRARY "Use embed ogg and vorbis library first." ON)

if (NOT USE_EMBED_LIBRARY)
    find_package(Ogg)
    if (NOT Ogg_FOUND)
        add_subdirectory(ogg)
    endif()
    find_package(Vorbis REQUIRED)
else()
    add_subdirectory(ogg)
    add_subdirectory(vorbis)
endif()

add_subdirectory(hmc)
add_subdirectory(vorbisacm)
