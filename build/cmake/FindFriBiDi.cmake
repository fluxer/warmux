# - Try to find the FriBiDI
# Once done this will define
#
#  FRIBIDI_FOUND - system has FriBiDI
#  FRIBIDI_INCLUDES - the FriBiDI include directory
#  FRIBIDI_LIBRARIES - the libraries needed to use FriBiDI
#  FRIBIDI_DEFINITIONS - the compiler definitions needed to use FriBiDI
#
# Copyright (c) 2017, Ivailo Monev, <xakepa10@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.

if(FRIBIDI_INCLUDES AND FRIBIDI_LIBRARIES)
    set(FRIBIDI_FIND_QUIETLY TRUE)
endif()

if(NOT WIN32)
    include(FindPkgConfig)
    pkg_check_modules(PC_FRIBIDI QUIET fribidi)
endif()

find_path(FRIBIDI_INCLUDES
    NAMES
    fribidi.h
    PATH_SUFFIXES
    fribidi
    HINTS
    $ENV{FRIBIDIDIR}/include
    ${PC_FRIBIDI_INCLUDEDIR}
    ${INCLUDE_INSTALL_DIR}
)

find_library(FRIBIDI_LIBRARIES
    fribidi
    HINTS
    $ENV{FRIBIDIDIR}/lib
    ${PC_FRIBIDI_LIBDIR}
    ${LIB_INSTALL_DIR}
)

# not definitions but rather compiler flags required for the dependencies (glib)
set(FRIBIDI_DEFINITIONS ${PC_FRIBIDI_CFLAGS})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FRIBIDI
    VERSION_VAR PC_FRIBIDI_VERSION
    REQUIRED_VARS FRIBIDI_LIBRARIES FRIBIDI_INCLUDES
)

mark_as_advanced(FRIBIDI_INCLUDES FRIBIDI_LIBRARIES FRIBIDI_DEFINITIONS)
