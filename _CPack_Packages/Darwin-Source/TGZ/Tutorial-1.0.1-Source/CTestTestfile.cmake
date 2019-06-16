# CMake generated Testfile for 
# Source directory: /Users/gzh/CLionProjects/Tutorial
# Build directory: /Users/gzh/CLionProjects/Tutorial
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(TutorialComp25 "Tutorial" "25")
set_tests_properties(TutorialComp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;66;add_test;/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;72;do_test;/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;0;")
add_test(TutorialComp-25 "Tutorial" "-25")
set_tests_properties(TutorialComp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is 0" _BACKTRACE_TRIPLES "/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;66;add_test;/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;73;do_test;/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;0;")
add_test(TutorialComp0.0001 "Tutorial" "0.0001")
set_tests_properties(TutorialComp0.0001 PROPERTIES  PASS_REGULAR_EXPRESSION "0.0001 is 0.01" _BACKTRACE_TRIPLES "/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;66;add_test;/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;74;do_test;/Users/gzh/CLionProjects/Tutorial/CMakeLists.txt;0;")
subdirs("MathFunctions")
