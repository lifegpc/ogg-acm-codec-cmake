set(VORBIS_EXE_FILES
codec.cpp
codec.h
decode.cpp
decode.h
dump.cpp
encode.cpp
encode.h
resource.h
vorbisacm.h
vorbisacm.rc
vorbisacm.rct
)

add_executable(vorbisexe ${VORBIS_EXE_FILES})
target_link_libraries(vorbisexe PUBLIC hmc Ogg::ogg Vorbis::vorbis)
target_include_directories(vorbisexe PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/../")
set_target_properties(vorbisexe PROPERTIES
    OUTPUT_NAME "vorbis"
)

add_custom_target(vorbisdump "$<TARGET_FILE:vorbisexe>" ">" "${CMAKE_CURRENT_BINARY_DIR}/dump.inl")

add_library(vorbisacm SHARED ${VORBIS_EXE_FILES} vorbisacm.def)
add_dependencies(vorbisacm vorbisdump)
target_compile_definitions(vorbisacm PRIVATE _HAVE_DUMPEDFORMATDETAILS)
target_link_libraries(vorbisacm PUBLIC hmc Ogg::ogg Vorbis::vorbis)
target_include_directories(vorbisacm PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/../")
target_include_directories(vorbisacm PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")
set_target_properties(vorbisacm PROPERTIES
    OUTPUT_NAME "vorbis"
    SUFFIX ".acm"
)
