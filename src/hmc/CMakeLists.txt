set(HMC_SOURCES
accel.cpp
accel.h
acmdrv.cpp
acmdrv.h
com.cpp
com.h
dialog.cpp
dialog.h
driver.cpp
driver.h
link.cpp
link.h
menu.cpp
menu.h
mixer.cpp
mixer.h
mmutil.cpp
mmutil.h
module.cpp
module.h
registry.cpp
registry.h
"string.cpp"
"string.h"
sync.cpp
sync.h
time.cpp
time.h
util.cpp
util.h
window.cpp
window.h
)

add_library(hmc STATIC "${HMC_SOURCES}")

if (${CMAKE_C_COMPILER_ID} STREQUAL GNU)
    target_compile_options(hmc PRIVATE -fPIC)
endif()
