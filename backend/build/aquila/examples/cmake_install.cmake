# Install script for directory: /Users/felixtripier/code/howler-monkey/backend/aquila/examples

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/Users/felixtripier/code/howler-monkey/dist")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/utility_functions/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/frame_iteration/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/wave_info/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/wave_iteration/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/window_plot/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/window_usage/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/text_plot/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/sine_generator/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/square_generator/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/triangle_generator/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/generators/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/am_modulation/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/fft_comparison/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/fft_simple_spectrum/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/fft_filter/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/mfcc_calculation/cmake_install.cmake")
  INCLUDE("/Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/dtw_path_recovery/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

