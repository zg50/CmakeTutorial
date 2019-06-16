cmake_minimum_required(VERSION 3.13)

project(Tutorial)

# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
       "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
       "${PROJECT_BINARY_DIR}/TutorialConfig.h"
)

# should we use our own math functions?
# 相当于是个flag
option (USE_MYMATH "Use tutorial provided math implementation" ON) 
 
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
# include_directories("${PROJECT_BINARY_DIR}")

if (USE_MYMATH)
     include_directories("${PROJECT_SOURCE_DIR}/MathFunctions")
     add_subdirectory(MathFunctions)        # 将MathFunctions中的子目录也包含进去
     set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
     # set语法:set(<变量> <值> <值>)，把值赋给变量，多个值的话，就把多个值拼接赋给变量
endif (USE_MYMATH)

set(CMAKE_CXX_STANDARD 14)

add_executable(Tutorial main.cpp)
target_link_libraries(Tutorial  ${EXTRA_LIBS})

# add the install targets
install(TARGETS Tutorial DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"  DESTINATION include)

include(CTest)

#if(BUILD_TESTING)
#  # ... CMake code to create tests ...
#  # does the application run
#  # add_test(TutorialRuns Tutorial 25)
#
#  # does it sqrt of 25
#  add_test(TutorialComp25 Tutorial 25)
#  set_tests_properties (TutorialComp25 PROPERTIES PASS_REGULAR_EXPRESSION "25 is 5")
#
#  # does it handle negative numbers
#  add_test (TutorialNegative Tutorial -25)
#  set_tests_properties (TutorialNegative PROPERTIES PASS_REGULAR_EXPRESSION "-25 is 0")
#
#  # does it handle small numbers
#  add_test (TutorialSmall Tutorial 0.0001)
#  set_tests_properties (TutorialSmall PROPERTIES PASS_REGULAR_EXPRESSION "0.0001 is 0.01")
#
#  # does the usage message work?
#  add_test (TutorialUsage Tutorial)
#  set_tests_properties (TutorialUsage PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number")
#endif()

#define a macro to simplify adding tests, then use it
macro (do_test arg result)
    add_test (TutorialComp${arg} Tutorial ${arg})
    set_tests_properties (TutorialComp${arg}
            PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro (do_test)

# do a bunch of result based tests
do_test (25 "25 is 5")
do_test (-25 "-25 is 0")
do_test (0.0001 "0.0001 is 0.01")

# does this system provide the log and exp functions?
include(CheckFunctionExists)
# does this system provide the log and exp functions?
# include (${CMAKE_ROOT}/Modules/CheckFunctionExists.cmake)
check_function_exists(log HAVE_LOG)
check_function_exists(exp HAVE_EXP)

 
include (InstallRequiredSystemLibraries)
set (CPACK_RESOURCE_FILE_LICENSE  
     "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set (CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
set (CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
include (CPack)
