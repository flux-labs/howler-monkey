# Install script for directory: /Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/felixtripier/code/howler-monkey/backend/build/aquila/lib/unittestpp/libUnitTest++.a")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libUnitTest++.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libUnitTest++.a")
    EXECUTE_PROCESS(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libUnitTest++.a")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/UnitTest++" TYPE FILE FILES
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/AssertException.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/CheckMacros.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/Checks.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/CompositeTestReporter.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/Config.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/CurrentTest.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/DeferredTestReporter.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/DeferredTestResult.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/ExceptionMacros.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/ExecuteTest.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/HelperMacros.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/MemoryOutStream.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/ReportAssert.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/ReportAssertImpl.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/Test.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestDetails.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestList.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestMacros.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestReporter.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestReporterStdout.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestResults.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestRunner.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TestSuite.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TimeConstraint.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/TimeHelpers.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/UnitTest++.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/UnitTestPP.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/XmlTestReporter.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/UnitTest++/Posix" TYPE FILE FILES
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/Posix/SignalTranslator.h"
    "/Users/felixtripier/code/howler-monkey/backend/aquila/lib/unittestpp/UnitTest++/Posix/TimeHelpers.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

