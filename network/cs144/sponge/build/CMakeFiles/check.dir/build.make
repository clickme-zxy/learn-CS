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

# Utility rule file for check.

# Include the progress variables for this target.
include CMakeFiles/check.dir/progress.make

CMakeFiles/check:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zhangxinyi/learn-CS/network/cs144/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Testing libsponge..."
	../tun.sh check 144 145
	../tap.sh check 10
	/usr/bin/ctest --output-on-failure --timeout 10 -R '^t_|^arp_|^router_'

check: CMakeFiles/check
check: CMakeFiles/check.dir/build.make

.PHONY : check

# Rule to build all files generated by this target.
CMakeFiles/check.dir/build: check

.PHONY : CMakeFiles/check.dir/build

CMakeFiles/check.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/check.dir/cmake_clean.cmake
.PHONY : CMakeFiles/check.dir/clean

CMakeFiles/check.dir/depend:
	cd /home/zhangxinyi/learn-CS/network/cs144/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxinyi/learn-CS/network/cs144/sponge /home/zhangxinyi/learn-CS/network/cs144/sponge /home/zhangxinyi/learn-CS/network/cs144/sponge/build /home/zhangxinyi/learn-CS/network/cs144/sponge/build /home/zhangxinyi/learn-CS/network/cs144/sponge/build/CMakeFiles/check.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/check.dir/depend
