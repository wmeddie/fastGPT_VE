# This overrides the default CMake Debug and Release compiler options.
# The user can still specify different options by setting the
# CMAKE_Fortran_FLAGS_[RELEASE,DEBUG] variables (on the command line or in the
# CMakeList.txt). This files serves as better CMake defaults and should only be
# modified if the default values are to be changed. Project specific compiler
# flags should be set in the CMakeList.txt by setting the CMAKE_Fortran_FLAGS_*
# variables.
if (CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    # gfortran
    set(common "-fPIC")
    set(CMAKE_Fortran_FLAGS_RELEASE_INIT "${common} -O3 -ffast-math")
    set(CMAKE_Fortran_FLAGS_DEBUG_INIT   "${common} -g -fcheck=all -fbacktrace")
elseif (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
    # ifort
    set(common "-warn all")
    set(CMAKE_Fortran_FLAGS_RELEASE_INIT "${common} -xHOST -O3 -no-prec-div -static")
    set(CMAKE_Fortran_FLAGS_DEBUG_INIT   "${common} -check all")
endif ()

