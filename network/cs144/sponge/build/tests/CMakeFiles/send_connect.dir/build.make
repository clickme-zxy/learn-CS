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
include tests/CMakeFiles/send_connect.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/send_connect.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/send_connect.dir/flags.make

tests/CMakeFiles/send_connect.dir/send_connect.cc.o: tests/CMakeFiles/send_connect.dir/flags.make
tests/CMakeFiles/send_connect.dir/send_connect.cc.o: ../tests/send_connect.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangxinyi/learn-CS/network/cs144/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/send_connect.dir/send_connect.cc.o"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/send_connect.dir/send_connect.cc.o -c /home/zhangxinyi/learn-CS/network/cs144/sponge/tests/send_connect.cc

tests/CMakeFiles/send_connect.dir/send_connect.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/send_connect.dir/send_connect.cc.i"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangxinyi/learn-CS/network/cs144/sponge/tests/send_connect.cc > CMakeFiles/send_connect.dir/send_connect.cc.i

tests/CMakeFiles/send_connect.dir/send_connect.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/send_connect.dir/send_connect.cc.s"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangxinyi/learn-CS/network/cs144/sponge/tests/send_connect.cc -o CMakeFiles/send_connect.dir/send_connect.cc.s

tests/CMakeFiles/send_connect.dir/send_connect.cc.o.requires:

.PHONY : tests/CMakeFiles/send_connect.dir/send_connect.cc.o.requires

tests/CMakeFiles/send_connect.dir/send_connect.cc.o.provides: tests/CMakeFiles/send_connect.dir/send_connect.cc.o.requires
	$(MAKE) -f tests/CMakeFiles/send_connect.dir/build.make tests/CMakeFiles/send_connect.dir/send_connect.cc.o.provides.build
.PHONY : tests/CMakeFiles/send_connect.dir/send_connect.cc.o.provides

tests/CMakeFiles/send_connect.dir/send_connect.cc.o.provides.build: tests/CMakeFiles/send_connect.dir/send_connect.cc.o


# Object files for target send_connect
send_connect_OBJECTS = \
"CMakeFiles/send_connect.dir/send_connect.cc.o"

# External object files for target send_connect
send_connect_EXTERNAL_OBJECTS =

tests/send_connect: tests/CMakeFiles/send_connect.dir/send_connect.cc.o
tests/send_connect: tests/CMakeFiles/send_connect.dir/build.make
tests/send_connect: tests/libspongechecks.a
tests/send_connect: libsponge/libsponge.a
tests/send_connect: tests/CMakeFiles/send_connect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangxinyi/learn-CS/network/cs144/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable send_connect"
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/send_connect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/send_connect.dir/build: tests/send_connect

.PHONY : tests/CMakeFiles/send_connect.dir/build

tests/CMakeFiles/send_connect.dir/requires: tests/CMakeFiles/send_connect.dir/send_connect.cc.o.requires

.PHONY : tests/CMakeFiles/send_connect.dir/requires

tests/CMakeFiles/send_connect.dir/clean:
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/send_connect.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/send_connect.dir/clean

tests/CMakeFiles/send_connect.dir/depend:
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxinyi/learn-CS/network/cs144/sponge /home/zhangxinyi/learn-CS/network/cs144/sponge/tests /home/zhangxinyi/learn-CS/network/cs144/sponge/build /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests /home/zhangxinyi/learn-CS/network/cs144/sponge/build/tests/CMakeFiles/send_connect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/send_connect.dir/depend
