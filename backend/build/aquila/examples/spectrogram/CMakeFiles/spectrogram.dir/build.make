# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake28/2.8.12.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake28/2.8.12.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/local/Cellar/cmake28/2.8.12.2/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/felixtripier/code/howler-monkey/backend/aquila

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/felixtripier/code/howler-monkey/backend/build/aquila

# Include any dependencies generated for this target.
include examples/spectrogram/CMakeFiles/spectrogram.dir/depend.make

# Include the progress variables for this target.
include examples/spectrogram/CMakeFiles/spectrogram.dir/progress.make

# Include the compile flags for this target's objects.
include examples/spectrogram/CMakeFiles/spectrogram.dir/flags.make

examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o: examples/spectrogram/CMakeFiles/spectrogram.dir/flags.make
examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o: /Users/felixtripier/code/howler-monkey/backend/aquila/examples/spectrogram/spectrogram.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/felixtripier/code/howler-monkey/backend/build/aquila/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o"
	cd /Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/spectrogram.dir/spectrogram.cpp.o -c /Users/felixtripier/code/howler-monkey/backend/aquila/examples/spectrogram/spectrogram.cpp

examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/spectrogram.dir/spectrogram.cpp.i"
	cd /Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/felixtripier/code/howler-monkey/backend/aquila/examples/spectrogram/spectrogram.cpp > CMakeFiles/spectrogram.dir/spectrogram.cpp.i

examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/spectrogram.dir/spectrogram.cpp.s"
	cd /Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/felixtripier/code/howler-monkey/backend/aquila/examples/spectrogram/spectrogram.cpp -o CMakeFiles/spectrogram.dir/spectrogram.cpp.s

examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.requires:
.PHONY : examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.requires

examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.provides: examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.requires
	$(MAKE) -f examples/spectrogram/CMakeFiles/spectrogram.dir/build.make examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.provides.build
.PHONY : examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.provides

examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.provides.build: examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o

# Object files for target spectrogram
spectrogram_OBJECTS = \
"CMakeFiles/spectrogram.dir/spectrogram.cpp.o"

# External object files for target spectrogram
spectrogram_EXTERNAL_OBJECTS =

examples/spectrogram/spectrogram: examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o
examples/spectrogram/spectrogram: examples/spectrogram/CMakeFiles/spectrogram.dir/build.make
examples/spectrogram/spectrogram: libAquila.a
examples/spectrogram/spectrogram: lib/libOoura_fft.a
examples/spectrogram/spectrogram: examples/spectrogram/CMakeFiles/spectrogram.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable spectrogram"
	cd /Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spectrogram.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/spectrogram/CMakeFiles/spectrogram.dir/build: examples/spectrogram/spectrogram
.PHONY : examples/spectrogram/CMakeFiles/spectrogram.dir/build

examples/spectrogram/CMakeFiles/spectrogram.dir/requires: examples/spectrogram/CMakeFiles/spectrogram.dir/spectrogram.cpp.o.requires
.PHONY : examples/spectrogram/CMakeFiles/spectrogram.dir/requires

examples/spectrogram/CMakeFiles/spectrogram.dir/clean:
	cd /Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram && $(CMAKE_COMMAND) -P CMakeFiles/spectrogram.dir/cmake_clean.cmake
.PHONY : examples/spectrogram/CMakeFiles/spectrogram.dir/clean

examples/spectrogram/CMakeFiles/spectrogram.dir/depend:
	cd /Users/felixtripier/code/howler-monkey/backend/build/aquila && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/felixtripier/code/howler-monkey/backend/aquila /Users/felixtripier/code/howler-monkey/backend/aquila/examples/spectrogram /Users/felixtripier/code/howler-monkey/backend/build/aquila /Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram /Users/felixtripier/code/howler-monkey/backend/build/aquila/examples/spectrogram/CMakeFiles/spectrogram.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/spectrogram/CMakeFiles/spectrogram.dir/depend

