# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhangxinyi/learn-CS/network/cs144/sponge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhangxinyi/learn-CS/network/cs144/sponge/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/recv_transmit.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/recv_transmit.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/recv_transmit.dir/flags.make

tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o: tests/CMakeFiles/recv_transmit.dir/flags.make
tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o: ../tests/recv_transmit.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangxinyi/learn-CS/network/cs144/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/recv_transmit.dir/recv_transmit.cc.o -c /home/zhangxinyi/learn-CS/network/cs144/sponge/tests/recv_transmit.cc

tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/recv_transmit.dir/recv_transmit.cc.i"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangxinyi/learn-CS/network/cs144/sponge/tests/recv_transmit.cc > CMakeFiles/recv_transmit.dir/recv_transmit.cc.i

tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/recv_transmit.dir/recv_transmit.cc.s"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangxinyi/learn-CS/network/cs144/sponge/tests/recv_transmit.cc -o CMakeFiles/recv_transmit.dir/recv_transmit.cc.s

tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.requires:

.PHONY : tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.requires

tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.provides: tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.requires
	$(MAKE) -f tests/CMakeFiles/recv_transmit.dir/build.make tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.provides.build
.PHONY : tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.provides

tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.provides.build: tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o


# Object files for target recv_transmit
recv_transmit_OBJECTS = \
"CMakeFiles/recv_transmit.dir/recv_transmit.cc.o"

# External object files for target recv_transmit
recv_transmit_EXTERNAL_OBJECTS =

tests/recv_transmit: tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o
tests/recv_transmit: tests/CMakeFiles/recv_transmit.dir/build.make
tests/recv_transmit: tests/libspongechecks.a
tests/recv_transmit: libsponge/libsponge.a
tests/recv_transmit: tests/CMakeFiles/recv_transmit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangxinyi/learn-CS/network/cs144/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable recv_transmit"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/recv_transmit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/recv_transmit.dir/build: tests/recv_transmit

.PHONY : tests/CMakeFiles/recv_transmit.dir/build

tests/CMakeFiles/recv_transmit.dir/requires: tests/CMakeFiles/recv_transmit.dir/recv_transmit.cc.o.requires

.PHONY : tests/CMakeFiles/recv_transmit.dir/requires

tests/CMakeFiles/recv_transmit.dir/clean:
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/recv_transmit.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/recv_transmit.dir/clean

tests/CMakeFiles/recv_transmit.dir/depend:
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxinyi/learn-CS/network/cs144/sponge /home/zhangxinyi/learn-CS/network/cs144/sponge/tests /home/zhangxinyi/learn-CS/network/cs144/sponge/build /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests/CMakeFiles/recv_transmit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/recv_transmit.dir/depend

