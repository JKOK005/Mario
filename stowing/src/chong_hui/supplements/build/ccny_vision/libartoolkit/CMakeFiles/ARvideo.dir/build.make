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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build

# Include any dependencies generated for this target.
include ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/depend.make

# Include the progress variables for this target.
include ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/progress.make

# Include the compile flags for this target's objects.
include ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/flags.make

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/flags.make
ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o: /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/ccvt_c.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o"
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o   -c /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/ccvt_c.c

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.i"
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/ccvt_c.c > CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.i

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.s"
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/ccvt_c.c -o CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.s

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.requires:
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.requires

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.provides: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.requires
	$(MAKE) -f ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/build.make ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.provides.build
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.provides

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.provides.build: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/flags.make
ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o: /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/video.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o"
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o   -c /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/video.c

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.i"
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/video.c > CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.i

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.s"
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit/src/VideoLinuxV4L/video.c -o CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.s

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.requires:
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.requires

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.provides: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.requires
	$(MAKE) -f ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/build.make ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.provides.build
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.provides

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.provides.build: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o

# Object files for target ARvideo
ARvideo_OBJECTS = \
"CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o" \
"CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o"

# External object files for target ARvideo
ARvideo_EXTERNAL_OBJECTS =

/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/libARvideo.so: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o
/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/libARvideo.so: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o
/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/libARvideo.so: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/build.make
/home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/libARvideo.so: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/libARvideo.so"
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ARvideo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/build: /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/devel/lib/libARvideo.so
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/build

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/requires: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/ccvt_c.c.o.requires
ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/requires: ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/src/VideoLinuxV4L/video.c.o.requires
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/requires

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/clean:
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit && $(CMAKE_COMMAND) -P CMakeFiles/ARvideo.dir/cmake_clean.cmake
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/clean

ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/depend:
	cd /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/src/ccny_vision/libartoolkit /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit /home/conghui/NTU_Amazon_Picking_Challenge/demo_manipulation/src/supplements/build/ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ccny_vision/libartoolkit/CMakeFiles/ARvideo.dir/depend
